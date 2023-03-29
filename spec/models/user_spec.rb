require 'rails_helper'

RSpec.describe User, type: :model do
  it 'saves if all fields are valid' do
  @user = User.new({
    name: 'Barker',
    email: 'bigb@hazardous.com',
    password: 'Banananas',
    password_confirmation: 'Banananas'
  })
  expect(@user).to be_valid
  end
  describe 'Password' do
    it 'fails if missing password' do
      @user = User.new({
        name: 'Steve-o',
        email: 'steve@steveplace.com',
        password: nil,
        password_confirmation: 'STEEEEVE'
      })
      expect(@user).to_not be_valid
      expect(@user.errors.messages.include?(:password))
    end
    it 'fails if different password in confirmation' do
      @user = User.new({
        name: 'Steve-o',
        email: 'steve@steveplace.com',
        password: 'STEEEEEVE',
        password_confirmation: 'STEEEEEEEEEVE'
      })
      expect(@user).to_not be_valid
      expect(@user.errors.messages.include?(:password))
    end
    it 'must have a minuimum of eight characters' do
      @user = User.new({
        name: 'Damian',
        email: 'fuzzydice@ureeka.biz',
        password: 'Fif',
        password_confirmation: 'Fif'
      })
      expect(@user).to_not be_valid
    end
  end
  describe 'E-mail address' do
    it 'must be unique' do
      @user = User.create({
        name: 'Steve-o',
        email: 'steve@steveplace.com',
        password: 'STEEEEEEVE',
        password_confirmation: 'STEEEEEEVE'
      })
      @user2 = User.create({
        name: 'steve',
        email: 'steve@steveplace.com',
        password: 'STEEEEEEVE2',
        password_confirmation: 'STEEEEEEVE2'
      })
      expect(@user2).to_not be_valid
      expect(@user2.errors.messages[:email]).to eq ["has already been taken"]
    end
  end
  describe '.authenticate_with_credentials' do
    it 'successfully authenticates with valid credentials' do
      @user = User.create({
        name: 'Damian',
        email: 'fuzzydice@ureeka.biz',
        password: 'Fifftieth',
        password_confirmation: 'Fifftieth'
      })
     expect(User.authenticate_with_credentials('fuzzydice@ureeka.biz', 'Fifftieth')).to be_truthy
    end
    it 'should'
  end

 

end
