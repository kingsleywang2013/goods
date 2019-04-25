class GoodsController < ApplicationController
  before_action :set_import, only: %i(new import)
  def index
    if params[:type].present?
      @goods = Good.filter_by_type(params[:type])
    elsif params[:entry_at].present?
      @goods = Good.filter_by_entry_at(params[:entry_at])
    elsif params[:type].present? && params[:entry_at].present?
      @goods = Good.mix_filter(params[:type], params[:entry_at])
    else
      @goods = Good.all
    end
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
