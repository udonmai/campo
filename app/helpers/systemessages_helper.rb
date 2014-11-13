module SystemessagesHelper
  #def comment_link(comment, options = {})
    #options[:only_path] = true unless options[:only_path] == false
    #case comment.commentable
    #when Campnew
      #campnew_path(comment.commentable, comment_id: comment.id, anchor: "comment-#{comment.id}", only_path: options[:only_path])
    #when Topic
      #topic_path(comment.commentable, comment_id: comment.id, anchor: "comment-#{comment.id}", only_path: options[:only_path])
    #when Campushare
      #campushare_path(comment.commentable, comment_id: comment.id, anchor: "comment-#{comment.id}", only_path: options[:only_path])
    #end
  #end

  def systemessage_title(systemessage)
    case systemessage
    when Systemessage
      systemessage.title
    else
      t 'helpers.comments.deleted_entry'
    end
  end

  def systemessage_created_at(systemessage)
    case systemessage
    when Systemessage
      time_ago_tag systemessage.created_at
    else
      ''
    end
  end

  def systemessage_body(systemessage)
    case systemessage
    when Systemessage
      truncate systemessage.body, length: 670
    else
      t 'helpers.comments.deleted_entry'
    end
  end

  #def comment_replace_path(comment)
    #case comment.commentable
    #when Campnew
      #campnew_last_path(@comment.commentable)
    #when Topic
      #topic_last_path(@comment.commentable)
    #when Campushare
      #campushare_last_path(@comment.commentable)
    #end  
  #end
end
