class Turks::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  # def new
  #   # below is the sign up implementation  



  #   build_resource({})
  #   #set_minimum_password_length
  #   yield resource if block_given?
  #   respond_with self.resource

  # end

  # POST /resource
  def create
    
    @turk = Turk.where(email: params[:turk][:email])[0]

    if @turk.nil?

      build_resource(sign_up_params)

      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        #clean_up_passwords resource
        #set_minimum_password_length
        respond_with resource
      end

    else
      # self.resource = @turk.id
      # set_flash_message(:notice, :signed_in) if is_flashing_format?
      # sign_in(:turks,@turk)
      # yield resource if block_given?
      # respond_with resource, location: after_sign_in_path_for(resource)

      self.resource = warden.set_user(@turk, :scope => :turk)
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)



    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new", strategy: "Basic" }
  end

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
