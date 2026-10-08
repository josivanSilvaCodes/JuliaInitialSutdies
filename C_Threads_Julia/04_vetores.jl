entrada = [2, 4, 6, 8]
saida = zeros(Int, length(entrada))

# Guarda a identificação da thread usada em cada posição.
ids = zeros(Int, length(entrada))

Threads.@threads for i in eachindex(entrada)
    saida[i] = entrada[i]^2
    ids[i] = Threads.threadid()
end

println("Threads disponíveis: ", Threads.nthreads(:default))
println("Resultados: ", saida)
println("Thread usada em cada posição: ", ids)