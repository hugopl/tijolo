require "./tijolo_log_backend"

class NotificationEntry
  include UiBuilderHelper

  getter widget : Gtk::Box

  def initialize(parent, entry : Log::Entry)
    builder = builder_for("notification")
    @widget = Gtk::Box.cast(builder["notification"])
    label = Gtk::Label.cast(builder["notification_label"])
    label.label = entry.message
    icon = Gtk::Label.cast(builder["notification_icon"])
    icon.label = message_icon(entry)

    parent.add(@widget)
    @widget.show_all
  end

  private def message_icon(entry) : String
    case entry.severity
    when .info?           then "" # https://fontawesome.com/icons/check?style=solid
    when .warn?           then "" # https://fontawesome.com/icons/check-circle?style=solid
    when .error?, .fatal? then "" # https://fontawesome.com/icons/skull-crossbones?style=solid
    else
      ""
    end
  end
end

class NotificationArea
  include UiBuilderHelper
  include TijoloLogListener

  getter widget : Gtk::Widget
  @listbox : Gtk::Box
  @num_notifications = 0

  def initialize
    super
    builder = builder_for("notification_area")
    @widget = Gtk::Widget.cast(builder["root"])
    @listbox = Gtk::Box.cast(builder["listbox"])
    @widget.hide

    TijoloLogBackend.instance.add_tijolo_log_listener(self)
  end

  def tijolo_log_notification_arrived(entry : ::Log::Entry) : Nil
    notification = NotificationEntry.new(@listbox, entry)
    start_counter_to_destroy_notification(notification)
  end

  private def start_counter_to_destroy_notification(notification)
    @widget.show_all if @num_notifications.zero?
    @num_notifications += 1

    GLib.timeout(Config.instance.notification_delay) do
      @listbox.remove(notification.widget)
      @num_notifications -= 1
      @widget.hide if @num_notifications.zero?
      false
    end
  end
end
