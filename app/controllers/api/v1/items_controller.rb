class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def find
    if params.include?("name")
      respond_with Item.find_by(name: params[:name])
    elsif params.include?("description")
      respond_with Item.find_by(description: params[:description])
    elsif params.include?("merchant_id")
      respond_with Item.find_by(merchant_id: params[:merchant_id])
    elsif params.include?("unit_price")
      respond_with Item.find_by(unit_price: params[:unit_price])
    else
      respond_with Item.find_by(id: params[:id])
    end
  end

  def find_all
    if params.include?("name")
      respond_with Item.where(name: params[:name])
    elsif params.include?("description")
      respond_with Item.where(description: params[:description])
    elsif params.include?("merchant_id")
      respond_with Item.where(merchant_id: params[:merchant_id])
    else params.include?("unit_price")
      respond_with Item.where(unit_price: params[:unit_price])
    end
  end

  def random
    respond_with Item.limit(1).order("RANDOM()")
  end
end
