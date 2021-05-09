class ReminderNotification
    def initialize(task)
      @task = task
      @reminder = @task.reminder || @task.create_reminder
    end

    def set_reminder
        return unless  @task.incomplete?
        
        if (@task.deadline - 1.hour).past? && !@reminder.one_hour_reminder_sent?
            self.delay(run_at: @task.deadline - 1.hour).send_one_hour_reminder_mail
        end  
        
        if (@task.deadline - 24.hours).past? && !@reminder.twenty_four_hour_reminder_sent?
            self.delay(run_at: @task.deadline - 24.hours).send_twenty_four_hour_reminder_mail
        end 
    end 
    
    def send_one_hour_reminder_mail
        if @task.incomplete? 
            ReminderMailer.one_hour_reminder(@task).deliver_now
            @reminder.one_hour_reminder_sent
        end    
    end    

    def send_twenty_four_hour_reminder_mail
        if @task.incomplete?
            ReminderMailer.twenty_four_hour_reminder(@task).deliver_now
            @reminder.twenty_four_hour_reminder_sent
        end  
    end      
end    