# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :list, optional: true

  scope :completed_tasks, -> { where(completed: true) }
  scope :incompleted_tasks, -> { where(completed: false) }

  has_paper_trail

  FILTER_TASKS_BY_STATES = {
    "Incompleted Tasks" => :incompleted_tasks,
    "Completed Tasks" => :completed_tasks,
    "Both" => :tasks
  }

  def create_or_update_list(list_params)
    if list.present?
      list.update(list_params)
    else
      create_list(list_params)
    end
  end
end
