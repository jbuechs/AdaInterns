class SessionsController < ApplicationController
  def new
  end

  def create
    user = Intern.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log in the user and redirect to user's show page
      log_in(user)
      redirect_to intern_path(user)
    else
      binding.pry
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end