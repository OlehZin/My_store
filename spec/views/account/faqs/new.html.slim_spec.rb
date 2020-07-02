require 'rails_helper'

RSpec.describe "account/faqs/new", type: :view do
  before(:each) do
    assign(:account_faq, Account::Faq.new())
  end

  it "renders new account_faq form" do
    render

    assert_select "form[action=?][method=?]", account_faqs_path, "post" do
    end
  end
end
