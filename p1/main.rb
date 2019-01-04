def count (eps)
sum=0.to_f
k=1.to_f
d=1.to_f
while d.abs>10**eps do
  d=((-1)**(k-1))/k
  k+=1
  sum=sum+d
end
sum
end
