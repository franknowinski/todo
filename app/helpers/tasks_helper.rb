# frozen_string_literal: true

module TasksHelper
  def user_email(user_id)
    User.find_by(id: user_id)&.email
  end
end
