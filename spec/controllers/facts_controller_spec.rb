require 'rails_helper'

RSpec.describe FactsController, type: :controller do
  describe "facts#show action" do
    it "should successfully show the page if the fact is found" do
      fact = FactoryBot.create(:fact)
      get :show, params: { id: fact.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the fact is not found" do
      get :show, params: { id: 'RANDOM' }
      expect(response).to have_http_status(:not_found)
    end
  end



  describe "facts#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "facts#new action" do
    it "should require users to be logged in " do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "facts#create action" do

    it "should require users to be logged in" do
      post :create, params: { fact: { message: "Hello" } }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a new fact in our database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { fact: { message: 'This statement is a fact!'} }
      expect(response).to redirect_to facts_path

      fact = Fact.last
      expect(fact.message).to eq("This statement is a fact!")
      expect(fact.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      fact_count = Fact.count
      post :create, params: { fact: { message: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(fact_count).to eq Fact.count
    end
  end

end
