#!/usr/bin/env ruby

require 'sinatra'
require 'json'
require 'yaml'
require_relative 'hg.rb'
require_relative 'teamcity.rb'

repositories = { }
servers = { }
config = YAML.load_file 'config.yml'
config["repositories"].each do |repo|
  name = repo["name"]
  repositories[name] = Repository.new repo["repo_path"]
  servers[name] = TeamCity.new(
    repo["teamcity_url"],
    repo["teamcity_project"],
    repo["teamcity_vcs"],
    repo["teamcity_user"],
    repo["teamcity_pass"])
end

get '/repositories' do
  repositories.each_key.to_a.to_json
end

get '/repositories/:repo/all-branches' do |repo|
  repositories[repo] ? repositories[repo].branches.to_json : 404
end

get '/repositories/:repo/building-branches' do |repo|
  servers[repo] ? servers[repo].branches.to_json : 404
end


