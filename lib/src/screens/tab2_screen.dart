import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const _ListaCategorias(),
          Expanded(
              child: ListaNoticias(
                  noticias: newsService.getArticulosCategoriaSeleccionada))
        ],
      )),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final String cName = categories[index].name;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _Category(categoria: categories[index]),
                const SizedBox(height: 5),
                Text(" ${cName[0].toUpperCase()}${cName.substring(1)}")
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({
    super.key,
    required this.categoria,
  });

  final Category categoria;

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.black87),
        child: Icon(categoria.icon,
            color: (newService.selectedCategory == categoria.name)
                ? Colors.red
                : Colors.white),
      ),
    );
  }
}
