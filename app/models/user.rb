class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :lists, through: :tasks

  delegate :completed_tasks, :incompleted_tasks, to: :tasks

  def fetch_tasks(filter_tasks_by)
    method = Task::FILTER_TASKS_BY_STATES.fetch(filter_tasks_by, :incompleted_tasks)
    send(method)
  end
end
