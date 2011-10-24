# language: pt

Funcionalidade: Criar evento
  Afim de compartilhar idéias para presentear um amigo(a)
  Como um amigo do presenteado
  Eu quero abrir uma página onde os amigos possam dar sugestões
  
  Cenário: Amigo cria evento
    Dado que eu estou na página inicial
    E eu preencho nome com "Joãozinho"
    E eu seleciono "festa de aniversário" como tipo 
    E eu preencho data com "2011-11-10"
    Quando eu aperto "Criar"
		Então eu devo ver "Joãozinho"
		E eu devo ver "idéias de presente para a festa de aniversário de Joãozinho"
    