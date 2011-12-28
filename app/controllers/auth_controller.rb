class AuthController < ApplicationController

  before_filter :authenticate_user!, :except => [:access_token]
  skip_before_filter :verify_authenticity_token, :only => [:access_token]

  def authorize
    # TODO: Implement prune
    #AccessGrant.prune!    
    access_grant = current_user.access_grants.create(:application => application)
    current_user.authentication_token = access_grant.access_token
    current_user.save
    redirect_to access_grant.redirect_uri_for(params[:redirect_uri])
  end

  def access_token
    application = Application.authenticate(params[:client_id], params[:client_secret])
    if application.nil?
      render :json => {:error => 'Could not find application'}
      return
    end

    access_grant = AccessGrant.authenticate(params[:code], application.id)
    if access_grant.nil?
      render :json => {:error => 'Could not authenticate access code'}
      return
    end

    access_grant.start_expiry_period!
    render :json => { 
      :access_token   => access_grant.access_token, 
      :refresh_token  => access_grant.refresh_token, 
      :expires_in     => Devise.timeout_in.to_i 
    }
  end

  def user
    puts "#### USER"
    hash = {
      :provider => 'aps',
      :uid => current_user.id.to_s,
      :info => {
        :email => current_user.email, 
        :last_name => current_user.last_name,
        :first_name => current_user.first_name
      }
    }
    render :json => hash.to_json
  end

  def token
  end

  private

  def application
    @application ||= Application.find_by_app_id(params[:client_id])
  end

end
