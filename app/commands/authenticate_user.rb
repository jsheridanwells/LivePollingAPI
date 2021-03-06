class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    return {
      authorization_token: JsonWebToken.encode(user_id: user.id),
      user_id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email
      } if user
  end

  private
    attr_accessor :email, :password

    def user
      user = User.find_by_email(email)
      return user if user && user.authenticate(password)

      errors.add :user_authentication, 'invalid credentials'
      nil
    end
end
