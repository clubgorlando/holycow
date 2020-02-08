class FactsController < ApplicationController
  def new
    @fact = Fact.new
  end

  def index
  end

  def create
    @fact = Fact.create(fact_params)
    if @fact.valid?
      redirect_to facts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def fact_params
    params.require(:fact).permit(:message)
  end

end
