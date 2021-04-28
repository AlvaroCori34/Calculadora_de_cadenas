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
end

def calcularCadena(cadena)
    arreglo=cadena.gsub("\n",",")
    arreglo=arreglo.split(",")
    acumulador=0
    arreglo.each do |numero|
        acumulador = acumulador + numero.to_i
    end
    return acumulador
end