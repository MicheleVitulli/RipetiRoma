class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role
  has_many :teaches
  has_many :subjects, through: :teaches

  has_many :courses


  has_many :students,
    class_name: 'Course',
    foreign_key: :student_id

  has_many :teachers, through: :students

  has_many :teachers,
    class_name: 'Course',
    foreign_key: :teacher_id

  has_many :students, through: :teachers


#######
  has_many :reviews

  has_many :reviewed,
    class_name: 'Review',
    foreign_key: :reviewer_id
######
has_many :messages

has_many :messaged,
  class_name: 'Message',
  foreign_key: :messanger_id













  def assign_default_role
    if self.email == "michele.vitulli@outlook.it"
        self.add_role(:admin)
    elsif self.ruolo == 'Insegnante'
        self.add_role(:teacher)
    elsif self.ruolo == 'Studente'
        self.add_role(:student)
    end
  end
end
