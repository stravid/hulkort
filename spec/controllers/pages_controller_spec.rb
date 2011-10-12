require 'spec_helper'
require 'clearance/testing'

describe PagesController do

  describe "a visitor" do
    it "shows the install instructions to a visitor" do
      get :index
      should render_template('index')
    end
  end

  describe "a user" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
    end

    it "shows the install instructions" do
      get :index
      should render_template('index')
    end

    it "redirects to the user statistics if commits are given" do
      @user.commits.create

      get :index
      should redirect_to(user_path(@user))
    end

    it "show the install instructions when ignore_commits flag is given" do
      @user.commits.create

      get :index, :ignore_commits => true
      should render_template('index')
    end
  end
end