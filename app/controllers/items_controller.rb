# frozen_string_literal: true

class ItemsController < ApplicationController
  include LogErrors

  def index
    @items = Item.all
  end

  def import
    CSV.foreach(params[:file].path, headers: true, header_converters: :symbol) do |row|
      filtered_row = row.to_hash.slice(:id, :productid, :condition, :sku, :title, :qty, :price)
      item = Item.find_or_create_by(filtered_row)
    end
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Process completed.' }
    end
  rescue StandardError => e
    log_errors(e)
  end
end
