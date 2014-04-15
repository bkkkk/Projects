include Math

def PiTo(decimal)
  return (PI).round(decimal)
end

if __FILE__ == $0
  puts PiTo(2)
  puts PiTo(4)
  puts PiTo(10)
  puts PiTo(200)
end

