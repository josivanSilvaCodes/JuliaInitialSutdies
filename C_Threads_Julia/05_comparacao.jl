entrada = [2, 4, 6, 8]

println("Threads de trabalho disponíveis: ",
        Threads.nthreads(:default))

# ==================================================
# PARTE 1: SEQUENCIAL
# ==================================================

seq = zeros(Int, length(entrada))
ids_seq = zeros(Int, length(entrada))

for i in eachindex(entrada)
    ids_seq[i] = Threads.threadid()
    seq[i] = entrada[i]^2
end

println("\n=== EXECUÇÃO SEQUENCIAL ===")

for i in eachindex(entrada)
    println("Posição ", i,
            " | Thread ", ids_seq[i],
            " | Cálculo: ", entrada[i], "^2 = ", seq[i])
end

println("IDs utilizados: ", unique(ids_seq))
println("Quantidade de threads utilizadas: ",
        length(unique(ids_seq)))
println("Resultado sequencial: ", seq)

# ==================================================
# PARTE 2: MULTITHREAD
# ==================================================

par = zeros(Int, length(entrada))
ids_par = zeros(Int, length(entrada))

Threads.@threads for i in eachindex(entrada)
    ids_par[i] = Threads.threadid()
    par[i] = entrada[i]^2
end

println("\n=== EXECUÇÃO MULTITHREAD ===")

for i in eachindex(entrada)
    println("Posição ", i,
            " | Thread ", ids_par[i],
            " | Cálculo: ", entrada[i], "^2 = ", par[i])
end

println("IDs utilizados: ", unique(ids_par))
println("Quantidade de threads utilizadas: ",
        length(unique(ids_par)))
println("Resultado multithread: ", par)

# ==================================================
# PARTE 3: COMPARAÇÃO
# ==================================================

println("\n=== COMPARAÇÃO DOS RESULTADOS ===")
println("Resultados iguais: ", seq == par)
@assert seq == par
println("Soma após o laço: ", sum(par))