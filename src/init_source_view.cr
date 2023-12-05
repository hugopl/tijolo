private def calculate_path_variations(usr_path : Path, dirname : String)
  paths = [usr_path.join("share/tijolo/#{dirname}/").expand.to_s,
           usr_path.join("local/share/tijolo/#{dirname}/").expand.to_s,
           Path.home.join(".local/share/tijolo/#{dirname}/").expand.to_s]
  # data dir has preference on debug builds
  {% unless flag?(:release) %}
    paths.unshift("#{__DIR__}/../../data/#{dirname}/")
  {% end %}
  paths
end

private def setup_language_manager_paths(usr_path : Path)
  manager = GtkSource::LanguageManager.default
  paths = calculate_path_variations(usr_path, "language-specs")
  manager.search_path = manager.search_path.to_a.concat(paths)
end

private def setup_style_scheme_manager_paths(usr_path : Path)
  manager = GtkSource::StyleSchemeManager.default
  paths = calculate_path_variations(usr_path, "styles")
  manager.search_path = manager.search_path.to_a.concat(paths)
end

private def init_gtk_source_view
  GtkSource.init

  exe_path = Process.executable_path || raise TijoloError.new("Cannot find executable path")
  usr_path = Path[exe_path, "../../"]
  setup_language_manager_paths(usr_path)
  setup_style_scheme_manager_paths(usr_path)
end

init_gtk_source_view
