# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :email, uniqueness: true, on: :create
  validates :nome, presence: true, on: :create
  validates :ruolo, presence: true, on: :create
  rolify
  serialize :postals, Array
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  after_create :assign_default_role
  has_many :teaches, dependent: :destroy
  has_many :subjects, through: :teaches

  has_many :courses
  has_one_attached :avatar

  has_many :students,
           class_name: 'Course',
           foreign_key: :student_id

  has_many :teachers, through: :students

  has_many :teachers,
           class_name: 'Course',
           foreign_key: :teacher_id

  has_many :students, through: :teachers

  has_many :reviews, dependent: :destroy

  has_many :reviewers,
           class_name: 'Review',
           foreign_key: :reviewer_id
  has_many :reviewers, through: :reviews

  has_many :messages, dependent: :destroy

  has_many :messangers,
           class_name: 'Message',
           foreign_key: :messanger_id
  has_many :messangers, through: :messages

  def avatar_thumbnail
    avatar.variant(resize: '120x120!').processed
  end

  def self.search(search)
    if search
      User.where(email: search)
    else
      []
    end
  end

  def self.searchP(search)
    if search
      @user = User.all.select { |u| u.postals.include? search }
      @user
    else
      []
    end
  end

  def assign_default_role
    if email == 'michele.vitulli@outlook.it' # modificare questo campo con la mail identificativa dell'admin
      add_role(:admin)
    elsif ruolo == 'Insegnante'
      add_role(:teacher)
    elsif ruolo == 'Studente'
      add_role(:student)
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.nome = auth.info.name
    end
  end

  def media
    ris = 0
    num = 0
    reviews.each do |rev|
      num += 1
      temp = rev.valutazione.to_i
      ris += temp
    end
    tot = nil
    if num > 0
      tot = (ris/num.to_f).ceil(1)
    end
    return tot
    
  end

  attr_accessor :current_password
end
