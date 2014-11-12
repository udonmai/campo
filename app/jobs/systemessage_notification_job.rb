class SystemessageNotificationJob
  @queue = 'notification'

  def self.perform(systemessage_id)
    systemessage = Systemessage.find systemessage_id
    create_systemessage_notification(systemessage)
  end

  def self.create_systemessage_notification(systemessage)
      users = User.all
      users.each do |user|
        Notification.create(user: user,
                            subject: systemessage,
                            name: 'systemessage')

        if user.confirmed? && user.send_systemessage_email?
          NotificationMailer.systemessage(user.id, systemessage.id).deliver
        end
      end
  end
end
