require_relative '../app/twilio_api'

RSpec.describe TwilioAPI do
  subject { TwilioAPI.new(area_code: area_code) }
  let(:area_code) { '614' }

  describe '#available_numbers' do
    context 'with provided area code' do
      it 'GETs available phone numbers from Twilio' do
        expect_any_instance_of(Twilio::REST::Api::V2010::AccountContext::AvailablePhoneNumberCountryContext::LocalList).to \
          receive(:list).with({area_code: area_code})
        subject.available_numbers
      end
    end

    context 'without an area code' do
      let(:area_code) { nil }
      it 'throws a MissingAreaCode error' do
        expect{subject.available_numbers}.to raise_error(TwilioAPI::MissingAreaCode)
      end
    end
  end
end

