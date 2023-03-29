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
  end
end
