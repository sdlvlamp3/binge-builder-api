module SessionsHelper
    def current_user
        current_user = User.find(decoded['user_id'])
    end

    def logged_in?
        !current_user.nil?
    end
end