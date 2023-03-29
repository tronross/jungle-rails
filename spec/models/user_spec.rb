require 'rails_helper'

RSpec.describe User, type: :model do
  it 'saves if all fields are valid' do
  @user = User.new({
    name: 'Steve-o',
    email: 'steve@steveplace.com',
    password: 'STEEVE',
    password_confirmation: 'STEEVE'
  })
  expect(@user).to be_valid
  end
  describe 'Password' do
    it 'fails if missing password' do
      @user = User.new({
        name: 'Steve-o',
        email: 'steve@steveplace.com',
        password: nil,
        password_confirmation: 'STEEVE'
      })
      expect(@user).to_not be_valid
      expect(@user.errors.messages.include?(:password))
    end
    it 'fails if different password in confirmation' do
      @user = User.new({
        name: 'Steve-o',
        email: 'steve@steveplace.com',
        password: 'STEEVE',
        password_confirmation: 'STEEEVE'
      })
      expect(@user).to_not be_valid
      expect(@user.errors.messages.include?(:password))
    end
  end
  describe 'E-mail address' do
    it 'must be unique' do
      @user = User.create({
        name: 'Steve-o',
        email: 'steve@steveplace.com',
        password: 'STEEVE',
        password_confirmation: 'STEEVE'
      })
      @user2 = User.create({
        name: 'steve',
        email: 'steve@steveplace.com',
        password: 'STVE',
        password_confirmation: 'STVE'
      })
      expect(@user2).to_not be_valid
      expect(@user2.errors.messages[:email]).to eq ["has already been taken"]
    end
  end
end
