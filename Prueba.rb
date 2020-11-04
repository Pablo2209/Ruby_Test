
def gen (numero)
    if numero != 0
        letras="a"
        resultado = ""
        numero.times do
            resultado += letras
            if letras == "A"
                letras == "B"
            else
                letras = letras.next
            end
        end
        resultado
    else
        puts "Desbes ingresar un valor numerico"
    end
end

puts gen(ARGV[0].to_i)