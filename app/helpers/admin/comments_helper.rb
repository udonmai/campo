module Admin::CommentsHelper
  def link_to_commentable(commentable)
    case commentable
    when Topic
      link_to truncate(commentable.title), admin_topic_path(commentable)
    when Campushare
      link_to truncate(commentable.title), admin_campushare_path(commentable)
    when Campnew
      link_to truncate(commentable.title), admin_campnew_path(commentable)
    end
  end
end
