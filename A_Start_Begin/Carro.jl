mutable struct Carro
    marca::String
    modelo::String
    velocidade::Int
end

function acelerar!(carro::Carro, aumento::Int)
    carro.velocidade += aumento
end

function frear!(carro::Carro, reducao::Int)
    carro.velocidade = max(0, carro.velocidade - reducao)
end