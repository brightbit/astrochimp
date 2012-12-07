require_dependency "astrochimp/application_controller"

module Astrochimp
  class SignupsController < ApplicationController
    before_filter :capture_referral_code, only: [:index]

    def capture_referral_code
      session[:referral_id] = Signup.code_to_id(params[:referral_code]) if params.has_key? :referral_code
    end

    # User's 'astrochimp_splash' layout in THEIR app (that uses this gem)
    layout "#{Rails.root}/app/views/layouts/#{ENV['AC_SPLASH_LAYOUT'] || 'astrochimp_splash'}"

    def index
      @signup = Signup.new

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @signup }
      end
    end

    def show
      @signup = Signup.find(params[:id])
    end

    # POST
    def create
      @signup = Signup.new(params[:signup].merge(referral_id: session[:referral_id]))
      @signup.status = Signup::STATUS_NEW

      respond_to do |format|
        @signup.save
        if @signup.errors.any?
          format.html { render action: :index }
          format.json { render json: @signup.errors, status: :unprocessable_entity }
        else
          format.html do
            redirect_to @signup, notice: ENV['AC_SIGNUP_SUCCESS_NOTICE']
          end
          format.json { render json: @signup, status: :created, location: @signup }
        end
      end
    end
  end
end
