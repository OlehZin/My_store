require 'rails_helper'

RSpec.describe "account/faqs/edit", type: :view do
  before(:each) do
    @account_faq = assign(:account_faq, Account::Faq.create!())
  end

  it "renders the edit account_faq form" do
    render

    assert_select "form[action=?][method=?]", account_faq_path(@account_faq), "post" do
    end
  end
end
