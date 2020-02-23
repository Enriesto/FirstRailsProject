# frozen_string_literal: true

class Book < ApplicationRecord
  has_and_belongs_to_many :authors # Many to many association

  validates :booktitle, presence: true
  validates :pages, numericality: { only_integer: true }
end
