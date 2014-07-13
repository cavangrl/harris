class HomeController < ApplicationController
  def index
  	@project = Project.first
  	@cards = @project.cards
  end
end
