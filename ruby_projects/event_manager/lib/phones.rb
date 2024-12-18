require 'csv'

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

def clean_phone_number (phone)
  number = phone.to_s.gsub(/[^\d]/, '')
  if number.length < 10 || number.length > 11
    "Invalid number"
  elsif number.length == 11 && number[0] != "1"
    "Invalid number"
  elsif number.length == 11 && number[0] == "1"
   number[1..10]
  else
   number
  end
end

contents.each do |row|
  name = row[:first_name]
  phone = clean_phone_number(row[:homephone])
  puts "#{name}, #{phone}"
end