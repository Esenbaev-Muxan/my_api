module ApplicationHelper
    def is_admin?
        unless current_user&.admin? 
            redirect_to root_path,
                alert: "You are not authorized_token"
        end
    end
end
