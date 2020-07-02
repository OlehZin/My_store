require 'rails_helper'

RSpec.describe "account/faqs/show", type: :view do
  before(:each) do
    @account_faq = assign(:account_faq, Account::Faq.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
