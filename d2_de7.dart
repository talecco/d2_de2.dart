import 'dart:collection';
import 'dart:math';

class GeradorNomes {
  static final List<String> _nomes = [
    'João',
    'Maria',
    'Pedro',
    'Ana',
    'José',
    'Mariana',
    'Carlos',
    'Julia',
    'Antônio',
    'Fernanda'
  ];

  static final List<String> _sobrenomes = [
    'Silva',
    'Santos',
    'Oliveira',
    'Souza',
    'Pereira',
    'Rodrigues',
    'Ferreira',
    'Almeida',
    'Costa',
    'Gomes'
  ];

  static String gerarNomeAleatorio() {
    Random random = Random();
    String nome = _nomes[random.nextInt(_nomes.length)];
    String sobrenome = _sobrenomes[random.nextInt(_sobrenomes.length)];
    return '$nome $sobrenome';
  }
}

class MercadoFila {
  Queue<String> fila;

  MercadoFila() : fila = Queue<String>();

  void entrarNaFila() {
    String nome = GeradorNomes.gerarNomeAleatorio();
    fila.add(nome);
    print('($nome) entrou na fila');
  }

  void atenderProximo() {
    if (fila.isNotEmpty) {
      String pessoaAtendida = fila.removeFirst();
      print('($pessoaAtendida) foi atendido(a)');
    } else {
      print('Fila vazia. Não há mais pessoas para atender.');
    }
  }
}

void main() {
  MercadoFila mercado = MercadoFila();

  // Popula a fila com 10 pessoas
  for (int i = 0; i < 10; i++) {
    mercado.entrarNaFila();
  }

  // Atende as pessoas corretamente de acordo com a ordem de entrada
  while (mercado.fila.isNotEmpty) {
    mercado.atenderProximo();
  }
}
