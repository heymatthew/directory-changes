class TraverseAndCompare
  attr_reader :file_left, :file_right

  def initialize(file_left, file_right)
    @file_left = file_left
    @file_right = file_right

    only_left_count = 0
    only_right_count = 0
    updated_count = 0
    unchanged_count = 0

    compare = DirectoryComparison.new(hash_list(file_left), hash_list(file_right))
    only_left_count += compare.only_left.count
    #...
    #recursively count, for only_left and only_right files count all subdirs
    #for same files,
    # if leaf, and mtime changed, list updated
    # if leaf and mtime same, list unchanged
    # else recurse
    # only count leaf??
    # else if dir, maybe only increment if subdir changed
  end

  def hash_list(path)
    {}.tap do |hash|
      Dir[path].each do |file|
        hash[file] = true
      end
    end
  end
end
