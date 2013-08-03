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

  describe 'GET #show' do
    it 'should display the project'
  end

  describe 'GET #new' do
    it 'should render the form'
  end

  describe 'GET #edit' do
    it 'should render the form'
  end

  describe 'POST #create' do
    it 'should create a new project'
    it 'should enfore required fields'
  end

  describe 'PATCH #update' do
    it 'should update a project'
    it 'should enforce required fields'
  end

  def valid_params
    {'name' => 'Sunrise', 'key' => 'sunrise', 'public' => true}
  end

  def invalid_params
    {'name' => nil, 'key' => 'sunrise', 'public' => true}
  end

end
