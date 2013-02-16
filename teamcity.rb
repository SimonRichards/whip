require 'net/http'
require 'rexml/document'

class TeamCity
  def initialize url, project_name, vcs_name, user=nil, pass=nil
    @url, @project_name, @user, @pass = url, project_name, user, pass
    @auth_method = user && pass ? 'httpAuth' : 'guestAuth'
    vcs_roots = get "vcs-roots"
    REXML::Document.new(vcs_roots).elements.each('vcs-roots/vcs-root') do |vcs|
      @id = vcs.attribute('id').value.to_i if vcs.attribute('name').value == vcs_name
    end
    raise "Couldn't find vcs-root #{vcs_name}" unless @id
  end

  def branches
    begin
      get("vcs-roots/id:#{@id}/properties/teamcity:branchspec").split
    rescue
      []
    end
  end

  def get resource
    response = Net::HTTP.get_response(URI("#{@url}#{@auth_method}/app/rest/#{resource}"))
    raise "GET failed (#{response.code}): #{response.body}" unless response.code == '200'
    response.body
  end
end
