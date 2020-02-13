class DislikesController < ApplicationController
  before_action :find_fact
  before_action :authenticate_user!

  def create
    if already_disliked?
      flash[:notice] = "You can't dislike more than once"
    else
      @fact.dislikes.create(user_id: current_user.id)
    end
    redirect_to facts_path
  end

  private

  def already_disliked?
    Dislike.where(user_id: current_user.id, fact_id:
    params[:fact_id]).exists?
  end

  def find_fact
    @fact = Fact.find(params[:fact_id])
  end
end
