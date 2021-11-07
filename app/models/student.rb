class Student < ApplicationRecord
  has_one :teacher, through :courses
  has_many :courses
  resourcify
end
