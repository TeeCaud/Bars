class BarDrinksController < ApplicationController

  def index
    @bar = Bar.find(params[:bar_id])
    @drinks = @bar.drinks
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
