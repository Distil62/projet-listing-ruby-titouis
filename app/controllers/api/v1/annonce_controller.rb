require 'json'

class Api::V1::AnnonceController < Api::V1::ApiController
  before_action :authenticate_request!

  def create
    current_listing = JSON.load(params[:product])

    Listing.create!(
        {
            author: current_listing['email'],
            name: current_listing['name'],
            photo: current_listing['photo'],
            description: current_listing['description'],
            price: current_listing['price'],
            tags: current_listing['tags'].split(';'),
            date: DateTime.now
        })
    render :json => { message: "L'annonce #{current_listing['name']} a été créer avec succès !" }
  end

  def update
    Listing.update({_id: params[:id]}, params[:item])
    render :json => { message: Listing.find(params[:id]) }
  end

  def index
    render :json => {message: Listing.all}
  end

  def get
    @response = Listing.find(params[:id])
    render :json => {message: @response ? @response : []}
  end

  def delete
    @response = Listing.find_one_and_delete(params[:id])
    render :json => {message: @response ? @response : []}
  end
end
