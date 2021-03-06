class AccessGrant < ActiveRecord::Base
  belongs_to :user
  belongs_to :application

  before_create :generate_tokens
  
  def self.authenticate(code, application_id)
    AccessGrant.where("code = ? AND application_id = ?", code, application_id).first
  end

  def redirect_uri_for(redirect_uri)
    if redirect_uri =~ /\?/
      redirect_uri + "&code=#{code}&response_type=code"
    else
      redirect_uri + "?code=#{code}&response_type=code"
    end
  end
  
  # Note: This is currently hard coded to 2 days, but it could be configurable 
  # per-user-type or per-application.
  # No need for this to be constant like this.
  def start_expiry_period!
    self.update_attribute(:access_token_expires_at, 2.days.from_now)
  end

  private

  def generate_tokens
    self.code, self.access_token, self.refresh_token = SecureRandom.hex(16), SecureRandom.hex(16), SecureRandom.hex(16)
  end

end
