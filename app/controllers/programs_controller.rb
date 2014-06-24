require "string"
require "const"

class ProgramsController < ApplicationController

  AUTH = "b48e34ad49209ff30e03dbaba30de063d10c198bf5ca2ae5d71b62025188a355"
  CACHE = true
  URL = "http://api.kure.tv"
  TID = Const.get_time

  def index
    puts "Call programs. TID : #{TID}"
    @programs =  Kure::Api::Configure.new(url: URL, auth: AUTH , tid: TID , cache: CACHE).get_programs()
  end


  def detail()

    @id = params[:id].to_i
    api_conf =  Kure::Api::Configure.new(url: URL, auth: AUTH , tid: TID , cache: CACHE)
    hash = {"program_id" => @id}
    @episodes = api_conf.get_episodes(hash)

    @program_name = @episodes[0].instance_variable_get(:@program_title)
    @channel_title = @episodes[0].instance_variable_get(:@channel_title)

  end


end
