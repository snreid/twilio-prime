require_relative '../app/phone_number'

RSpec.describe PhoneNumber do
  subject { PhoneNumber.new(phone_number) }
  let(:phone_number) { '+14197090928' }

  describe '#initialize' do
    it 'sets instance variables' do
      expect(subject.original_number).to eq(phone_number)
      expect(subject.number).to eq(14197090928)
    end
  end

  describe '#prime' do
    context 'phone number is not a prime number' do
      it 'returns false' do
        expect(subject.prime?).to be false
      end
    end

    context 'phone number is a prime number' do
      let(:phone_number) { '+16143330347' }

      it 'returns true' do
        expect(subject.prime?).to be true
      end
    end

  end
end
