# language: pt

Funcionalidade: Criar evento
  Afim de compartilhar idéias para presentear um amigo(a)
  Como um amigo do presenteado
  Eu quero abrir uma página onde os amigos possam dar sugestões
  
  Cenário: Amigo cria evento
    Dado que eu estou na página inicial
    E eu preencho nome com "Joãozinho"
    E eu preencho "festa de aniversário" como tipo 
    E eu preencho a data como sendo amanhã
    Quando eu aperto "Continuar"
		Então eu devo ver "Joãozinho"
		E eu devo ver "Colabore com idéias de presente para festa de aniversário de Joãozinho"