class FaqsController < ApplicationController

  def index
    @faqs = Account::Faq.all
  end
end
