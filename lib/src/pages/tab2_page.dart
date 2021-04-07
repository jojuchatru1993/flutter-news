import 'package:flutter/material.dart';
import 'package:news/src/models/category_model.dart';
import 'package:news/src/providers/news_provider.dart';
import 'package:news/src/theme/dark_theme.dart';
import 'package:news/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newProvider = Provider.of<NewProvider>(context);

    return SafeArea(
        child: Scaffold(
            body: Column(
      children: <Widget>[
        _CategoryList(),
        Expanded(child: NewsList(newProvider.getArticlesCategorySelected))
      ],
    )));
  }
}

class _CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewProvider>(context).categories;

    return Container(
      width: double.infinity,
      height: 85.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final categoryName = categories[index].name;

          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              _CategoryButton(categories[index]),
              SizedBox(height: 5),
              Text(
                  '${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
            ]),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newProvider = Provider.of<NewProvider>(context);

    return GestureDetector(
      onTap: () {
        final newProvider = Provider.of<NewProvider>(context, listen: false);

        newProvider.selectedCategory = category.name;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(category.icon,
            color: (newProvider.selectedCategory == this.category.name)
                ? dartkTheme.accentColor
                : Colors.black54),
      ),
    );
  }
}
