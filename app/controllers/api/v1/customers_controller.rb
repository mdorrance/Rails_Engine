class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    respond_with Customer.find_by(customers_params)
  end

  def find_all
    respond_with Customer.where(customers_params)
  end

  def random
    respond_with Customer.limit(1).order("RANDOM()")
  end

  private

  def customers_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
