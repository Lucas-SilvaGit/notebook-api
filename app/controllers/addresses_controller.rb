class AddressesController < ApplicationController
  before_action :set_contact

  # GET /contacts/1/address
  def show
    render json: @contact.address
  end

  # PATCH /contacts/1/address
  def update
    if @contact.address.update(address_params)
      render json: @contact.address
    else
      render json: @contact.erros, status: :unprocessable_entity
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def address_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
