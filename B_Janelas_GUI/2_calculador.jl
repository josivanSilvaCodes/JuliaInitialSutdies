begin
    # Inicia um bloco com várias instruções Julia.

    # Multiplica os valores escolhidos nos sliders.
    # O operador * faz a multiplicação.
    # O sinal = guarda o resultado na variável total.
    total = quantidade * preco

    # md"""...""" cria um texto formatado em Markdown.
    #
    # Dentro desse texto:
    # ### cria um título de nível 3.
    # **...** apresenta o conteúdo em negrito.
    # $(nome) insere o texto da variável nome.
    # $(quantidade) insere o valor da variável quantidade.
    # $(preco) insere o valor da variável preco.
    # $(total) insere o resultado da multiplicação.
    #
    # O símbolo × abaixo serve apenas para mostrar a operação.
    # A multiplicação foi feita pelo * na linha acima.
    #
    # Como este texto é a última expressão do bloco,
    # ele aparece como saída da célula no Pluto.

    md"""
    ### Resultado

    Olá, **$(nome)**!

    **$(quantidade) × $(preco) = $(total)**

    Total: **$(total) reais**
    """
end