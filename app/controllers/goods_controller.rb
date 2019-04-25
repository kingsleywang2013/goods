class GoodsController < ApplicationController
  before_action :set_import, only: %i(new import)
  def index
    @goods = Good.all
  end

  def import
    @import.import(params[:file])
    if @import.errors.empty?
      redirect_to goods_path
    else
      render 'new'
    end
  end

  private

  def set_import
    @import = GoodCsvImporter.new
  end
end
