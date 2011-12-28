require 'spec_helper'

describe AuthController do

  describe "GET 'authorize'" do
    it "returns http success" do
      get 'authorize'
      response.should be_success
    end
  end

  describe "GET 'access_token'" do
    it "returns http success" do
      get 'access_token'
      response.should be_success
    end
  end

  describe "GET 'user'" do
    it "returns http success" do
      get 'user'
      response.should be_success
    end
  end

  describe "GET 'token'" do
    it "returns http success" do
      get 'token'
      response.should be_success
    end
  end

end
