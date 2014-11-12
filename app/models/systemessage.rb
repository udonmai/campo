class Systemessage < ActiveRecord::Base

  include Trashable

  validates :title, :body, presence: true

  def total_pages
    (comments_count.to_f / Comment.default_per_page).ceil
  end

  def more_like_this(num = 5)
    Topic.search(
      query: {
        more_like_this: {
          fields: ['title', 'body'],
          like_text: title + '\n' + body
        }
      },
      filter: {
        and: [
          { term: { trashed: false } },
          { not: { term: { id: id } } }
        ]
      }
    ).limit(num).records.to_a rescue []
  end
end
