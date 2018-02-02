require './app/phone_number'
require './app/twilio_api'

twilio = TwilioAPI.new
begin

puts "Please enter an area code (e.g. 614)"
input = gets.chomp
@area_code = input
twilio.area_code = input

numbers = twilio.available_numbers.collect { |number| PhoneNumber.new(number.phone_number) }

primes = numbers.select { |number| number.prime? }

if primes.count > 0
  puts "We found #{primes.count} prime number(s) in that area code!"
  primes.each { |number| puts number.original_number }
else
  puts "Oops, looks like there aren't any prime numbers to be found here."
end

puts ""
puts "Would you like to try another area code? [yes, no]"
input = gets.chomp

end while input.downcase == "y" || input.downcase == "yes"

