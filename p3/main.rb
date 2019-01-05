def trap(a, b, accur)
  part = (b - a) / accur
  (
    (yield(a) + yield(b)) / 2.0 +
     Array.new(accur - 1) { |index| yield(a + part * index) }.inject(0) { |result, elem| result + elem }
  ) * part
end

def my_func(a, b, accur, function = nil)

  part = (b - a) / accur

   if block_given?
      t=((yield(a) + yield(b)) / 2.0 +
       Array.new(accur - 1) { |index| yield(a + part * index) }.inject(0) { |result, elem| result + elem }
         ) * part
    else

      t=((function.call(a) + function.call(b)) / 2.0 +
       Array.new(accur - 1) { |index| function.call(a + part * index) }.inject(0) { |result, elem| result + elem }
         ) * part
    end

end
