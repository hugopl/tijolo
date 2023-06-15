require "vte"

class TerminalView < View
  @term = Vte::Terminal.new

  delegate grab_focus, to: @term

  def initialize
    super(@term, nil, "Terminal")

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

    @term.child_exited_signal.connect do
      activate_action("win.close_view", nil)
    end
  end

  def self.default_shell : String
    @@default_shell ||= ENV["SHELL"]? || "/usr/bin/sh"
  end

  def copy_text_to_clipboard
    @term.copy_clipboard_format(:text)
  end

  def paste_text_from_clipboard
    @term.paste_primary
  end

  def save : Nil
    # Maybe save output to HTML!?
  end
end
