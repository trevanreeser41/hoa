class ExampleController < ApplicationController
  def index
    render json: { message: "Hello from Rails!" }
  end
end
