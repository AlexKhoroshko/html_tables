require 'rack'
require 'json'
require_relative 'modules/html_table'

class HtmlTablesApp
  def call(env)
    if env['REQUEST_METHOD'] == 'POST' && env['PATH_INFO'] == '/html_tables'
      request = Rack::Request.new(env)
      request_body = request.body.read
      payload = JSON.parse(request_body)

      begin
        response = HtmlTable.build(payload)
      rescue StandardError => e
        return [400, { 'Content-Type' => 'text/plain' }, [e.message]]
      end

      [200, { 'Content-Type' => 'text/plain' }, [{ data: CGI.escapeHTML(response) }.to_json]]
    else
      [404, { 'Content-Type' => 'text/plain' }, ['Not found']]
    end
  end
end
