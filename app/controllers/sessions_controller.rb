class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      if user && user.authenticate(params[:session][:password])
        render json: user, status: :created, location: user
      else
        render json: {message: 'Password is incorrect'}, status: :unprocessable_entity
      end
    else
      render json: {message: 'User not found'}, status: :unprocessable_entity
    end
  end

end
