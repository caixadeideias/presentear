# language: pt

Funcionalidade: Enviar sugestão de presente
  Afim de compartilhar idéias para presentear um amigo(a)
  Como um amigo do presenteado
  Eu quero enviar sugestões de presente para ele
  
	Cenário: Amigo compartilha sugestão
		Dado que eu estou na página do evento do Joãozinho
		E eu clico "Enviar sugestão"
		E eu preencho "Qual o presente sugerido?" com "Bola de futebol"
		E eu preencho "Você possui o link de uma loja onde o produto se encontra?" com "http://www.submarino.com.br"
		Quando eu aperto "Compartilhar sugestão"
		Então eu devo ver "Bola de futebol"
	