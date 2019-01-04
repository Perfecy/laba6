require './main.rb'

print 'integrating (x+cosx)dx in (-1 to 4) = '
puts trap(-1.0, 4.0, 10_000_000.0) { |x| x + Math.cos(x) }
print 'integralting (tg(x+1))/(x+1)dx in (1 to 2) = '
puts trap(1.0, 2.0, 10_000_000.0, &->(x) { Math.tan(x + 1) / (x + 1) })
