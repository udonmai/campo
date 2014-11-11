module Admin::CampnewsHelper
  def link_to_admin_campnew(topic)
    if topic.nil?
      "Topic had been destroy"
    else
      link_to topic.title, admin_campnew_path(topic)
    end
  end
end
