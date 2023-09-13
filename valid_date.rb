class ValidDate
  DATE_FORMAT = { 'year' => '%Y', 'month' => '%m', 'day' => '%d',
                     'hour' => '%H', 'minute' => '%M', 'second' => '%S' }.freeze

  def initialize(params)
    @format = params['format'].split(',') if params.key?('format')
  end

  def valid?
    invalid_params.empty?
  end

  def time
    Time.now.strftime(time_format)
  end


  def invalid_params
    @invalid_params ||= @format - DATE_FORMAT.keys
  end

  def time_format
    @format.select { |format| DATE_FORMAT.key?(format) }
                       .map { |format| DATE_FORMAT[format] }.join(':')
  end
end
