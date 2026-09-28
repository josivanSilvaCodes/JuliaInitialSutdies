include("funcoes.jl")  #incluindo o arquivo funcoes.jl
include("Geometria.jl") # incluindo o módulo Geometria
using .Geometria # para não necessitar ficar chamando Geometria.funcao
include("Carro.jl") #inserindo/chamando classe

# Agora a função está disponível
println(saudar("Mundo")) 

area = area_retangulo(5, 3)
println("Área do retângulo: ", area)

areaTri = area_triangulo(5, 3)
println("Área do triângulo: ", areaTri)

#=========================================#

meu_carro = Carro("Toyota", "Corolla", 0)

println("Carro: ", meu_carro.marca, " ", meu_carro.modelo)
println("Velocidade inicial: ", meu_carro.velocidade, " km/h")

acelerar!(meu_carro, 50)
println("Depois de acelerar: ", meu_carro.velocidade, " km/h")

frear!(meu_carro, 20)
println("Depois de frear: ", meu_carro.velocidade, " km/h")

