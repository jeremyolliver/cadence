# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
