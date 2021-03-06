module CommentsHelper
  def comment_link(comment, options = {})
    options[:only_path] = true unless options[:only_path] == false
    case comment.commentable
    when Campnew
      campnew_path(comment.commentable, comment_id: comment.id, anchor: "comment-#{comment.id}", only_path: options[:only_path])
    when Topic
      topic_path(comment.commentable, comment_id: comment.id, anchor: "comment-#{comment.id}", only_path: options[:only_path])
    when Campushare
      campushare_path(comment.commentable, comment_id: comment.id, anchor: "comment-#{comment.id}", only_path: options[:only_path])
    end
  end

  def comment_title(comment)
    case comment.commentable
    when Campnew
      comment.commentable.title
    when Topic
      comment.commentable.title
    when Campushare
      comment.commentable.title
    else
      t 'helpers.comments.deleted_entry'
    end
  end

  def comment_replace_path(comment)
    case comment.commentable
    when Campnew
      campnew_last_path(@comment.commentable)
    when Topic
      topic_last_path(@comment.commentable)
    when Campushare
      campushare_last_path(@comment.commentable)
    end  
  end
end
