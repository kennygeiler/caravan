require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  before :each do
    stub_current_user(user)
    stub_authorize_user!
  end

  describe "GET #new" do
    it "assigns form variables" do
      get :new
      expect(assigns(:url)).to eq trips_path
      expect(assigns(:method)).to eq :post
      expect(assigns(:submit_btn)).to eq "Create Trip"
    end
  end

  describe "GET #edit" do
    it "assigns the requested trip to @trip" do
      trip = FactoryGirl.create :trip
      get :edit, id: trip
      expect(assigns(:trip)).to eq trip
      expect(assigns(:url)).to eq trip_path
      expect(assigns(:method)).to eq :put
      expect(assigns(:submit_btn)).to eq "Update Trip"
    end
  end

end
