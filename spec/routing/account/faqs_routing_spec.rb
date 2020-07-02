require "rails_helper"

RSpec.describe Account::FaqsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/account/faqs").to route_to("account/faqs#index")
    end

    it "routes to #new" do
      expect(get: "/account/faqs/new").to route_to("account/faqs#new")
    end

    it "routes to #show" do
      expect(get: "/account/faqs/1").to route_to("account/faqs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/account/faqs/1/edit").to route_to("account/faqs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/account/faqs").to route_to("account/faqs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/account/faqs/1").to route_to("account/faqs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/account/faqs/1").to route_to("account/faqs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/account/faqs/1").to route_to("account/faqs#destroy", id: "1")
    end
  end
end
