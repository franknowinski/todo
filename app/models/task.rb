# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true
  belongs_to :list

  accepts_nested_attributes_for :list
end
