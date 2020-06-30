require 'rails_helper'

RSpec.describe "faqs/index", type: :view do
  before(:each) do
    assign(:faqs, [
      Faq.create!(
        title: "Title",
        description: "MyText"
      ),
      Faq.create!(
        title: "Title",
        description: "MyText"
      )
    ])
  end

  it "renders a list of faqs" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
