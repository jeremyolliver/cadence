require 'spec_helper'

describe OrganisationsController do

  describe 'GET #index' do
    it 'should render without any organisations' do
      get :index
      response.should be_success
      assigns(:organisations).should be_empty
    end
    it 'should render with some organisations' do
      (1..3).each {|i| Organisation.create({name: "Organisation #{i}", key: "organisation-#{i}"}) }
      get :index
      response.should be_success
      assigns(:organisations).should
    end
  end

end
