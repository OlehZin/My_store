class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = Contact.all 
  end

  def show
  end
  
end
