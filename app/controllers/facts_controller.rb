class FactsController < ApplicationController
  def new
    @fact = Fact.new
  end

  def index
  end

  def create
    @fact = Fact.create(fact_params)
    redirect_to facts_path
  end

  private

  def fact_params
    params.require(:fact).permit(:message)
  end

end
