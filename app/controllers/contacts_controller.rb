class ContactsController < ApplicationController
	respond_to :json
	before_action :require_authentication, only: [:show, :update]
	before_action :require_owner, only: [:show, :update]

	
	def show
		profile = Profile.find_by_id params[:id]
		respond_with @contacts = profile.contact
	end
	
	def update
		
		contact = Contact.find_by_id(contact_params[:id])
		contact.update(contact_params)
		respond_with contact
	end
	
private
	def contact_params
		params.require(:contact).permit(:address_line_1, :address_line_2, :city, :state, :zip_code, :phone_number, :email, :website, :id)
  end
	
	
end