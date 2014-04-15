def GetFloorPrice(w, h, price)
  return (w * h * price)
end

if __FILE__ == $0
  puts GetFloorPrice(12, 12, 0.1)
end
