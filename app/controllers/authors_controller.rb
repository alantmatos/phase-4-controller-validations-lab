class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :handle_baddata_response
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private

  def handle_baddata_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
  
  def author_params
    params.permit(:email, :name)
  end
  
end
