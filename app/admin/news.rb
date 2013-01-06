# coding: utf-8
ActiveAdmin.register News do
  index do
    column 'Ид', :id
    column 'Название', :title
    column 'Автор', :author do |news|
      news.user.name if news.user
    end
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :author do |news|
        news.user.name if news.user
      end
      row :created_at
      row :updated_at
      row :content do |news|
        Sanitize.clean(news.content, :elements => %w[
a abbr b bdo blockquote br caption cite code col colgroup dd del dfn dl
dt em figcaption figure h1 h2 h3 h4 h5 h6 hgroup i img ins kbd li mark
ol p pre q rp rt ruby s samp small strike strong sub sup table tbody td
tfoot th thead time tr u ul var wbr
],
      :attributes => {
        :all => ['dir', 'lang', 'title'],
        'a' => ['href'],
        'blockquote' => ['cite'],
        'col' => ['span', 'width'],
        'colgroup' => ['span', 'width'],
        'del' => ['cite', 'datetime'],
        'img' => ['align', 'alt', 'height', 'src', 'width', 'style'],
        'ins' => ['cite', 'datetime'],
        'ol' => ['start', 'reversed', 'type'],
        'q' => ['cite'],
        'table' => ['summary', 'width'],
        'td' => ['abbr', 'axis', 'colspan', 'rowspan', 'width'],
        'th' => ['abbr', 'axis', 'colspan', 'rowspan', 'scope', 'width'],
        'time' => ['datetime', 'pubdate'],
        'ul' => ['type'],
        'p' => ['style']
      },
      :protocols => {
        'a' => {'href' => ['ftp', 'http', 'https', 'mailto', :relative]},
        'blockquote' => {'cite' => ['http', 'https', :relative]},
        'del' => {'cite' => ['http', 'https', :relative]},
        'img' => {'src' => ['http', 'https', :relative]},
        'ins' => {'cite' => ['http', 'https', :relative]},
        'q' => {'cite' => ['http', 'https', :relative]}
      }).html_safe
      end
    end
    active_admin_comments
  end

  form :partial => "/admin/news_articles/news_articles_form"

  controller do
    def create
      params[:news][:user_id] = current_user.id
      create!
    end
  end
end