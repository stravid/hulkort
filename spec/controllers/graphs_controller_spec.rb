require 'spec_helper'

describe GraphsController do
  describe "a valid shortcode" do
    let(:repository) { FactoryGirl.create(:repository) }

    it "shows the graph page" do
      get :show, :shortcode => repository.shortcode
      response.should be_success
      response.should render_template('show')
    end
  end

  describe "an invalid shortcode" do
    it "shows an error page" do
      get :show, :shortcode => "abcdefg"
      response.should be_error
    end
  end
end