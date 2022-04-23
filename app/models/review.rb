# frozen_string_literal: true

class Review < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :reviewer,
             class_name: 'User',
             foreign_key: 'reviewer_id'
end
