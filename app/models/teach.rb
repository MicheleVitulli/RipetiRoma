class Teach < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  resourcify
end
