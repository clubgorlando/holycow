class LikesController < ApplicationController
  before_action :find_fact
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't give more than one HOLYCOW!"
    else
      @fact.likes.create(user_id: current_user.id)
    end
    redirect_to facts_path
  end

  private

  def find_fact
    @fact = Fact.find(params[:fact_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, fact_id:
    params[:fact_id]).exists?
  end

end
