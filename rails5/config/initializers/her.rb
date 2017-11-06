api_end_point = "http://localhost:3000/v1"

Her::API.setup url: api_end_point do |c|
  # Request
  c.use Faraday::Request::UrlEncoded

  # Response
  c.use Her::Middleware::DefaultParseJSON

  # Adapter
  c.use Faraday::Adapter::NetHttp
end
