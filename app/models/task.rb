# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :list, required: false

  accepts_nested_attributes_for :list
end
