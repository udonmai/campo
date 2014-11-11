module Admin::CampusharesHelper
  def link_to_admin_campushare(topic)
    if topic.nil?
      "Topic had been destroy"
    else
      link_to topic.title, admin_campushare_path(topic)
    end
  end
end
