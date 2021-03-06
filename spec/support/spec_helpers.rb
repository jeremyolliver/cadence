def dummy_organisation
  if org = Organisation.where(key: "test-organisation").first
    org
  else
    Organisation.create(name: "Test Organisation", key: "test-organisation")
  end
end

def dummy_project
  if project = Project.where(key: 'test-project').first
    project
  else
    dummy_organisation.projects.create(name: "Test Project", key: "test-project")
  end
end

def coverage_metric_type
  coverage = MetricType.where(key: "coverage").first || MetricType.new(key: "coverage")
  coverage.attributes = {
    name:          "Code Coverage",
    key:           "coverage",
    format_suffix: "%",
    min_value:     0,
    max_value:     100,
    positive:      true
  }
  coverage.save!
  coverage
end

def should_change_by(inline_code, integer_to_change_by = 1, &block)
  before_value = eval(inline_code, block.binding)
  yield
  after_value = eval(inline_code, block.binding)
  after_value.should eq(before_value + integer_to_change_by)
end

def should_not_change(inline_code, &block)
  before_value = eval(inline_code, block.binding)
  yield
  after_value = eval(inline_code, block.binding)
  after_value.should eq(before_value)
end

def current_organisation
  Organisation.where(:id => session[:organisation_id]).first
end

def as_organisation(org)
  session[:organisation_id] = org.id
end
