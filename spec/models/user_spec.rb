require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without a first name' do
    expect(build(:user, first_name: nil)).to be_invalid
  end

  it 'is invalid without a last name' do
    expect(build(:user, last_name: nil)).to be_invalid
  end

  it 'is invalid without a location' do
    expect(build(:user, location: nil)).to be_invalid
  end

  it 'is invalid without a unique email' do
    original = create(:user)
    duplicate = build(:user, email: original.email)
    expect(duplicate).to be_invalid
  end

  it 'is invalid when the email is not valid' do
    expect(build(:user, email: 'tst^test.com')).to be_invalid
  end
end
