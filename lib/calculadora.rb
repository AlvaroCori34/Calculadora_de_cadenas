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

def cambiarDelimitador(cadenaDeNumeros,delimitador,nuevoDelimitador)
    cadenaDeNumeros = cadenaDeNumeros.gsub(delimitador,nuevoDelimitador)
    return cadenaDeNumeros
end

def separarDelimitadoresYNumeros(cadena)
    separadorDeDelimitadores = cadena.index("\n")+1
    cadenaDelimitadores = cadena[0,separadorDeDelimitadores]
    cadenaDeNumeros = cadena[separadorDeDelimitadores,cadena.length]   
    return cadenaDelimitadores, cadenaDeNumeros
end 

def obtenerCadenaDeNumeros(cadena)    
    if (cadena[0,2].to_s=="//")    
        cadenaDelimitadores,cadenaDeNumeros = separarDelimitadoresYNumeros(cadena)
        cadenaDeNumeros=cambiarDelimitador(cadenaDeNumeros,"\n",",")
        i=3    
        while (cadenaDelimitadores[i].to_s != "\n")
            delimitador, i = captarDelimitador(cadenaDelimitadores,i)
            cadenaDeNumeros = cambiarDelimitador(cadenaDeNumeros,delimitador,",")
            i=i+1
            if(cadenaDelimitadores[i].to_s=="[")
                i=i+1
            end
        end
    else
        cadenaDeNumeros=cambiarDelimitador(cadena,"\n",",")
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
    cadenaDeNumeros =obtenerCadenaDeNumeros(cadena)
    cadenaDeNumeros=cadenaDeNumeros.split(",")
    numeros =cadenaDeNumeros.map { |str| numerosMenorOIgualA(str.to_i,1000) }
    acumulador=numeros.sum()
    return acumulador
end


