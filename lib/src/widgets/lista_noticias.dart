import 'package:flutter/material.dart';
import 'package:newsapp/src/models/models.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({super.key, required this.noticias});

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(
          index: index,
          noticia: noticias[index],
        );
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  const _Noticia({
    super.key,
    required this.noticia,
    required this.index,
  });

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TajetaTopBar(
          noticia: noticia,
          index: index,
        ),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(
          noticia: noticia,
        ),
        _TarjetaBody(
          noticia: noticia,
        ),
        _TarjetaBotones(),
        const SizedBox(height: 10),
        const Divider()
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.start),
          ),
          const SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  const _TarjetaBody({
    super.key,
    required this.noticia,
  });

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen({
    super.key,
    required this.noticia,
  });

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: FadeInImage(
          placeholder: const AssetImage("assets/img/giphy.gif"),
          image: NetworkImage(noticia.urlToImage),
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  const _TarjetaTitulo({
    super.key,
    required this.noticia,
  });

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TajetaTopBar extends StatelessWidget {
  const _TajetaTopBar({
    super.key,
    required this.noticia,
    required this.index,
  });

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            "${index + 1}.",
            style: const TextStyle(color: Colors.red),
          ),
          Text(
            "${noticia.source.name}.",
          ),
        ],
      ),
    );
  }
}
