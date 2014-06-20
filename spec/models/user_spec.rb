require 'spec_helper'

describe User do
  before do
    @valid_user = User.create!(email: 'kaylee@example.com', password: 'password')
  end

  it 'Prevents duplicate emails from being created' do
    invalid_user = User.create(email: 'kaylee@example.com', password: 'password')

    expect(@valid_user).to be_valid
    expect(invalid_user).to be_invalid
  end

  it 'Prevents users from being created without an email' do
    invalid_user = User.create(email: '', password: 'password')

    expect(invalid_user).to be_invalid
  end

  it 'Prevents users from being created without a password' do
    invalid_user = User.create(email: 'kaylee@example.com', password: '')

    expect(invalid_user).to be_invalid
  end

end