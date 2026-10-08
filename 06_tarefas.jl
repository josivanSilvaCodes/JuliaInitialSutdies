function somar_quadrados(inicio, fim)
    quantidade = fim - inicio + 1

    ids = zeros(Int, quantidade)
    quadrados = zeros(Int, quantidade)
    total = 0

    for i in inicio:fim
        # Converte o número i em uma posição do vetor.
        posicao = i - inicio + 1

        # Registra a thread e o cálculo desta etapa.
        ids[posicao] = Threads.threadid()
        quadrados[posicao] = i^2

        total = total + quadrados[posicao]
    end

    return total, ids, quadrados
end

# Cria as duas tarefas antes de esperar pelos resultados.
a = Threads.@spawn somar_quadrados(1, 50)
b = Threads.@spawn somar_quadrados(51, 100)

# Espera cada tarefa terminar e recebe seus resultados.
resultado_a = fetch(a)
resultado_b = fetch(b)

println("Threads disponíveis: ", Threads.nthreads(:default))

println("\nTAREFA A: números de 1 a 50")
for posicao in 1:50
    numero = posicao
    id = resultado_a[2][posicao]
    quadrado = resultado_a[3][posicao]

    println("Thread ", id, ": ", numero, "^2 = ", quadrado)
end
println("Soma da tarefa A: ", resultado_a[1])

println("\nTAREFA B: números de 51 a 100")
for posicao in 1:50
    numero = posicao + 50
    id = resultado_b[2][posicao]
    quadrado = resultado_b[3][posicao]

    println("Thread ", id, ": ", numero, "^2 = ", quadrado)
end
println("Soma da tarefa B: ", resultado_b[1])

println("\nSoma final: ", resultado_a[1] + resultado_b[1])