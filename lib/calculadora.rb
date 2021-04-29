def captarDelimitador(cadenaDelimitadores,i)
    delimitador=""
    caracter=cadenaDelimitadores[i].to_s
    while (caracter!="]")
        delimitador=delimitador+caracter
        i=i+1
        caracter=cadenaDelimitadores[i].to_s
    end
    return delimitador,i
end
def cambiarDelimitador(cadenaDeNumeros,delimitador)
    cadenaDeNumeros = cadenaDeNumeros.gsub(delimitador,",")
    return cadenaDeNumeros
end
def cadenaConDelimitadorUniformizado(cadena)    

    if (cadena[0,2].to_s=="//")    

        separadorDeDelimitadores = cadena.index("\n")+1
        cadenaDelimitadores = cadena[0,separadorDeDelimitadores]
        cadenaDeNumeros = cadena[separadorDeDelimitadores,cadena.length]   

        cadenaDeNumeros=cadenaDeNumeros.gsub("\n",",")

        i=3    
        while (cadenaDelimitadores[i].to_s != "\n")
            delimitador, i = captarDelimitador(cadenaDelimitadores,i)
            cadenaDeNumeros = cambiarDelimitador(cadenaDeNumeros,delimitador)
            i=i+1
            if(cadenaDelimitadores[i].to_s=="[")
                i=i+1
            end
        end
        i=i+1
    else
        cadenaDeNumeros=cadena.gsub("\n",",")
        cadenaDeNumeros=cadenaDeNumeros
    end
    return cadenaDeNumeros
end


def numerosMenorOIgualA(num, limite)
    if (num<=limite)
        return num
    else
        return 0        
    end
end
def calcularCadena(cadena)
    cadenaDeNumeros =cadenaConDelimitadorUniformizado(cadena)
    cadenaDeNumeros=cadenaDeNumeros.split(",")
    
    numeros =cadenaDeNumeros.map { |str| numerosMenorOIgualA(str.to_i,1000) }
    acumulador=numeros.sum()
    return acumulador
end

#https://refactoring.com/catalog/

#https://refactoring.guru/es/refactoring/smells
