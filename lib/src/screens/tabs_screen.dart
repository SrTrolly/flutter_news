import 'package:flutter/material.dart';
import 'package:newsapp/src/screens/tab1_screen.dart';
import 'package:newsapp/src/screens/tab2_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: const Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (value) => navegacionModel.paginaActual = value,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Para ti"),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: "Encabezados")
        ]);
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageControler,
      physics: const NeverScrollableScrollPhysics(),
      children: const [Tab1Screen(), Tab2Screen()],
    );
  }
}

class _NavegacionModel extends ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController(initialPage: 0);

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);

    _paginaActual = valor;
    notifyListeners();
  }

  PageController get pageControler => _pageController;
}
