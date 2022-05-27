class GreetingsController < ApplicationController
  
  def index
    @greetings = Greeting.all
    render json: @greetings
  end

  def random
    @greeting = Greeting.where(id: rand(1..5))
    render json: @greeting
  end
end
