require 'rails_helper'

RSpec.describe "Homes", type: :request do
  let!(:user) { create(:user) }
  before(:each) do
    sign_in user
  end

  it "get index" do
    get '/'
    expect(response).to be_successful
  end
end
