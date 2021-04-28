n="2,1,4,3\n4,4,4"
n=n.gsub("\n",",")
s=n.split(",")
acumulador=0
s.each do |numero|
    acumulador = acumulador + numero.to_i
end
puts(acumulador)
puts(s)