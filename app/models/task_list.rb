class TaskList < ActiveRecord::Base
  has_many :tasks

  validates :task, presence: true
end