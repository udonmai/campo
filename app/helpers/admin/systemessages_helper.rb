module Admin::SystemessagesHelper
  def link_to_admin_systemessage(topic)
    if topic.nil?
      "Topic had been destroy"
    else
      link_to topic.title, admin_systemessage_path(topic)
    end
  end
end
