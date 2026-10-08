# README -> INFO:
    # INSTALAR O PLUTO RODANDO: 
    # julia -e 'import Pkg; Pkg.add("Pluto")'
    # PARA RODAR O PLUTO NO BROWSER VA NA URL DO PADRÃO/TIPO:
        #       https://reimagined-trout-r49vvv6vpq7hxw65-1234.app.github.dev/?secret=nzIdNZNp
        #       NÃO ESQUECER DE TROCAR A SECRET

import Pluto

Pluto.run(
    host="0.0.0.0",
    port=1234,
    launch_browser=false
)