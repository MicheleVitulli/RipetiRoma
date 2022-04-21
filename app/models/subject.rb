# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :teaches
  has_many :users, through: :teaches

  has_many :course

  resourcify
end
