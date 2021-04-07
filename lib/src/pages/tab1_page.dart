import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news/src/providers/news_provider.dart';
import 'package:news/src/widgets/news_list.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewProvider>(context).headlines;

    return Scaffold(
        body: (headlines.length == 0)
            ? Center(child: CircularProgressIndicator())
            : NewsList(headlines));
  }

  @override
  bool get wantKeepAlive => true;
}
