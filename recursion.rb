require 'byebug'

def range(min, max)
  return [] if max <= min
  rec = range(min+1, max)
  rec.unshift(min)
end

def sum_rec(array)
  return array.first if array.length == 1
  array.first + sum_rec(array[1..-1])
end

def sum_iter(array)
  sum = 0
  array.each do |num|
    sum += num
  end
    sum
end

def exp(b, n)
  return b if n == 1
  return 1 if n == 0
  b * exp(b, n - 1)
end

def exp2(b, n)
  return b if n == 1
  return 1 if n == 0
  if n.even?
    evenoper = exp2(b, n/2)
    evenoper * evenoper
  else
    oddoper = exp2(b, (n-1) / 2)
    b * oddoper * oddoper
  end
end

class Array

  def deep_dup
    arr = []
    self.each do |el|
      if el.is_a?(Array)
        arr.push(el.deep_dup)
      else
        arr << el
      end
    end
    arr
  end

  def subsets
    return [[]] if self.empty?
    rec = self[0...-1].subsets
    rec + rec.map { |set| set + [self.last] }
  end

  def permutations
    return [self] if self.length <= 1
    first_el = self.shift
    new_self = self.permutations
    result = []
    new_self.each do |n_self|
      (0..n_self.length).times do
        result << n_self.unshift(first_el)
      end
    end
  end

  def permutitions
    return self if self.length == 1
    final = []
    n = self.length
    (0...n).each do |i|
      final << self.rotate(i)
    end
    if self.length >2
      (0...n).each do |i|
        final << self.reverse.rotate(i)
      end
    end
    final
  end

end


def fibs_it(n)
  array = [0, 1]
    (n-2).times do |i|
    array << array[i] + array[i+1]
  end
  array
end

def fibs_c(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0,1] if n == 2
  prev_fibs = fibs_c(n-1)
  prev_fibs << (prev_fibs[-1] + prev_fibs[-2])
end
