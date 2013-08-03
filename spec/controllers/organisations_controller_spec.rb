require 'spec_helper'

describe OrganisationsController do
  render_views # TODO: should probably move this and body assertions out to a separate view test or integration test

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
      assigns(:organisations).size.should eq(3)
    end
  end

  describe 'GET #show' do
    it 'should render' do
      org = dummy_organisation
      get :show, :id => org.key
      response.should be_success
      response.body.should match /#{org.name}/
    end
  end

  describe 'GET #new' do
    it 'should render the form' do
      get :new
      response.should be_success
      assert_select "form.organisation" do
        assert_select "input[name=?]", "organisation[name]"
        assert_select "input[name=?]", "organisation[key]"
      end
    end
  end

  describe 'POST #create' do
    it 'should fail without required attributes' do
      post :create, {'organisation' => {'name' => "Bill's Organisation"} }
      response.status.should eq(400)
      response.should render_template('new')
    end

    it 'should successfully create an organisation' do
      should_change_by('Organisation.count', 1) do
        post :create, {'organisation' => {'name' => "Bill's Organisation", 'key' => "bills-organisation"} }
      end
      response.should redirect_to organisations_path
      Organisation.where('key' => "bills-organisation").first.name.should eq("Bill's Organisation")
    end
  end

end
