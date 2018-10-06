class UnsubscribeController < ApplicationController


  def edit
    subscriber = Subscriber.find_by(email: params[:email])

    if subscriber && !subscriber.unsubscribed? && subscriber.authenticated?(:unsubscribe, params[:id])
      subscriber.activate
      redirect_to root_url, notice: 'Unsubscribed!'
    else
      redirect_to root_url, alert: 'Invalid activation link.'
    end
  end


end
