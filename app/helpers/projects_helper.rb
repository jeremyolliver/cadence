module ProjectsHelper

  def formatted_metric_value(metric)
    type = metric.metric_type
    # TODO: perhaps worth adding a precision to MetricType and using it here when displaying value
    "#{type.format_prefix}#{sprintf("%.2f", metric.value)}#{type.format_suffix}"
  end

  def friendly_datetime_format(datetime)
    datetime.strftime("%I:%M:%S%P %-d %B %Y")
  end

end
