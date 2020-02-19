class IndexController < ApplicationController
  def index
    render template: 'rosters/index'
  end
end
