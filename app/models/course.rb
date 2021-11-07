class Course < ApplicationRecord
	belongs_to :teacher
	belongs_to :student
	resourcify
end
