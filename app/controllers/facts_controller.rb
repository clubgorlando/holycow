class FactsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def new
    @fact = Fact.new
  end

  def index
  end

  def show
    @fact = Fact.find_by_id(params[:id])
    if @fact.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end

  def create
    @fact = current_user.facts.create(fact_params)
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
