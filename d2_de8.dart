import 'dart:math';

class Figura {
  final String nome;
  final int codigo;

  Figura(this.nome, this.codigo);
}

class PacoteFiguras {
  final List<Figura> figuras;

  PacoteFiguras(List<Figura> listaFiguras)
      : figuras = _gerarPacoteAleatorio(listaFiguras);

  static List<Figura> _gerarPacoteAleatorio(List<Figura> listaFiguras) {
    List<Figura> pacote = [];
    Random random = Random();

    while (pacote.length < 4) {
      Figura figura = listaFiguras[random.nextInt(listaFiguras.length)];

      if (!pacote.contains(figura)) {
        pacote.add(figura);
      }
    }

    return pacote;
  }
}

class AlbumFiguras {
  final List<Figura> album;
  final List<Figura> repetidas;

  AlbumFiguras(List<Figura> listaFiguras)
      : album = [],
        repetidas = [],
        assert(listaFiguras.length == 20) {
    for (int i = 0; i < listaFiguras.length; i++) {
      album.add(Figura('Figura ${i + 1}', i + 1));
    }
  }

  bool verificarAlbumCompleto() {
    for (Figura figura in album) {
      if (!repetidas.contains(figura)) {
        return false;
      }
    }
    return true;
  }

  void imprimirAlbum() {
    album.sort((a, b) => a.codigo.compareTo(b.codigo));
    for (Figura figura in album) {
      print('Figura ${figura.codigo}: ${figura.nome}');
    }
  }
}

void main() {
  List<Figura> listaFiguras = [
    Figura('Figura 1', 1),
    Figura('Figura 2', 2),
    Figura('Figura 3', 3),
    Figura('Figura 4', 4),
    Figura('Figura 5', 5),
    Figura('Figura 6', 6),
    Figura('Figura 7', 7),
    Figura('Figura 8', 8),
    Figura('Figura 9', 9),
    Figura('Figura 10', 10),
  ];

  AlbumFiguras album = AlbumFiguras(listaFiguras);

  int figurasRepetidas = 0;
  while (!album.verificarAlbumCompleto()) {
    PacoteFiguras pacote = PacoteFiguras(listaFiguras);
    for (Figura figura in pacote.figuras) {
      if (album.album.contains(figura)) {
        figurasRepetidas++;
        album.repetidas.add(figura);
      } else {
        album.album.add(figura);
      }
    }
  }

  print('Número de figuras repetidas: $figurasRepetidas');
  album.imprimirAlbum();
}
