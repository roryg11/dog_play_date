class WelcomeController < ApplicationController
  def index
    @dogs = Dog.all.shuffle
  end
end
