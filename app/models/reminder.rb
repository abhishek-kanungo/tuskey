class Reminder < ApplicationRecord
  belongs_to :task

  def one_hour_reminder_sent
    self.reminder1 = Time.now
    self.reminder1_sent = true
    self.save!
  end
  
  def twenty_four_hour_reminder_sent
    self.reminder2 = Time.now
    self.reminder2_sent = true
    self.save!
  end  

  def one_hour_reminder_sent?
    !!reminder1_sent
  end

  def twenty_four_hour_reminder_sent?
    !!reminder2_sent
  end
end
