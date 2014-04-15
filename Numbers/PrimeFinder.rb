def PrimeFinder(upto)
  
  for n in 0..upto
    # 0 and 1 are not prime numbers
    if (n == 0 or n == 1); next

    # If number is even but not 2 it is not prime
    factor, remainder = n.divmod(2)
    if remainder == 0
      if factor == 1; puts n
      next;

    end

    # Since number is not even do simple trial division
    isPrime = true
    for divisor in 2..Math.sqrt(n)
      factor, remainder = n.divmod(divisor)
      
      if(remainder == 0)
        isPrime = false
        break
      end

    end

    # Since no divisor has been found
    if isPrime == true; puts n

  end # for n until upto
end

if __FILE__ == $0; PrimeFinder(100)
