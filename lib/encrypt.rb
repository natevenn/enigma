require_relative 'encryptor'

message = File.read(ARGV[0]).chomp
key = rand(0..99999)
date = Time.new.strftime("%d""%m""%y")

encrypted = Encryptor.new(message, key, date).encrypt

File.write(ARGV[1], encrypted)

puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
