class ReminderMailer < ApplicationMailer

    default from: "from@tuskey.com"

    def one_hour_reminder(task)
      @task = task
      @user = @task.user
      mail(to: @user.email, subject: '1 hour reminder')
    end

    def twenty_four_hour_reminder(task)
        @task = task
        @user = @task.user
        mail(to: @user.email, subject: '24 hour reminder')
      end
  
end
