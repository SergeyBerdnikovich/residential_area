class NewsController < InheritedResources::Base
  def index
    @news = News.order(:title).page params[:page]
  end
end
