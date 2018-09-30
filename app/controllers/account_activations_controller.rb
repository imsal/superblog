class AccountActivationsController < ApplicationController


  def edit
    subscriber = Subscriber.find_by(email: params[:email])
    if subscriber && !subscriber.activated? && subscriber.authenticated?(:activation, params[:id])
      subscriber.activate
      redirect_to root_url, notice: 'Account activated!'
    else
      redirect_to root_url, alert: 'Invalid activation link.'
    end
  end



end
