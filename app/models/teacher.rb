class Teacher < ApplicationRecord
  has_one :student, through :courses
  has_many :subjects
  has_many :courses
  resourcify
end
