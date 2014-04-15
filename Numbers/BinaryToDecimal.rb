#!/usr/bin/ruby

def DecimalToBinary(n)
  temp = n
  binary = Array.new(8, 0)
  
  i = 7
  until i == -1
    power = 2**i
    if power <= temp
      temp -= power
      binary[i] = 1
    end
    i -= 1
  end

  return binary.reverse
end

def BinaryToDecimal(n)
  result = 0

  result += n[0]*1
  result += n[1]*2
  result += n[2]*4
  result += n[3]*8
  result += n[4]*16
  result += n[5]*32
  result += n[6]*64
  result += n[7]*128

  return result
end

if __FILE__ == $0
  puts DecimalToBinary(1).join(", ")
  puts DecimalToBinary(16).join(", ")
  puts DecimalToBinary(17).join(", ")
  puts DecimalToBinary(255).join(", ")
end
