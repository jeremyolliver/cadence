require 'spec_helper'

describe Project do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:key) }
  it { should validate_uniqueness_of(:key).scoped_to(:organisation_id) }
  it { should validate_presence_of(:organisation) }

  it 'should make the key URI safe' do
    project = Project.new(name: 'X', key: "Foo' Bar")
    project.save
    project.key.should eq('Foo-Bar')
  end

end
