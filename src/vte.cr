require_gobject "Vte"

module Vte
  class Terminal
    def spawn_async(pty_flags : Vte::PtyFlags,
                    working_directory : ::String?,
                    argv : ::Enumerable,
                    envv : ::Enumerable?,
                    spawn_flags : GLib::SpawnFlags,
                    child_setup : GLib::SpawnChildSetupFunc?,
                    child_setup_data : Void*?,
                    child_setup_data_destroy : GLib::DestroyNotify?,
                    timeout : ::Int,
                    cancellable : Gio::Cancellable?,
                    callback : Vte::TerminalSpawnAsyncCallback?,
                    user_data : Void*?) : Nil
      LibVte.terminal_spawn_async(@pointer.as(LibVte::Terminal*),
        pty_flags,
        working_directory ? working_directory.to_unsafe : nil,
        (__argv_ary = argv.map { |__item| __item.to_unsafe }.to_a).to_unsafe,
        envv ? (__envv_ary = envv.map { |__item| __item.to_unsafe }.to_a).to_unsafe : nil,
        spawn_flags,
        child_setup ? child_setup : nil,
        child_setup_data ? child_setup_data : nil,
        child_setup_data_destroy,
        Int32.new(timeout),
        cancellable ? cancellable.to_unsafe_cancellable : nil,
        callback ? callback : nil,
        user_data ? user_data : nil)
    end
  end
end
