class Task < ApplicationRecord
  belongs_to :user
  has_one :reminder

  validates_associated :user
  validates :title, :description, :state, :begins_at, :deadline, presence: true

  delegate :one_hour_reminder_sent, :twenty_four_hour_reminder_sent, to: :reminder

  STATE_HASH = {'Backlog': 1, 'In Progress': 2, 'Done': 3}

  def incomplete?
    state != Task::STATE_HASH[:Done]
  end  
end
