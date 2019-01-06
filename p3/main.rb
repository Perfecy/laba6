def my_func(a, b, ac, fun = nil)
  part = (b - a) / ac

  if block_given?

    ((yield(a) + yield(b)) / 2.0 +
        Array.new(ac - 1) do |index|
          yield(a + part *
           index)
        end .inject(0) { |result, elem| result + elem }
    ) * part

  else

    ((fun.call(a) + fun.call(b)) / 2.0 +
     Array.new(ac - 1) do |index|
       fun.call(a + part *
          index)
     end .inject(0) { |result, elem| result + elem }
    ) * part

  end
end
