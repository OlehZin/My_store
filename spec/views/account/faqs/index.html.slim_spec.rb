require 'rails_helper'

RSpec.describe "account/faqs/index", type: :view do
  before(:each) do
    assign(:account_faqs, [
      Account::Faq.create!(),
      Account::Faq.create!()
    ])
  end

  it "renders a list of account/faqs" do
    render
  end
end
