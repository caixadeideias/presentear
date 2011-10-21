# language: pt

Funcionalidade: Enviar sugestão de presente
  Afim de compartilhar idéias para presentear um amigo(a)
  Como um amigo do presenteado
  Eu quero enviar sugestões de presente para ele
  
	
	Cenário: Amigo acessa a página de sugestões de um evento
		Dado que eu estou na página do evento do Joãozinho
		Quando eu aperto "Enviar sugestão"
		Então eu devo ver "Compartilhe"
		
	Cenário: Amigo compartilha sugestão
		Dado que eu estou na página de sugestões
		E eu preencho "Nome" com "Bola de futebol"
		E eu preencho "Link" com "http://www.submarino.com.br"
		E eu preencho "Preço" com "30,90"
		Quando eu aperto "Compartilhar sugestão"
		Então eu devo ver "Bola de futebol"