def trap(a, b, accur)
  part = (b - a) / accur
  (
    (yield(a) + yield(b)) / 2.0 +
     Array.new(accur - 1) { |index| yield(a + part * index) }.inject(0){|result,elem| result+elem}
  ) * part
end
