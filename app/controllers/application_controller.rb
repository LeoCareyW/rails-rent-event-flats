class ApplicationController < ActionController::Base
   before_action :authenticate_user!
   before_action :store_user_location!, if: :storable_location?

   def after_sign_in_path_for(resource_or_scope)
     stored_location_for(resource_or_scope) || super
   end

   def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
   end

   def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
   end
end
