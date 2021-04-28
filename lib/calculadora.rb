def captarDelimitadores(cadena)
    delimitadores=[","]  #delimitador por defecto
    i=0                  #inicio de la cadena
    if (cadena[0].to_s+cadena[1].to_s=="//")    
        delimitadores=[]
        i=3             #comenzamos por el primer delimitador
        caracter=cadena[i].to_s
        while (caracter!="\n")#fin de los delimitadores
            delimitador=""
            while (caracter!="]")#] termina un delimitador
                 delimitador=delimitador+caracter
                 i=i+1
                 caracter=cadena[i].to_s
             end
            delimitadores.push(delimitador)#agregar delimitador
            i=i+1
            if(cadena[i].to_s=="[")#si aun se agrega otro delimitador se lo capta
                i=i+1
            end
            caracter=cadena[i].to_s
        end
        i=i+1
    end
    return delimitadores, i
end
def separarDelimitadores(cadena,delimitadores)
    arreglo=cadena.gsub("\n","*")
    delimitadores.each do |delimitador|
        arreglo=arreglo.gsub(delimitador,"*")
        #puts("dddddddd ")
        #puts(arreglo)
    end
    arreglo=arreglo.split('*')
    return arreglo
end
def calcularCadena(cadena)
    delimitadores, i =captarDelimitadores(cadena)
    cadena=cadena[i,cadena.length]
    arreglo=separarDelimitadores(cadena,delimitadores)
    acumulador=0
    arreglo.each do |numero|
        n=numero.to_i
        acumulador = acumulador + n if (n<=1000)
    end
    return acumulador
end