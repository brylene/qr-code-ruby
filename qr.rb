require "rqrcode"

puts "What kind of QR code would you like to generate?"
puts

puts 
puts "1. Open an URL"
puts
puts "2. Join a wifi network"
puts
puts "3. Send a text message"

choice = gets.chomp

if choice.include?("1")
  puts "Enter an URL:"
  puts

  qrcode_text = gets.chomp
  puts
elsif choice.include?("2")
  puts"Enter the name of the wifi network:"
  puts

  wifi_name = gets.chomp
  puts

  puts "What is the password?"
  puts

  password = gets.chomp

  qrcode_text = "WIFI:T:WPA;S:#{wifi_name};P:#{password};;"
elsif choice.include?("3")
  puts "Enter the phone number you want the code to send a text message to:"
  puts 

  phone_number = gets.chomp
  puts

  puts "What message would you like to send?"
  puts

  message = gets.chomp
  puts

  qrcode_text = "SMSTO:#{phone_number}:#{message}"
else
  puts "Please choose within selection option. "
  puts
end

puts "What would you like to name your QRCODE?"
puts

qrcode_name = gets.chomp
puts

qrcode = RQRCode::QRCode.new(qrcode_text)

png = qrcode.as_png({ :size => 500 })

IO.binwrite("#{qrcode_name}.png", png.to_s)
