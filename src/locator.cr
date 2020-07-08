require "fzy"

require "./locator_provider"
require "./document_symbol_locator"
require "./file_locator"
require "./line_locator"
require "./observable"
require "./ui_builder_helper"

module LocatorListener
  abstract def locator_open_file(file : String)
  abstract def locator_goto_line_col(line : Int32, column : Int32)
end

class Locator
  include UiBuilderHelper

  observable_by LocatorListener

  getter locator_widget : Gtk::Widget # Root widget for locator

  # project model columns
  PATH_COLUMN    = 0
  VISIBLE_COLUMN = 1
  SCORE_COLUMN   = 2

  @project : Project
  @locator_entry : Gtk::SearchEntry
  @locator_results : Gtk::TreeView
  @locator_focus_is_mine = false # True when focus is on locator entry or locator results, used to hide locator on focus lost

  @locator_providers = Hash(Char, LocatorProvider).new
  @default_locator_provider : LocatorProvider
  @current_locator_provider : LocatorProvider

  def initialize(@project)
    builder = builder_for("locator")
    @locator_widget = Gtk::Widget.cast(builder["locator_widget"])
    @locator_widget.ref

    @locator_entry = Gtk::SearchEntry.cast(builder["locator_entry"])
    @locator_entry.on_key_press_event(&->entry_key_pressed(Gtk::Widget, Gdk::EventKey))
    @locator_entry.on_activate(&->activated(Gtk::Entry))
    @locator_entry.connect("notify::text", &->search_changed)
    @locator_entry.after_focus_out_event(&->focus_out_event(Gtk::Widget, Gdk::EventFocus))

    @current_locator_provider = @default_locator_provider = FileLocator.new(@project)
    init_locators
    @locator_results = Gtk::TreeView.cast(builder["locator_results"])
    @locator_results.selection.mode = :browse
    @locator_results.model = @default_locator_provider.model
    @locator_results.on_row_activated(&->activated(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))
    @locator_results.on_key_press_event(&->results_key_pressed(Gtk::Widget, Gdk::EventKey))
    @locator_results.on_focus_out_event(&->focus_out_event(Gtk::Widget, Gdk::EventFocus))
  end

  def init_locators
    [LineLocator.new, DocumentSymbolLocator.new].each do |locator|
      @locator_providers[locator.shortcut] = locator
    end
  end

  def show(*, select_text : Bool, view : View?)
    if view != @current_view
      @current_locator_provider.unselected
      @current_locator_provider.selected(view)
    end

    @current_view = view
    @locator_widget.show
    if select_text
      @locator_entry.grab_focus
    else
      @locator_entry.grab_focus_without_selecting
    end
    @locator_results.set_cursor(0)
  end

  def hide
    @current_view = nil
    @locator_widget.hide
  end

  def text=(text : String)
    @locator_entry.text = text
    @locator_entry.position = text.size
  end

  private def focus_out_event(widget, event : Gdk::EventFocus) : Bool
    hide unless @locator_focus_is_mine

    @locator_focus_is_mine = false
    false
  end

  macro hide_locator_on_esc!
    if event.keyval == Gdk::KEY_Escape
      @locator_focus_is_mine = false
      hide
      return true
    end
  end

  private def entry_key_pressed(_widget, event : Gdk::EventKey)
    hide_locator_on_esc!

    if event.keyval == Gdk::KEY_Up
      return true
    elsif event.keyval == Gdk::KEY_Down
      return true if @current_locator_provider.results_size < 2 # First item is already selected...

      @locator_results.set_cursor(1)
      @locator_focus_is_mine = true
      @locator_results.grab_focus
      return true
    end
    false
  end

  private def results_key_pressed(_widget, event : Gdk::EventKey)
    hide_locator_on_esc!

    if event.keyval == Gdk::KEY_Up
      # Check if we are on first row.
      iter = Gtk::TreeIter.new
      return false unless @locator_results.model.not_nil!.iter_first(iter)
      return false unless @locator_results.selection.iter_is_selected(iter)

      @locator_focus_is_mine = true
      @locator_entry.grab_focus
      return true
    end

    false
  end

  private def search_changed
    text = @locator_entry.text
    locator = find_locator(text)
    if @current_locator_provider != locator
      @current_locator_provider.unselected
      locator.selected(@current_view)
      @current_locator_provider = locator
      @locator_results.model = @current_locator_provider.model
    end

    text = text[2..-1] if @current_locator_provider != @default_locator_provider

    @current_locator_provider.search_changed(text)
    @locator_results.set_cursor(0)
  end

  private def find_locator(text)
    return @default_locator_provider if text.size < 2 || !text[1].whitespace?

    @locator_providers[text[0]]? || @default_locator_provider
  end

  private def activated(widget : Gtk::Entry)
    activated(0)
  end

  private def activated(widget : Gtk::TreeView, tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    indices, _depth = tree_path.indices
    activated(indices.first)
  end

  private def activated(index : Int32)
    @current_locator_provider.activate(self, index)
    hide
  end
end
