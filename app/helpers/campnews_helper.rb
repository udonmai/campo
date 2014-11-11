module CampnewsHelper
  def campnew_last_path(topic)
    campnew_path(topic, page: (topic.total_pages if topic.total_pages > 1), anchor: (topic.comments_count if topic.comments_count > 0))
  end
end
