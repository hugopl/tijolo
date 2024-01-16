{% skip_file if flag?(:no_terminal) %}

require "vte"

class TerminalView < View
  @term = Vte::Terminal.new

  delegate grab_focus, to: @term

  def initialize
    super(@term)
    self.label = "Terminal"

    argv0 = Config.instance.terminal_login_shell? ? "-#{TerminalView.default_shell}" : TerminalView.default_shell

    @term.spawn_async(
      pty_flags: :default,
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

    connect(@term.child_exited_signal) do
      activate_action("win.close_view", nil)
    end
  end

  def self.default_shell : String
    @@default_shell ||= ENV["SHELL"]? || "/usr/bin/sh"
  end

  def copy_to_clipboard : Nil
    @term.copy_clipboard_format(:text)
  end

  def paste_from_clipboard : Nil
    @term.paste_primary
  end
end
