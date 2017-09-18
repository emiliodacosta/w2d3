class Array

  def my_uniq
    self.uniq
  end

  def two_sum
    pair_arr =[]

    for i in 0...self.length-1
      for j in i...self.length
        if self[i] + self[j] == 0
          pair_arr <<  [i, j]
        end
      end
    end
    pair_arr
  end

  def my_transpose
    self.transpose
  end

  def stock_picker
    b = 0
    s = self.length-1
    self.each_with_index do |el,idx|
      if el < self[b]
        b = idx
        s = self.length-1
      end
      s = idx if el > self[s]
    end
    [b,s]
  end

end
