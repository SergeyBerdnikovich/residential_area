class News < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title, :user_id

  validates :title, :presence => true,
                    :uniqueness => true,
                    :length => { :minimum => 5 }
  validates :content, :presence => true,
                      :uniqueness => true
  validates :user_id, :presence => true,
                      :numericality => true

  def self.sanitize_news(news)
    Sanitize.clean(news,
      :elements => %w[
        a b br em h1 h2 h3 h4 h5 h6 i img li ol p small strong sub sup table tbody td
        th tr u ul iframe span
      ],
      :attributes => {
        :all => ['dir', 'lang', 'title'],
        'a' => ['href'],
        'img' => ['align', 'alt', 'height', 'src', 'width', 'style'],
        'ol' => ['start', 'reversed', 'type', 'style'],
        'table' => ['summary', 'width', 'style', 'border', 'cellspacing'],
        'td' => ['abbr', 'axis', 'colspan', 'rowspan', 'width'],
        'th' => ['abbr', 'axis', 'colspan', 'rowspan', 'scope', 'width'],
        'ul' => ['type', 'style'],
        'p' => ['style'],
        'iframe' => ['src'],
        'span' => ['style'],
        'li' => ['style']
      },
      :protocols => {
        'a' => {'href' => ['ftp', 'http', 'https', 'mailto', :relative]},
        'img' => {'src' => ['http', 'https', :relative]},
      })
  end
end
