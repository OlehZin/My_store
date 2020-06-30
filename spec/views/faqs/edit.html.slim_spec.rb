require 'rails_helper'

RSpec.describe "faqs/edit", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit faq form" do
    render

    assert_select "form[action=?][method=?]", faq_path(@faq), "post" do

      assert_select "input[name=?]", "faq[title]"

      assert_select "textarea[name=?]", "faq[description]"
    end
  end
end
