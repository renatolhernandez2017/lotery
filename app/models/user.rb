# frozen_string_literal: true

class User < ApplicationRecord
  audited

  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  before_save { self.email = email.downcase }

  has_many :sales
end
