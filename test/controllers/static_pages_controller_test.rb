require "test_helper"

describe StaticPagesController do
  it "should get home" do
    get :home
    assert_response :success
  end

end
