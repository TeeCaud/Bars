class BarsController < ApplicationController
  def index
    @bars = Bar.all.sort_by_created_at
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
  end

  def create
    new_bar = Bar.create(bar_params)
    redirect_to '/bars'
  end

  def bar_params
    params.permit(:name, :specials, :established, :location)
  end
end
