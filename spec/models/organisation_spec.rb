require 'spec_helper'

describe Organisation do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:key) }
  it { should validate_uniqueness_of(:key) }
  # it { should validate_presence_of(:api_token) }
  it { should validate_uniqueness_of(:api_token) }
  # it { should have_many(:users).through(:user_permissions) }

  it 'should assign an api_token on create' do
    org = Organisation.new({
      :name => 'Code Kids',
      :key => 'code-kids'
    })
    org.api_token.should be_blank
    org.save
    org.api_token.should_not be_blank
  end

  it 'should make the key URI safe'
end
