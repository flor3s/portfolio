class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout 'blog'

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.order('created_at DESC').page(params[:page])
    else
      @blogs = @topic.blogs.where("status = 1").order('created_at DESC').page(params[:page])
    end
  end

  private

    def set_sidebar_topics
      @sidebar_topics = Topic.with_blogs
    end
end
