require "./locator_provider"

class FileLocator < LocatorProvider
  # Number of file locator matches to show in the UI
  MAX_LOCATOR_ITEMS = 25

  getter model

  @last_results = [] of Fzy::Match

  def initialize(@project : Project)
    super()
    @project_haystack = Fzy::PreparedHaystack.new(@project.files.map(&.to_s))
  end

  def shortcut : Char
    'f' # not user, this is the default locator provider.
  end

  def best_result : String?
    @last_results.first?.try(&.value)
  end

  def results_size : Int32
    @last_results.size
  end

  def activate(locator, file : String)
    locator.notify_locator_open_file(@project.root.join(file).to_s)
  end

  def search_changed(search_text : String) : Nil
    start_time = Time.monotonic

    reset_search_model
    reset_time = Time.monotonic

    @last_results = Fzy.search(search_text, @project_haystack)
    @last_results.delete_at(MAX_LOCATOR_ITEMS..-1) if @last_results.size > MAX_LOCATOR_ITEMS
    fzy_time = Time.monotonic

    # Set visible values
    iter = Gtk::TreeIter.new
    @last_results.each do |match|
      tree_path = Gtk::TreePath.new_from_indices({match.index})
      @model.iter(iter, tree_path)
      @model.set(iter, {LABEL_COLUMN, VISIBLE_COLUMN, SCORE_COLUMN}, {markup(match), true, match.score})
    end

    gtk_time = Time.monotonic
    total = gtk_time - start_time
    gtk_total = (reset_time - start_time) + (gtk_time - fzy_time)
    fzy_total = (fzy_time - reset_time)
    Log.debug { "Locator found #{@last_results.size} results: total: #{total} fzy: #{fzy_total}, gtk: #{gtk_total}" }
  end

  def markup(match)
    value = match.value
    str_size = value.bytesize + match.positions.size * 7 # 7 is the size of the extra markup
    pos_iter = match.positions.each
    next_pos = pos_iter.next
    String.build(str_size) do |str|
      value.each_char_with_index do |char, i|
        if i == next_pos
          str << "<b>#{char}</b>"
          next_pos = pos_iter.next
        else
          str << char
        end
      end
    end
  end

  protected def populate_model : Nil
    iter = Gtk::TreeIter.new
    @project.files.each do |file|
      @model.append(iter)
      @model.set(iter, {LABEL_COLUMN, VISIBLE_COLUMN}, {file.to_s, false})
    end
    true
  end

  private def reset_search_model
    iter = Gtk::TreeIter.new
    @last_results.each do |match|
      tree_path = Gtk::TreePath.new_from_indices({match.index})
      @model.iter(iter, tree_path)
      @model.set(iter, {LABEL_COLUMN, VISIBLE_COLUMN, SCORE_COLUMN}, {match.value, false, -Float64::INFINITY})
    end
  end
end
