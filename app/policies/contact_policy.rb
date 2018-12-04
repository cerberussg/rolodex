# frozen_string_literal: true

# Custom ContactPolicy class for Pundit
class ContactPolicy < ApplicationPolicy
  def update?
    user.id == record.user_id
  end

  def destroy?
    update?
  end
end
