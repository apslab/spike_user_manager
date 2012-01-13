class User < ActiveRecord::Base
  has_many :access_grants, :dependent => :delete_all


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :last_name, :first_name

  validates_presence_of :last_name, :first_name 

  self.token_authentication_key = "oauth_token"

  # Method used by devise for find user by token
  # (see http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable/ClassMethods)
  def self.find_for_token_authentication(conditions)
    query = "access_grants.access_token = ? AND (access_grants.access_token_expires_at IS NULL OR access_grants.access_token_expires_at > ?)"
    where(query, conditions[token_authentication_key], Time.now).joins(:access_grants).select("users.*").first
  end

end
