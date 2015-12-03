class SessionsController < ApplicationController
  def new
  end

  def create
    user = Intern.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log in the user and redirect to user's show page

      # TODO: move these to the else clause after I make the password change page
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.change
        # redirect to password change page
      else
        redirect_to intern_path(user)
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
