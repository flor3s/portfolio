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
end
