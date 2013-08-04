require 'spec_helper'

describe ProjectsController do
  render_views

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

  describe 'as an organisation' do
    before do
      as_organisation(dummy_organisation)
    end

    describe 'GET #show' do
      it 'should display the project' do
        project = dummy_project
        get :show, 'id' => project.key
        response.should be_success
        response.body.should match project.name
      end
    end

    describe 'GET #edit' do
      it 'should render the form' do
        project = dummy_project
        get :edit, 'id' => project.key
        response.should be_success
        assert_select 'form.project'
      end
    end

    describe 'GET #new' do
      it 'should render the form' do
        get :new
        response.should be_success
        assert_select 'form.project'
      end
    end

    describe 'POST #create' do
      before do
        @organisation = dummy_organisation
      end
      it 'should create a new project' do
        should_change_by('@organisation.projects.count', 1) do
          post :create, 'project' => valid_params(@organisation)
        end
        project = @organisation.projects.where(key: valid_params['key']).first
        project.name.should eq(valid_params['name'])
      end
      it 'should enforce required fields' do
        should_not_change('@organisation.projects.count') do
          post :create, 'project' => invalid_params
        end
        response.status.should eq(400)
        response.should render_template('new')
        assert_select 'form.project' do
          assert_select '.error'
        end
      end
      it 'should not permit an organisation belonging to someone else' do
        pending
      end
    end

    describe 'PATCH #update' do
      before do
        @project = dummy_project
      end
      it 'should update a project' do
        should_not_change('Project.count') do
          patch :update, {'id' => @project.key, 'project' => {'name' => 'Doowap: The Return'} }
        end
        @project.reload.name.should eq('Doowap: The Return')
        response.should redirect_to(project_path(@project))
      end
      it 'should enforce required fields' do
        should_not_change('Project.count') do
          patch :update, {'id' => @project.key, 'project' => {'name' => nil} }
        end
        response.status.should eq(400)
        response.should render_template('edit')
        assert_select 'form.project' do
          assert_select '.error'
        end
        @project.reload.name.should_not be_nil
      end
      it 'should not permit an organisation belonging to someone else' do
        pending
      end
    end

  end

  def valid_params(organisation = nil)
    params = {'name' => 'Sunrise', 'key' => 'sunrise', 'public' => true }
    params['organisation_id'] = organisation.id if organisation
    params
  end

  def invalid_params
    {'name' => nil, 'key' => 'sunrise', 'public' => true}
  end

end
