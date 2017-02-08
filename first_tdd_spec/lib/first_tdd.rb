class Array

  def my_uniq
    result = []
    self.each { |el| result << el unless result.include?(el) }
    result
  end

  def two_sum
    result = []
    idx = 0
    while idx < self.length
      j = (idx + 1)
      while j < self.length
        if self[idx] + self[j] == 0
          result << [idx,j].sort
        end
        j += 1
      end
      idx += 1
    end
    result
  end

  def my_transpose

    result = []

    self.each_with_index do |row, i|
      row_result = []
      row.each_with_index do |col, j|
        row_result << self[j][i]
      end
      result << row_result
    end
    result
  end
end

##########

def stock_picker(array)
  return nil if array.length < 2
  raise ArgumentError if array.any? { |n| n < 0 }
  [array.index(array.min), array.index(array.max)]
end
