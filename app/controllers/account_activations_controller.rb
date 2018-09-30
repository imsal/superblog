class AccountActivationsController < ApplicationController


  def edit
    subscriber = Subscriber.find_by(email: params[:email])
    if subscriber && !subscriber.activated? && subscriber.authenticated?(:activation, params[:id])
      subscriber.activate
      flash[:success] = "Account activated!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  

end
