require 'rails_helper'

RSpec.describe Admin, :type => :model do
  before { @admin = FactoryGirl.build(:admin) }
  subject { @admin }

  it 'is valid with a fullname, email and password' do
    should be_valid
  end

  it 'is invalid without fullname' do
    @admin.fullname = nil
    should_not be_valid
  end

  it 'is invalid without email' do
    @admin.email = nil
    should_not be_valid
  end

  it 'is invalid without password' do
    @admin.password = nil
    should_not be_valid
  end

  it 'is invalid without company' do
    @admin.company_id = nil
    should_not be_valid
  end

  it 'is invalid with duplicate email' do
    another_admin = FactoryGirl.create(:admin)
    @admin.email = another_admin.email.camelcase
    should_not be_valid
  end

  it 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @admin.email = valid_address
      should be_valid
    end
  end

  it 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @admin.email = invalid_address
      should_not be_valid
    end
  end
end