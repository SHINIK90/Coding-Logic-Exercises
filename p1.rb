(1..100).each do |num|
  mod3 = num % 3 == 0
  mod5 = num % 5 == 0

  if !mod3 && !mod5
    puts num
  else
    str = ''
    if mod3
      str += 'Senir'
    end
    if mod5
      str += 'Op'
    end
    puts str
  end
end

  
