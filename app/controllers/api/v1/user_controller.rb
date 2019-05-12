require 'json'

class Api::V1::UserController < Api::V1::ApiController
  def index
    render :json => {message: User.all }
  end

  def get
    @response = User.find(params[:id])
    render :json => { message: @response }
  end
end