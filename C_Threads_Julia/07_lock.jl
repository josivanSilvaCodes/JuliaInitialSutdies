function contar(n)
    # Contador compartilhado entre os trabalhos.
    contador = Ref(0)

    # Todos os trabalhos devem usar esta mesma trava.
    trava = ReentrantLock()

    println("Threads disponíveis: ",
            Threads.nthreads(:default))
    println("Contador inicial: ", contador[])
    println("Incrementos planejados: ", n)

    Threads.@threads for i in 1:n

        # Se outro trabalho possuir a trava,
        # este trabalho espera até conseguir adquiri-la.
        lock(trava) do
            id = Threads.threadid()

            println("\nIteração ", i,
                    " | Thread observada: ", id,
                    " | Lock adquirido")

            antes = contador[]
            println("  Leitura do contador: ", antes)

            contador[] = antes + 1
            println("  Atualização: ", antes,
                    " + 1 = ", contador[])

            println("  Atualização concluída.",
                    " Ao sair deste bloco, o lock será liberado.")
        end
    end

    # O laço com threads terminou.
    println("\n=== RESULTADO FINAL ===")
    println("Valor esperado: ", n)
    println("Valor obtido: ", contador[])
    println("Resultado correto: ", contador[] == n)

    @assert contador[] == n

    return contador[]
end

contar(8)