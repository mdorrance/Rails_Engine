class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.random
  end

  def revenue
    if params["date"]
      respond_with Merchant.find_by(id: params[:id]).revenue_by_date(params["date"])
    else
      respond_with Merchant.find_by(id: params[:id]).revenue
    end
  end

  def most_items
    quantity = params["quantity"].to_i
    respond_with  Merchant.most_items(quantity)
  end

  def most_revenue
    quantity = params["quantity"].to_i
    respond_with Merchant.most_revenue(quantity)
  end

  def revenue_date
    date = params["date"]
    respond_with Merchant.revenue_by_date(date)
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end

  def customers_with_pending_invoices
    respond_with Merchant.find_by(id: params[:id]).customers_with_pending_invoices
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
