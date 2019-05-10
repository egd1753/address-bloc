def greeting
  ARGV.drop(1).each do |name|
    puts "#{ARGV[0]} #{name}"
  end
end

greeting
