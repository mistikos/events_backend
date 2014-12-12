require "test_helper"

describe EventsController do
  it "should get index" do
    get :index
    assert_response :success
  end

end
