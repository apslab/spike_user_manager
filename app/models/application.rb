class Application < ActiveRecord::Base

  before_create :generate_app_id, :generate_app_secret

  def self.authenticate(app_id, app_secret)
    where("app_id = ? AND app_secret = ?", app_id, app_secret).first
  end


  private 
  def generate_app_id
    loop do
      token = SecureRandom.hex(16)
      break self.app_id = token unless Application.find_by_app_id(token)
    end
  end

  def generate_app_secret
    self.app_secret = SecureRandom.hex(16)    
  end

end
