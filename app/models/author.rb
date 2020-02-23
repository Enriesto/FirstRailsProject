# frozen_string_literal: true

class Author < ApplicationRecord
  has_and_belongs_to_many :books # Many to many association

  validates :name, presence: true
  # Note: Implicit requirement for FK since it
  #       belongs to the Book class
end
