class ApartmentsController < ApplicationController
  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def index
    render json: Apartment.all
  end

  def update
    apartment = Apartment.find(params[:id])
    apartment.update!(apartment_params)
    render json: apartment, status: :ok
  end

  def destroy
    apartment = Apartment.find(params[:id])
    apartment.destroy
    head :no_content
  end

  private

  def apartment_params
    params.permit(:id, :number)
  end
end
