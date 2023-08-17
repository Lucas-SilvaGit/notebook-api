class AddressesController < ApplicationController
  before_action :set_contact

  def show
    render json: @contact.address
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end
end
