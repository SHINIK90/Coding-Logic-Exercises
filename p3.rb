class BicycleLock
  def makeDistinct(dials)
    seen = []
    actions = ''
    dials.each_with_index do |digit, i|
      while seen.include?(digit)
        digit = (digit + 1) % 10
        actions += '+'
      end
      seen.push(digit)
      if i != (dials.length - 1)
        actions += '>'
      end
    end

    actions
  end
end
# Example usage:
lock = BicycleLock.new
dials = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
actions =  lock.makeDistinct(dials) 
puts actions
puts "Actions: " + actions.length.inspect
