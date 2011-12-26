require 'spec_helper'

describe DashboardController do

  let(:user){ FactoryGirl.create(:user) }
  
  before(:each) do 
    sign_in user
  end

  describe "GET 'index'" do
   
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "redirect to sign_in if not authenticated" do
      sign_out user
      get 'index'
      response.should redirect_to('/users/sign_in')
    end

  end

end
