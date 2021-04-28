RSpec.describe "Calculadora De Cadenas" do
    it "Deberia devolver el numero 3 para la cadena 3" do
        expect(calcularCadena("3")).to eq(3)
    end

    it "Deberia devolver el numero 5 para la cadena 5" do
        expect(calcularCadena("5")).to eq(5)
    end
    it "Deberia devolver el numero 6 para la cadena 5 y 1" do
        expect(calcularCadena("5,1")).to eq(6)
    end

    it "Deberia devolver el numero 8 para la cadena 5, 1 y 2" do
        expect(calcularCadena("5,1,2")).to eq(8)
    end

    it "Deberia devolver el numero 10 para la cadena 1, 2,3 y 4" do
        expect(calcularCadena("1,2,3,4")).to eq(10)
    end
    it "Deveria devolver el numero 6 para la cadena 1\n2,3 " do
        expect(calcularCadena("1\n2,3")).to eq(6)
    end
    it "Deveria devolver el numero 9 para la cadena 1,1,1\n1,1,1\n1,1,1" do
        expect(calcularCadena("1,1,1\n1,1,1\n1,1,1")).to eq(9)
    end
    it "Deveria devolver el numero 2 ignorando el numero mayor a 1000 para la cadena 2, 1001" do
        expect(calcularCadena("2, 1001")).to eq(2)
    end
    it "Deveria devolver el numero 1111 ignorando el numero mayor a 1000 para la cadena 1,2000\n 10,100,1000,2000" do
        expect(calcularCadena("1,2000\n 10,100,1000,2000")).to eq(1111)
    end
    it "Deveria devolver el numero 6 para el delimitador '//[***]\n1***2***3'" do
        expect(calcularCadena("//[***]\n1***2***3")).to eq(6)
    end
    it "Deveria devolver el numero 12 para el delimitador '//[...]\n1...2...3\n1...2...3'" do
        expect(calcularCadena("//[...]\n1...2...3\n1...2...3")).to eq(12)
    end
end

def calcularCadena(cadena)
    
    delimitador=","

    if (cadena[0].to_s+cadena[1].to_s=="//")
        delimitador=""
        i=3
        caracter=cadena[i].to_s
        while (caracter!="]")
             delimitador=delimitador+caracter
             i=i+1
             caracter=cadena[i].to_s
        end
    end
    
    arreglo=cadena.gsub("\n",delimitador)
    arreglo=arreglo.split(delimitador)
    acumulador=0
    arreglo.each do |numero|
        n=numero.to_i
        acumulador = acumulador + n if (n<=1000)
    end
    return acumulador
end