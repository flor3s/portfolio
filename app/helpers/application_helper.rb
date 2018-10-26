module ApplicationHelper
	def full_title page_title = ''
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

	def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) + " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end	
	end

	def source_helper
		if session[:source]
			greeting = "Thanks for visiting from #{session[:source]}"
			content_tag(:p, greeting, class: "source-greeting")
		end
	end

	def copyright_generator
		FloresViewTool::Renderer.copyright 'Daniel Flores', 'All rights reserved'
	end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_path,
        title: "About"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: blogs_path,
        title: "Blog"
      },
      {
        url: projects_path,
        title: "Projects"
      }
    ]
  end

  def nav_helper style, tag
    nav_links = ''
    nav_items.each do |item| 
      nav_links << "<#{tag}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'> #{item[:title]}</a></#{tag}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title:"Daniel Flores Portfolio", sticky: false)
  end

end
