require_relative 'valid_date'

class App
  def call(env)
    @request = Rack::Request.new(env)

    if @request.path == '/time'
      time_format(@request.params)
    else
      response 404, 'Not found'
    end
  end

  private

  def time_format(params)
    @format_date = ValidDate.new(params)
    if @format_date.valid?
      response 200, @format_date.time.to_s
    else
      response 400, "Unknows time formats [#{@format_date.invalid_params.join(', ')}]"
    end
  end

  def headers
    { 'content-type' => 'text/plain' }
  end

  def response(status, body)
    [status, headers, [body + "\n"]]
  end
end
