class SessionController < ApplicationController

  def new
  end

  def create

    @author = Author.find_by(email_address: params[:session][:email_address].downcase)

    # The entered

    if @author && @author.authenticate(params[:session][:password])
      # if @user.activated?
        # Log the user in and redirect to the user's show page.
        # log_in @user
        session[:author_id] = @author.id
        redirect_to root_url
        # if checkbox is checked (equals 1) remember user, else forget user
        # params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        # redirect_back_or @user
      # else
        # message = 'Account not activated. '
        # message += 'Check your email for activation link.'
        # flash[:warning] = message
        # redirect_to root_url
      # end
    else
      flash[:alert] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    # log_out if logged_in?
    session.delete(:author_id)
    redirect_to root_url, notice: 'logged out'
  end

end
