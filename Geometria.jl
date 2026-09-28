module Geometria

export area_retangulo
export area_triangulo

function area_retangulo(base, altura)
    return base * altura
end

function area_triangulo(base, altura)
    return (base * altura) / 2
end

end