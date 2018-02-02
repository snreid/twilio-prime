require 'twilio-ruby'

class TwilioAPI
  class MissingAreaCode < StandardError
    def message
      'An area code must be present to search available phone numbers'
    end
  end

  ACCOUNT_SID = ''.freeze
  AUTH_TOKEN = ''.freeze

  attr_accessor :client, :area_code
  def initialize(area_code: nil)
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    @area_code = area_code
  end

  def available_numbers
    raise MissingAreaCode if area_code.nil? || area_code.empty?
    client.api.available_phone_numbers('US').local.list(area_code: area_code)
  end
end
