class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to root_path, notice: "Contact was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name, :message)
  end
end
