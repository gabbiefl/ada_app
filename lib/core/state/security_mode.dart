// Os três modos de segurança do ADA.
//
// Um enum garante que só existem estes três valores: o compilador avisa se
// alguém tentar usar um modo que não existe (o que não acontece com texto).

enum SecurityMode { normal, attention, danger }
