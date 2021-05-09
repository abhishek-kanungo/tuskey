class Task < ApplicationRecord
  belongs_to :user

  STATE_HASH = {'Backlog': 1, 'In Progress': 2, 'Done': 3}
end
