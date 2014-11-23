class Spree::NewslettersController < ApplicationController

  def accept_recipient
    @recipient = Recipient.new(permitted_params)
    if @recipient.save
      # flash[:success] = "Thanks for subscribing with StayHappi. We will update you with great deals and offers"
      render json: @recipient
    else
      render json: @recipient.errors ,status: :bad_request
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def permitted_params
    params.permit(:email)
  end

end
