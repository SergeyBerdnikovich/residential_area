class NewsController < InheritedResources::Base
  def index
    @news = News.order(:title).page(params[:page]).per(10)
  end
end
