entrada = [2, 4, 6, 8]
saida = zeros(Int, length(entrada))
for i in eachindex(entrada)
    saida[i] = entrada[i]^2
end
println(saida)
