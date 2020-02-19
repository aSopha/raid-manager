class RostersController < ApplicationController
  def index
    render(json: user.rosters)
  end

  def show

  end
  def create
    log(request.body.read)
  end
end
