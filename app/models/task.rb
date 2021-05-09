class Task < ApplicationRecord
  belongs_to :user

  validates_associated :user
  validates :title, :description, :state, :begins_at, :deadline, presence: true


  STATE_HASH = {'Backlog': 1, 'In Progress': 2, 'Done': 3}
end
