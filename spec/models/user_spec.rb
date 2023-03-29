require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Password' do
    it 'fails if missing password' do
      @user = User.new({
        name: 'Steve-o',
        email: 'steve@steveplace.com',
        password: nil,
        password_confirmation: 'STEEVE'
      })
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:name]).to eq ["can't be blank"]
    end
  end
end
