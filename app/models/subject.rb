# frozen_string_literal: true

class Subject < ApplicationRecord
  validates_uniqueness_of :name, on: :create
  has_many :teaches
  has_many :users, through: :teaches

  has_many :course

  resourcify
end
