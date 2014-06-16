require "string"

class ProgramsController < ApplicationController

  AUTH = "b48e34ad49209ff30e03dbaba30de063d10c198bf5ca2ae5d71b62025188a355"
  CACHE = true
  URL = "http://api.kure.tv"

  def index
    @programs =  Kure::Api::Configure.new(url: URL, auth: AUTH , cache: CACHE).get_programs()
  end


  def detail()

    @id = params[:id]
    api_conf =  Kure::Api::Configure.new(url: URL, auth: AUTH , cache: CACHE)
    hash = {"program_id" => @id}
    @episodes = api_conf.get_episodes(hash)

    @program_name = @episodes[0].instance_variable_get(:@program_title)
    @channel_title = @episodes[0].instance_variable_get(:@channel_title)

  end



end
