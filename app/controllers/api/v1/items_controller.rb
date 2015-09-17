class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def find
    respond_with Item.find_by(items_params)
  end

  def find_all
    respond_with Item.where(items_params)
  end

  def random
    respond_with Item.random
  end

  def most_revenue
    quantity = params["quantity"].to_i
    respond_with Item.all.sort_by { |item| item.most_revenue }.reverse.take(quantity)
  end

  def most_items
    quantity = params["quantity"].to_i
    respond_with  Item.all.sort_by { |item| item.most_items }.reverse.take(quantity)
  end

  def best_day

  end

  private

  def items_params
    params.permit(:id, :name, :description, :merchant_id, :unit_price,
                  :created_at, :updated_at)
  end
end
