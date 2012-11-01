require_dependency "astrochimp/application_controller"

module Astrochimp
  class SignupsController < ApplicationController
    # User's 'astrochimp_splash' layout in THEIR app (that uses this gem)
    layout "#{Rails.root}/app/views/layouts/#{ENV['AC_SPLASH_LAYOUT'] || 'astrochimp_splash'}"

    def index
      @signup = Signup.new

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @signup }
      end
    end

    # POST
    def create
      @signup = Signup.new(params[:signup])
      @signup.status = Signup::STATUS_NEW

      respond_to do |format|
        @signup.save
        if @signup.errors.any?
          format.html { render action: :index }
          format.json { render json: @signup.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to root_url, notice: ENV['AC_SIGNUP_SUCCESS_NOTICE'] }
          format.json { render json: @signup, status: :created, location: @signup }
        end
      end
    end
  end
end
