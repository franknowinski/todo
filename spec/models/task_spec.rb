# frozen_string_literal: true

require 'rails_helper'

describe Task, type: :model do
  context 'with no name' do
    it 'is invalid' do
      task = Task.new
      expect(task).to_not be_valid
    end
  end

  context 'with a name but no user' do
    it 'is invalid' do
      task = Task.new(name: "First task")
      expect(task).to_not be_valid
    end
  end

  context 'with a name and a user' do
    it 'is valid' do
      user = User.new(email: "email@gmail.com", password: "password")
      task = Task.new(name: "First task", user: user)
      expect(task).to be_valid
    end
  end
end
