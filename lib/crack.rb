require_relative 'cracker'

message = File.read(ARGV[0]).chomp
key = rand(0..99999)
date = Time.new.strftime("%d""%m""%y")

crack = Crack.new(message, date = nil).crack

File.write(ARGV[1], crack)

puts "Created #{ARGV[1]} with the key #{key} and date #{ARGV[3]}"
