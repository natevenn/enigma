require_relative 'decryptor'

message = File.read(ARGV[0]).chomp
# key = rand(0..99999)
# date = Time.new.strftime("%d""%m""%y")

decrypted = Decryptor.new(message, key = ARGV[2], date = ARGV[3]).decrypt

File.write(ARGV[1], decrypted)

puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
