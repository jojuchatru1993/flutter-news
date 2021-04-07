import 'package:flutter/material.dart';
import 'package:news/src/pages/tabs_page.dart';
import 'package:news/src/providers/news_provider.dart';
import 'package:news/src/theme/dark_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new NewProvider())],
      child: MaterialApp(
          title: 'Material App', theme: dartkTheme, home: TabsPage()),
    );
  }
}
