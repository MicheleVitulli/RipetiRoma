class Teacher < ApplicationRecord
  has_one :student, through: :courses
  has_and_belongs_to_many :subjects
  has_many :subjects
  has_many :courses
  resourcify
end
