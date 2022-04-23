# frozen_string_literal: true

class Teach < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  resourcify
end
