require_relative 'decryptor'

message = File.read(ARGV[0]).chomp
key = rand(0..99999)
date = Time.new.strftime("%d""%m""%y")

decrypted = Decryptor.new(message, key, date = nil).decrypt

File.write(ARGV[1], decrypted)

puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
