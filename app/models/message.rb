class Message < ApplicationRecord
  resourcify
	belongs_to :user
	belongs_to :messanger,
	 	class_name: 'User',
	 	foreign_key: 'messanger_id'
end
