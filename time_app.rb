require_relative 'valid_date'

class TimeApp
  def call(env)
    @request = Rack::Request.new(env)
    time_format(@request.params)
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

  def response(status, body)
    [status, {}, [body + "\n"]]
  end
end
