class ApplicationController < ActionController::Base
  def user
    User.find_by(token: '123abc')
  end
  def roster
    Roster.find_by('cinderworks')
  end
end
