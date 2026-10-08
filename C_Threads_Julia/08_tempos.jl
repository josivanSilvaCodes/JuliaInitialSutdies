# Cálculo realizado para cada número.
function trabalho(x, repeticoes)
    valor = Float64(x)

    for k in 1:repeticoes
        valor = sin(valor) + 0.001 * x
    end

    return valor
end

# Processa todas as posições com um laço comum.
function sequencial!(saida, entrada, repeticoes)
    for i in eachindex(entrada)
        saida[i] = trabalho(entrada[i], repeticoes)
    end
end

# Processa as posições com um laço multithread.
function paralela!(saida, entrada, repeticoes)
    Threads.@threads for i in eachindex(entrada)
        saida[i] = trabalho(entrada[i], repeticoes)
    end
end

# Organiza e executa a comparação.
function main()
    quantidade = 20000
    repeticoes = 1000

    entrada = collect(1:quantidade)
    seq = zeros(Float64, quantidade)
    par = zeros(Float64, quantidade)

    println("Threads de trabalho disponíveis: ",
            Threads.nthreads(:default))
    println("Quantidade de entradas: ", quantidade)
    println("Repetições por entrada: ", repeticoes)

    println("\nAquecendo as duas versões...")

    # Primeiras chamadas antes da medição.
    sequencial!(seq, entrada, repeticoes)
    paralela!(par, entrada, repeticoes)

    @assert seq == par
    println("Aquecimento concluído. Resultados iguais.")

    for rodada in 1:3
        # Cronometra apenas o processamento.
        tempo_seq = @elapsed sequencial!(
            seq, entrada, repeticoes)

        tempo_par = @elapsed paralela!(
            par, entrada, repeticoes)

        @assert seq == par

        aceleracao = tempo_seq / tempo_par

        # Imprime depois da medição.
        println("\n=== RODADA ", rodada, " ===")
        println("Tempo sequencial: ", tempo_seq, " segundos")
        println("Tempo multithread: ", tempo_par, " segundos")
        println("Razão sequencial/multithread: ", aceleracao)
        println("Resultados iguais: ", seq == par)

        if tempo_par < tempo_seq
            println("Nesta rodada, multithread foi mais rápido.")
        elseif tempo_par > tempo_seq
            println("Nesta rodada, sequencial foi mais rápido.")
        else
            println("Nesta rodada, os tempos foram iguais.")
        end
    end
end

# Inicia o programa.
main()