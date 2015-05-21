class InfoController < ApplicationController
  def index
    @env = ENV
  end
end
