begin
    # "begin" inicia um bloco de instruções.
    # Isso permite colocar várias instruções na mesma célula do Pluto.

    # Carrega o módulo PlutoUI e disponibiliza seus componentes.
    # TextField, Slider e a macro @bind são usados neste exemplo.
    using PlutoUI

    # Carrega o módulo Markdown, que faz parte do Julia.
    # Ele permite apresentar títulos, negrito e outros textos formatados.
    using Markdown

    # md"""...""" cria um conteúdo formatado em Markdown.
    # Como é a última expressão deste bloco, o Pluto o exibe na tela.
    #
    # Dentro desse texto:
    #
    # $ (...) insere o resultado de uma expressão Julia.
    #
    # @bind nome TextField(default="")
    # cria um campo de texto e conecta seu conteúdo à variável "nome".
    #
    # @bind quantidade Slider(1:10, default=2, show_value=true)
    # cria um slider de 1 até 10, começando em 2.
    # O valor escolhido fica na variável "quantidade".
    #
    # @bind preco Slider(5:5:100, default=25, show_value=true)
    # cria um slider de 5 até 100, com incrementos de 5.
    # O valor escolhido fica na variável "preco".

    md"""
    # Minha primeira interface

    Digite seu nome:
    $(@bind nome TextField(default=""))

    Escolha a quantidade:
    $(@bind quantidade Slider(1:10, default=2, show_value=true))

    Escolha o preço:
    $(@bind preco Slider(5:5:100, default=25, show_value=true))
    """
end