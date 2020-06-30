require 'rails_helper'

RSpec.describe "faqs/new", type: :view do
  before(:each) do
    assign(:faq, Faq.new(
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders new faq form" do
    render

    assert_select "form[action=?][method=?]", faqs_path, "post" do

      assert_select "input[name=?]", "faq[title]"

      assert_select "textarea[name=?]", "faq[description]"
    end
  end
end
