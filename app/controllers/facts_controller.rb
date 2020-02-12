class FactsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def destroy
    @fact = Fact.find_by_id(params[:id])
    return render_not_found if @fact.blank?
    if @fact.user != current_user
      return render plain: 'Forbidden :(', status: :forbidden
    end
    @fact.destroy
    redirect_to facts_path
  end

  def new
    @fact = Fact.new
  end

  def index
    @facts = Fact.all
  end

  def show
    @fact = Fact.find_by_id(params[:id])
    return render_not_found if @fact.blank?
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
    params.require(:fact).permit(:message, :holycows, :cowpies)
  end

  def render_not_found
    render plain: 'Not Found :(', status: :not_found
  end

end
