class NearPalindromesDiv1

  def initialize
    @opNum = 0
    @alphabet = {}
    ('a'..'z').each_with_index do |letter, i|
      @alphabet[letter] = i
    end
  end

  def solve(str)
    @opNum = 0
    @indexArr = (0..(str.length - 1)).to_a
    @numArr= strToNumArray(str)
    turnToNearPalindromeRecursively()
    puts "num array: " + @numArr.inspect
    puts "array: " + numArrToStrArray(@numArr).inspect
    puts "number of operations:" + @opNum.inspect
  end

  private
    attr_accessor :alphabet, :indexArr, :numArr, :opNum

  def strToNumArray(str)
    arr =[]
    str.each_char do |char|
      arr.push(@alphabet[char])
    end
    arr
  end

  def numArrToStrArray(numArray)
    arr =[]
    numArray.each do |num|
      arr.push(@alphabet.key(num))
    end
    arr
  end

  def turnToNearPalindromeRecursively
    dif = @alphabet.length
    i1 = 0
    i2 = 0
    loops = false
    @indexArr.each do |i|
      @indexArr.each do |j|
        if i != j
          line_dist = (@numArr[i]-@numArr[j]).abs
          loop_dist = [@numArr[i],@numArr[j]].min + @alphabet.length - [@numArr[i],@numArr[j]].max
          puts @alphabet.key(@numArr[i]) + "->" + @alphabet.key(@numArr[j]) + " || line:" + line_dist.inspect + " loop:" + loop_dist.inspect
          dist = [line_dist,loop_dist].min
          puts "min dist:" + dist.inspect
          loops = loop_dist < line_dist

          if dist < dif
            dif = dist
            i1 = i
            i2 = j
          end

        end
      end
    end

    @opNum += dif
    puts "before == " + @numArr[i1].inspect + ":" + @numArr[i2].inspect
    if loops
      @numArr[i1] < @numArr[i2]? @numArr[i2] = (@numArr[i2] + dif) % @alphabet.length : @numArr[i1] = (@numArr[i1] + dif) % @alphabet.length
    else
      @numArr[i1] < @numArr[i2]? @numArr[i1] += dif : @numArr[i2] = @numArr[i2] + dif
      puts "not loops| dif=" + dif.inspect
    end
    puts "after == " + @numArr[i1].inspect + ":" + @numArr[i2].inspect

    @indexArr.delete(i1)
    @indexArr.delete(i2)

    if @indexArr.length > 1
      turnToNearPalindromeRecursively()
    end
    
  end
end

solver = NearPalindromesDiv1.new
puts "Please enter a string:"
input_str = gets.chomp
solver.solve(input_str)