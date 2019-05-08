class Api::V1::AnnonceController < Api::V1::ApiController
  before_action :authenticate_request!

  def create
    current_listing = params[:payload]

    Listing.create!(
        {
            author: current_listing[:email],
            name: current_listing[:name],
            photo: current_listing[:photo],
            description: current_listing[:description],
            price: current_listing[:price],
            tags: current_listing[:tags].split(';'),
            date: DateTime.now
        })
    render :json => { message: "L'annonce a été créer avec succès !" }
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

  end
end
