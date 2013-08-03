require 'spec_helper'

describe ProjectsController do

  describe 'GET #index' do
    it 'should redirect with no organisations' do
      get :index
      response.should redirect_to(organisations_path)
    end

    it 'should render projects summary given an organisation' do
      org = dummy_organisation
      session[:organisation_id] = org.id
      get :index
      response.should be_success
      # TODO: assigns(:projects).map(&:organisation).uniq.should eq(org)
    end
  end

end
