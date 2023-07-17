// NAO PODE SER MODIFICADO
// -------------------------------------------------------------
import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

// -------------------------------------------------------------
// ADICIONAR IMPLEMENTACAO RESTANTE ABAIXO DESSA LINHA
// -------------------------------------------------------------

abstract class MeioDeComunicacao {
  void fazerLigacao(String numero);
}

class Telefone extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[TELEFONE] Ligando para $numero ');
  }
}

class Celular extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[CELULAR] Ligando para  $numero');
  }
}

class Orelhao extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[ORELHAO] Ligando para  $numero');
  }
}
