# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :teacher,
             class_name: 'User'

  belongs_to :student,
             class_name: 'User'

  belongs_to :subject, optional: true

  resourcify
end
