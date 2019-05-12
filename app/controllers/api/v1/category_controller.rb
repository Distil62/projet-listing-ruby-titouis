require 'json'

class Api::V1::CategoryController < Api::V1::ApiController
  def index
    render :json => {message: Category.all }
  end

  def get_id
    @response = Category.find(params[:id])
    render :json => { message: @response }
  end

  def get_name
    @response = Category.find({name: params[:name]})
    render :json => { message: @response }
  end

  def create
    current_category = JSON.load(params[:category])

    Category.create!({name: current_category['name']})

    render :json => { message: "La catégorie #{current_category['name']} a été créer avec succès !" }

  end
end