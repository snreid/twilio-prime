require 'prime'

class PhoneNumber
  attr_accessor :original_number, :number
  def initialize(number)
    @original_number = number
    @number = number.gsub(/\D/, '').to_i
  end

  def prime?
    Prime.prime? number
  end
end

