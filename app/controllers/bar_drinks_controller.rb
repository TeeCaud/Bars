class BarDrinksController < ApplicationController

  def index
    @bar = Bar.find(params[:bar_id])
    if params[:sort] == "asc"
      @drinks = @bar.drinks.order(:name)
    else
      @drinks = @bar.drinks
    end
  end

  def new
    @bar = Bar.find(params[:bar_id])
  end

  def create
    @bar = Bar.find(params[:bar_id])
    drink = @bar.drinks.create!(bar_drinks_params)
    redirect_to "/bars/#{@bar.id}/drinks"
  end

  private
    def bar_drinks_params
      params.permit(:name, :quantity, :alcohol)
    end
end
