class User < ActiveRecord::Base
  has_many :access_grants, :dependent => :delete_all


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :last_name, :first_name

  validates_presence_of :last_name, :first_name 

  self.token_authentication_key = "auth_token"

end
