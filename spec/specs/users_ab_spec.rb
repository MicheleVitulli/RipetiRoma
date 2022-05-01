# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

describe 'User' do
  # Studente
  context 'with student credentials' do
    before :each do
      # utenti
      @user = create :user
      @student = create(:user, email: 'studente@due.it')
      @teacher = create(:user, email: 'insegnante@uno.it')
      @user.add_role(:student)
      @student.add_role(:student)
      @teacher.add_role(:teacher)
      # recensioni
      @my_review = create(:review, reviewer: @user, user: @teacher)
      @other_review = create(:review, reviewer: @student, user: @teacher)
      # messaggi
      @my_message = create(:message, messanger: @teacher, user: @user)
      @other_message = create(:message, messanger: @teacher, user: @student)
      # caricamento ability
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
    it 'should create reviews' do
      expect(@ability).to be_able_to(:create, Review.new)
    end
    it 'should delete his reviews' do
      expect(@ability).to be_able_to(:destroy, @my_review)
    end
    it 'should not delete other review' do
      expect(@ability).to_not be_able_to(:destroy, @other_review)
    end
    it 'should create messages' do
      expect(@ability).to be_able_to(:create, Message.new)
    end
    it 'should delete my messages' do
      expect(@ability).to be_able_to(:destroy, @my_message)
    end
    it 'should not delete other messages' do
      expect(@ability).to_not be_able_to(:destroy, @other_message)
    end
  end
  # Insegnante
  context 'with teacher credentials' do
    before :each do
      # user
      @user = create :user
      @user.add_role(:teacher)
      @user2 = create(:user, email: 'user2@email.it')
      @user2.add_role(:teacher)
      test_student = create(:user, email: 'test@studente.it')
      test_student.add_role(:student)
      # course
      @my_course = create(:course, teacher: @user, student: test_student)
      @other_course = create(:course, teacher: @user2, student: test_student)
      # message
      @my_message = create(:message, messanger: test_student, user: @user)
      @other_message = create(:message, messanger: test_student, user: @user2)
      # ability
      @ability = Ability.new(@user)
    end
    it 'should  create subjects' do
      expect(@ability).to be_able_to(:create, Subject.new)
    end
    it 'should NOT delete subjects' do
      expect(@ability).to_not be_able_to(:destroy, Subject.new)
    end
    it 'should create/delete his courses' do
      expect(@ability).to be_able_to(:create, @my_course)
      expect(@ability).to be_able_to(:destroy, @my_course)
    end
    it 'should NOT delete others courses' do
      expect(@ability).to_not be_able_to(:destroy, @other_course)
    end
    it 'should NOT create/delete reviews' do
      expect(@ability).to_not be_able_to(:create, Review.new)
      expect(@ability).to_not be_able_to(:destroy, Review.new)
    end
    it 'should create messages' do
      expect(@ability).to be_able_to(:create, Message.new)
    end
    it 'should delete my messages' do
      expect(@ability).to be_able_to(:destroy, @my_message)
    end
    it 'should not delete other messages' do
      expect(@ability).to_not be_able_to(:destroy, @other_message)
    end
  end
  # Admin
  context 'with admin credentials' do
    before :each do
      # user
      @user = create :user
      @user.add_role(:admin)
      @student = create(:user, email: 'test@email.it')
      @student.add_role(:student)
      @teacher = create(:user, email: 'test@teacher.it')
      @teacher.add_role(:teacher)
      # review
      @review = create(:review, reviewer: @student, user: @teacher)
      # ability
      @ability = Ability.new(@user)
    end
    it 'should create/delete subjects' do
      expect(@ability).to be_able_to(:create, Subject.new)
      expect(@ability).to be_able_to(:destroy, Subject.new)
    end
    it 'should not create/delete courses' do
      expect(@ability).to_not be_able_to(:create, Course.new)
      expect(@ability).to_not be_able_to(:destroy, Course.new)
    end
    it 'should not create/delete reviews' do
      expect(@ability).to_not be_able_to(:create, Review.new)
      expect(@ability).to_not be_able_to(:destroy, @review)
    end
    it 'should delete other users or him' do
      expect(@ability).to be_able_to(:destroy, @student)
      expect(@ability).to be_able_to(:destroy, @user)
    end
    it 'should not edit other users' do
      expect(@ability).to_not be_able_to(:update, @student)
    end
  end
end
