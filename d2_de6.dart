import 'dart:collection';

class Carta {
  String naipe;

  Carta(this.naipe);
}

void main() {
  Queue<Carta> baralho = Queue<Carta>();

  baralho.add(Carta('\u2663')); //paus
  baralho.add(Carta('\u2665')); //copas
  baralho.add(Carta('\u2660')); //espadas
  baralho.add(Carta('\u2666')); //ouros

  while (!baralho.isEmpty) {
    Carta cartaRemovida = baralho.removeFirst();
    print('Carta removida: ${cartaRemovida.naipe}');
  }
}
