require 'rails_helper'
require 'cancan/matchers'

describe 'User' do
  # Studente
  context 'with student credentials' do
    before :each do
      @user = create :user
      @user.add_role(:student)
      @ability = Ability.new(@user)
    end
    it 'should NOT create/delete subjects' do
      expect(@ability).to_not be_able_to(:create, Subject.new)
      expect(@ability).to_not be_able_to(:destroy, Subject.new)
    end
    it 'should NOT create/delete courses' do
      expect(@ability).to_not be_able_to(:create, Course.new)
      expect(@ability).to_not be_able_to(:destroy, Course.new)
    end
  end
  # Insegnante
  context 'with teacher credentials' do
    before :each do
      @user = create :user
      @user.add_role(:teacher)
      @ability = Ability.new(@user)
      test_student = create(:user, email: "test@studente.it")
      test_student.add_role(:student)
      @my_course = create(:course, teacher: @user, student: test_student)
      
    end
    it 'should NOT create/delete subjects' do
      expect(@ability).to_not be_able_to(:create, Subject.new)
      expect(@ability).to_not be_able_to(:destroy, Subject.new)
    end
    it 'should create/delete his courses' do
      expect(@ability).to be_able_to(:create, @my_course)
      expect(@ability).to be_able_to(:destroy, @my_course)
    end
    it 'should NOT create/delete others courses' do
        expect(@ability).to_not be_able_to(:create, Course.new)
        expect(@ability).to_not be_able_to(:destroy, Course.new)
      end
  end
  # Admin
  context 'with admin credentials' do
    before :each do
      @user = create :user
      @user.add_role(:admin)
      @ability = Ability.new(@user)
    end
    it 'should create/delete subjects' do
      expect(@ability).to be_able_to(:create, Subject.new)
      expect(@ability).to be_able_to(:destroy, Subject.new)
    end
    it 'should create/delete courses' do
      expect(@ability).to be_able_to(:create, Course.new)
      expect(@ability).to be_able_to(:destroy, Course.new)
    end
  end
end
