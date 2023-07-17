class Musica {
  String titulo;
  String artista;
  String album;
  int duracao;

  Musica(this.titulo, this.artista, this.album, this.duracao);
}

class BibliotecaMusical {
  List<Musica> musicas = [];

  void adicionarMusica(Musica musica) {
    musicas.add(musica);
  }

  void imprimirMusicas() {
    for (Musica musica in musicas) {
      print("Título: ${musica.titulo}");
      print("Artista: ${musica.artista}");
      print("Álbum: ${musica.album}");
      print("Duração (segundos): ${musica.duracao}");
      print("----------------------------------");
    }
  }

  List<Musica> buscarPorTitulo(String titulo) {
    List<Musica> encontradas = [];
    for (Musica musica in musicas) {
      if (musica.titulo.toLowerCase() == titulo.toLowerCase()) {
        encontradas.add(musica);
      }
    }
    return encontradas;
  }

  List<Musica> buscarPorArtista(String artista) {
    List<Musica> encontradas = [];
    for (Musica musica in musicas) {
      if (musica.artista.toLowerCase() == artista.toLowerCase()) {
        encontradas.add(musica);
      }
    }
    return encontradas;
  }

  List<Musica> buscarPorAlbum(String album) {
    List<Musica> encontradas = [];
    for (Musica musica in musicas) {
      if (musica.album.toLowerCase() == album.toLowerCase()) {
        encontradas.add(musica);
      }
    }
    return encontradas;
  }

  double calcularTempoTotal() {
    int tempoTotal = 0;
    for (Musica musica in musicas) {
      tempoTotal += musica.duracao;
    }
    return tempoTotal / 3600; // Converter para horas
  }
}

void main() {
  // Criar algumas músicas
  Musica musica1 =
      Musica("Mágico de Oz", "Racionais Mcs", "Sobrevivendo no inferno", 180);
  Musica musica2 = Musica("Dialogo", "Yunk Vino", "Meu Amigo Diario", 240);
  Musica musica3 = Musica("É Sal", "Matue", "Maquina do Tempo", 300);

  // Criar biblioteca musical
  BibliotecaMusical biblioteca = BibliotecaMusical();
  biblioteca.adicionarMusica(musica1);
  biblioteca.adicionarMusica(musica2);
  biblioteca.adicionarMusica(musica3);

  // Imprimir todas as músicas
  print("Músicas cadastradas:");
  biblioteca.imprimirMusicas();

  // Imprimir o número de músicas
  print("Número de músicas: ${biblioteca.musicas.length}");

  // Calcular o tempo total em horas
  double tempoTotal = biblioteca.calcularTempoTotal();
  print("Tempo total em horas: $tempoTotal");

  // Buscar músicas pelo título
  String tituloBusca = "Mágico de Oz";
  List<Musica> musicasPorTitulo = biblioteca.buscarPorTitulo(tituloBusca);
  print("Músicas encontradas para o título '$tituloBusca':");
  for (Musica musica in musicasPorTitulo) {
    print("Título: ${musica.titulo}");
    print("Artista: ${musica.artista}");
    print("Álbum: ${musica.album}");
    print("Duração (segundos): ${musica.duracao}");
    print("----------------------------------");
  }

  // Buscar músicas pelo nome do artista
  String artistaBusca = "Racionais Mcs";
  List<Musica> musicasPorArtista = biblioteca.buscarPorArtista(artistaBusca);
  print("Músicas encontradas para o artista '$artistaBusca':");
  for (Musica musica in musicasPorArtista) {
    print("Título: ${musica.titulo}");
    print("Artista: ${musica.artista}");
    print("Álbum: ${musica.album}");
    print("Duração (segundos): ${musica.duracao}");
    print("----------------------------------");
  }

  // Buscar músicas pelo nome do álbum
  String albumBusca = "Maquina do Tempo";
  List<Musica> musicasPorAlbum = biblioteca.buscarPorAlbum(albumBusca);
  print("Músicas encontradas para o álbum '$albumBusca':");
  for (Musica musica in musicasPorAlbum) {
    print("Título: ${musica.titulo}");
    print("Artista: ${musica.artista}");
    print("Álbum: ${musica.album}");
    print("Duração (segundos): ${musica.duracao}");
    print("----------------------------------");
  }
}
