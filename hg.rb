class Repository
  def initialize path
    @path = path
    repo_found = hg "status"
    repo_found || raise("Repository not found at #{path}")
  end

  def branches
    success, branches = hg "branches"
    raise("Could not retrieve branches: #{branches}")unless success
    branches.each_line.map{|line| line.split[0]}
  end

  def hg cmd
    Dir.chdir(@path) do
      stdout = `hg #{cmd}`
      return $?, stdout
    end
  end
end
