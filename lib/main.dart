import 'package:flutter/material.dart';
import 'package:newsapp/src/screens/screens.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsService(),
          lazy: false,
        )
      ],
      child: const MaterialApp(
        title: "Material App",
        debugShowCheckedModeBanner: false,
        home: TabsScreen(),
      ),
    );
  }
}
