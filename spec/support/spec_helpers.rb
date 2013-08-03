def dummy_organisation
  Organisation.create(name: "Test Organisation", key: "test-organisation")
end

def should_change_by(inline_code, integer_to_change_by = 1, &block)
  before_value = eval(inline_code)
  yield
  after_value = eval(inline_code)
  after_value.should eq(before_value + integer_to_change_by)
end

def current_organisation
  Organisation.where(:id => session[:organisation_id]).first
end
