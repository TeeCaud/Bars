class BarsController < ApplicationController
  def index
    @bars = Bar.all.sort_by_created_at
  end

  def show
    @bar = Bar.find(params[:id])
  end


end
