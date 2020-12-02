require "./vte"
require "./view"

class TerminalView < View
  @@terminal_count = 1

  def initialize
    @vte = Vte::Terminal.new
    super(@vte, nil, nil)

    self.virtual = true
    self.label = @@terminal_count > 1 ? "Terminal #{@@terminal_count}" : "Terminal"
    @@terminal_count += 1

    argv0 = Config.instance.terminal_login_shell? ? "-#{TerminalView.default_shell}" : TerminalView.default_shell

    @vte.spawn_async(
      pty_flags: Vte::PtyFlags::DEFAULT,
      working_directory: nil,
      argv: [TerminalView.default_shell, argv0],
      envv: nil,
      spawn_flags: :file_and_argv_zero,
      child_setup: nil,
      child_setup_data: nil,
      child_setup_data_destroy: nil,
      timeout: -1,
      cancellable: nil,
      callback: nil,
      user_data: nil
    )
    @vte.on_child_exited do
      notify_view_close_requested(self)
    end
  end

  def self.default_shell : String
    @@default_shell ||= ENV["SHELL"]? || "/usr/bin/sh"
  end

  def modified? : Bool
    false
  end

  def can_share_node? : Bool
    Config.instance.terminal_shared_view?
  end
end
