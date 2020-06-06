require "./project"

class ProjectTree
  class Node
    include Comparable(Node)

    getter name

    def initialize(@name : String)
    end

    def index(_name)
      nil
    end

    def []?(name)
      raise "Bug"
    end

    def [](name)
      raise "Bug"
    end

    def <=>(other)
      @name <=> other.name
    end

    # Implemented so we can do Array(Node).index("name")
    def ==(other_name : String)
      @name == other_name
    end

    def to_s(io, depth)
      io << ("  " * depth) << @name << "\n"
    end
  end

  class FolderNode < Node
    getter files = [] of Node
    getter subfolders = [] of FolderNode

    private def insert_node(collection, node, indices, model)
      idx = collection.index { |obj| obj >= node } || collection.size
      collection.insert(idx, node)

      if indices.any?
        parent_iter = Gtk::TreeIter.new
        tree_path = Gtk::TreePath.new_from_indices(indices)
        model.iter(parent_iter, tree_path)
      end

      is_folder = node.is_a?(FolderNode)
      idx += @subfolders.size unless is_folder
      model.insert(parent_iter, {0, 1}, {node.name, is_folder}, idx)

      idx
    end

    protected def add(path_parts : Array(String), model : Gtk::TreeStore, indices : Array(Int32))
      part = path_parts.shift
      if path_parts.empty? # A file
        insert_node(@files, Node.new(part), indices, model) unless @files.includes?(part)
      else # A subfolder
        index = @subfolders.index { |node| node.name == part }
        subfolder = if index
                      @subfolders[index]
                    else
                      folder = FolderNode.new(part)
                      index = insert_node(@subfolders, folder, indices, model)
                      folder
                    end
        indices << index
        subfolder.add(path_parts, model, indices)
      end
    end

    def index(name) : Int32?
      idx = @subfolders.index(name)
      return idx unless idx.nil?

      idx = @files.index(name)
      idx += @subfolders.size unless idx.nil?
    end

    def []?(index : Int32) : Node?
      if index < @subfolders.size
        return @subfolders[index]
      else
        index -= @subfolders.size
        @files[index]?
      end
    end

    def []?(name : String)
      @subfolders.find { |node| node.name == name } ||
        @files.find { |node| node.name == name }
    end

    def [](name : String)
      self[name]?.not_nil!
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
    getter model = Gtk::TreeStore.new({GObject::Type::UTF8, GObject::Type::BOOLEAN})

    def initialize(@project : Project)
      super("<root>")
      @project.files.each do |file|
        add(file)
      end
    end

    def add(path : Path)
      relative_path = path.relative_to(@project.root)
      add(relative_path.parts, @model, [] of Int32)
    end

    def tree_path(file)
      path = [] of Int32
      node = self
      file.parts.each do |part|
        idx = node.index(part)
        return if idx.nil?

        node = node[part]
        path << idx
      end
      path
    end

    def file_path(tree_path_indices)
      node = self
      tree_path_indices.map do |index|
        node = node[index]?
        return if node.nil?

        node.name
      end
    end

    def to_s(io : IO)
      to_s(io, 0)
    end
  end

  include ProjectListener
  # Project tree model columns
  PROJECT_TREE_LABEL  = 0
  PROJECT_TREE_IS_DIR = 1

  delegate model, to: @root

  def initialize(@project : Project)
    @root = Root.new(@project)
    @project.add_listener(self)
  end

  def tree_path(file : String)
    tree_path(Path.new(file))
  end

  def tree_path(file : Path) : Array(Int32)?
    path = file.relative_to(@project.root)
    @root.tree_path(path)
  end

  def file_path(tree_path_indices : Enumerable(Int32)) : String?
    path_parts = @root.file_path(tree_path_indices)
    return if path_parts.nil?

    @project.root.join(Path.new(path_parts)).to_s
  end

  def file_path(tree_path : Gtk::TreePath) : String?
    # FIXME: Gtk::TreePath.indices returns a tuple with a crashing pointer iterator.
    # So I use this slow workaround
    indices = tree_path.to_string
    file_path(indices.split(":").map(&.to_i))
  end

  def project_file_added(path : Path)
    @root.add(path)
  end

  def project_file_removed(path : Path)
  end

  def project_file_renamed(old : Path, new : Path)
  end

  def to_s(io : IO)
    @root.to_s(io, 0)
  end
end
