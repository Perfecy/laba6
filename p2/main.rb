def enumerator
  Enumerator.new do |yielder|
    sum = 0.0
    prev = 0.5
    (1..Float::INFINITY).lazy.each do |k|
      yielder.yield sum, prev
      prev = sum
      sum += ((-1)**(k.to_f - 1) / k.to_f)
    end
  end
end

def count(prec)
  arr = enumerator.take_while { |sum, prev| (prev - sum).abs >= 10**prec }
  arr.last[0]
end
