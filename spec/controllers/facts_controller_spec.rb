require 'rails_helper'

RSpec.describe FactsController, type: :controller do
  describe "facts#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "facts#new action" do
    it "should successfully show the new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "facts#create action" do
    it "should successfully create a new fact in our database" do
      post :create, params: { fact: { message: 'This statement is a fact!'} }
      expect(response).to redirect_to facts_path

      fact = Fact.last
      expect(fact.message).to eq("This statement is a fact!")
    end
  end

end
