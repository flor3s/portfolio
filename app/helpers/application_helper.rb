module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Dan Flores"
		if page_title.empty?
			base_title
		else 
			"#{page_title} | #{base_title}"
		end
	end

	def seo_keywords
		"daniel dan flores portfolio project projects"
	end

	def login_helper
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, method: :delete 
    else
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path)
    end	
	end
end
