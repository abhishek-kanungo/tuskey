class ReminderNotification
    def initialize(task)
      @task = task
    end

    def set_reminder
        return unless  @task.incomplete?
        
        unless (@task.deadline - 1.hour).past?
            self.delay(run_at: @task.deadline - 1.hour).send_one_hour_reminder_mail
        end  
        
        unless (@task.deadline - 24.hours).past?
            self.delay(run_at: @task.deadline - 24.hours).send_twenty_four_hour_reminder_mail
            @task.twenty_four_hour_reminder_sent
        end 
    end 
    
    def send_one_hour_reminder_mail
        if @task.incomplete? && !one_hour_reminder_sent?
            ReminderMailer.one_hour_reminder(@task) 
            @task.one_hour_reminder_sent
        end    
    end    

    def send_twenty_four_hour_reminder_mail
        if @task.incomplete? && !twenty_four_hour_reminder_sent?
            ReminderMailer.twenty_four_hour_reminder(@task)
            @task.twenty_four_hour_reminder_sent
        end  
    end    
end    