class Admin::ContactsController < ApplicationController
  before_action :set_admin_contact, only: %i[ show edit update destroy ]

  # GET /admin/contacts or /admin/contacts.json
  def index
    @admin_contacts = Contact.all
  end

  # GET /admin/contacts/1 or /admin/contacts/1.json
  def show
  end

  # GET /admin/contacts/new
  def new
    @admin_contact = Contact.new
  end

  # GET /admin/contacts/1/edit
  def edit
  end

  # POST /admin/contacts or /admin/contacts.json
  def create
    @admin_contact = Contact.new(admin_contact_params)

    respond_to do |format|
      if @admin_contact.save
        format.html { redirect_to admin_contact_url(@admin_contact), notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @admin_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/contacts/1 or /admin/contacts/1.json
  def update
    respond_to do |format|
      if @admin_contact.update(admin_contact_params)
        format.html { redirect_to admin_contact_url(@admin_contact), notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/contacts/1 or /admin/contacts/1.json
  def destroy
    @admin_contact.destroy!

    respond_to do |format|
      format.html { redirect_to admin_contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_contact
    @admin_contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_contact_params
    params.fetch(:admin_contact, {})
  end
end
