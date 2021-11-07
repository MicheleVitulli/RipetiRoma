class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role



  def assign_default_role
    if self.email == "michele.vitulli@outlook.it"
      self.add_role(:admin)
    else
      self.add_role(:guest) if self.roles.blank?
    end
  end

end
