class ProjectTree
  # Project tree model columns
  PROJECT_TREE_LABEL  = 0
  PROJECT_TREE_PATH   = 1
  PROJECT_TREE_IS_DIR = 2

  class Node
    getter name

    def initialize(@name : String)
    end

    def [](name)
      raise "Bug"
    end

    def to_s(io, depth)
      io << ("  " * depth) << @name << "\n"
    end
  end

  class FolderNode < Node
    getter files = [] of Node
    getter subfolders = [] of FolderNode

    protected def add(parts : Array(String))
      part = parts.shift
      if parts.empty? # A file
        @files << Node.new(part) unless @files.includes?(part)
      else # A subfolder
        subfolder = @subfolders.find do |node|
          node.name == part
        end
        if subfolder.nil?
          subfolder = FolderNode.new(part)
          @subfolders << subfolder
        end
        subfolder.add(parts)
      end
    end

    def []?(name)
      @subfolders.find { |node| node.name == name } ||
        @files.find { |node| node.name == name }
    end

    def [](name)
      self[name]?.not_nil!
    end

    alias TraverseBlock = Proc(Array(String), Bool, Array(Int32), Nil)

    protected def traverse_impl(file_parts, tree_path, &block : TraverseBlock)
      @subfolders.each_with_index do |subfolder, i|
        file_parts.push(subfolder.name)
        yield(file_parts, true, tree_path)

        tree_path.push(i)
        subfolder.traverse_impl(file_parts, tree_path, &block)
        tree_path.pop
        file_parts.pop
      end
      @files.each_with_index(@subfolders.size) do |file, i|
        file_parts.push(file.name)
        yield(file_parts, false, tree_path)
        file_parts.pop
      end
    end

    def to_s(io, depth)
      super

      next_depth = depth + 1
      @subfolders.each do |subfolder|
        subfolder.to_s(io, next_depth)
      end
      @files.each do |file|
        file.to_s(io, next_depth)
      end
    end
  end

  class Root < FolderNode
    def initialize(files)
      super("<root>")
      files.each do |file|
        add(file)
      end
    end

    def initialize(files : Array(String))
      initialize(files.map { |f| Path.new(f) })
    end

    def add(path : Path)
      add(path.parts)
    end

    def traverse(&block : TraverseBlock) : Nil
      file_parts = [] of String
      tree_path = [] of Int32

      traverse_impl(file_parts, tree_path, &block)
    end

    def to_s(io : IO)
      to_s(io, 0)
    end
  end

  def initialize(@project : Project, @model : Gtk::TreeStore)
    @root = Root.new(@project.files)
    @model.ref
    populate
  end

  def add_node(path : Path)
    @root.add(path)
  end

  private def add_node_to_gtk(path_parts : Array(String), is_folder : Bool, parent_tree_path : Array(Int32))
    parent_iter = if parent_tree_path.empty?
                    nil
                  else
                    iter = Gtk::TreeIter.new
                    tree_path = Gtk::TreePath.new_from_indices(parent_tree_path, parent_tree_path.size)
                    @model.iter(iter, tree_path)
                    iter
                  end
    @model.append(parent_iter, {0, 1, 2}, {path_parts.last, @project.root.join(Path[path_parts]).to_s, is_folder})
  end

  private def populate
    # Traverse tree creating GTK nodes
    @root.traverse do |file_path, is_folder, tree_path|
      add_node_to_gtk(file_path, is_folder, tree_path)
    end
  end

  def to_s(io : IO)
    @root.to_s(io, 0)
  end
end
