class MusicDistributionMailer < ApplicationMailer
  before_action :spofify

  INSTANT_DELIVERY_SUBJECT = "即時配信です"
  REGULAR_DELIVERY_SUBJECT = "定時配信です"

  def instant_delivery(user)
    @user = user
    mail(to: user.mail_address, subject: INSTANT_DELIVERY_SUBJECT)
  end

  def regular_deliverry(user)
    @user = user
    mail(to: user.mail_address, subject: REGULAR_DELIVERY_SUBJECT)
  end

  CLIENT_ID = ENV["CLIENT_ID"]
  CLIENT_SECRET = ENV["CLIENT_SECRET"]
  TOKEN_URI = 'https://accounts.spotify.com/api/token'.freeze
  API_URI = 'https://api.spotify.com/v1/search?'.freeze

  def spofify
    @client_token = authenticate
    @album = get_random_album
  end

  def authenticate
    request_body = { grant_type: 'client_credentials' }
    response = RestClient.post(TOKEN_URI, request_body, auth_header)
    JSON.parse(response)['access_token']
  end

  def auth_header
    authorization = Base64.strict_encode64("#{CLIENT_ID}:#{CLIENT_SECRET}")
    { 'Authorization' => "Basic #{authorization}" }
  end

  def get_random_album
    query = "q=year:#{get_randam_year}&type=album&-market&limit=50&offset=#{get_random(1999)}"

    uri = URI.parse(API_URI + query)
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Get.new(uri.request_uri)
    req["Authorization"] = "Bearer #{@client_token}"

    res = http.request(req)
    api_response = JSON.parse(res.body)
    api_response["albums"]["items"][get_random(49)]
  end

  def get_randam_year
    d = Date.today
    (1960..d.year).to_a.sample
  end

  def get_random(n)
    Random.rand(0 .. n)
  end

end