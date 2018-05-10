class DirectoryComparison
  attr_reader :same, :only_left, :only_right

  def initialize(files_left, files_right)
    @same = []
    @only_left = []
    @only_right = []

    files_left.each_key do |left|
      if !files_right[left]
        only_left << left
      else
        same << left
      end
    end

    files_right.each_key do |right|
      if !files_left[right]
        only_right << right
      end
    end
  end
end
