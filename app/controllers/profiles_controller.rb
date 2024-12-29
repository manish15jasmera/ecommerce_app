class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile_and_shipping_address

  def show
    # Displays profile and associated shipping addresses
  end

  def edit
    # Provides form to edit profile and add/update shipping addresses
  end

  def update
    if @profile.update(profile_params) && update_shipping_address
      redirect_to profile_path, notice: "Profile and shipping address updated successfully."
    else
      flash.now[:alert] = "Error updating profile or shipping address."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile_and_shipping_address
    @profile = current_user.profile
    @shipping_address = current_user.shipping_addresses.first_or_initialize
  end

  def profile_params
    params.require(:profile).permit(:name, :phone)
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:street, :city, :state, :postal_code, :country)
  end

  def update_shipping_address
    if @shipping_address.new_record?
      @shipping_address.assign_attributes(shipping_address_params)
      @shipping_address.save
    else
      @shipping_address.update(shipping_address_params)
    end
  end
end
