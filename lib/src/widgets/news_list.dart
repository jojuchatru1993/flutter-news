import 'package:flutter/material.dart';

import 'package:news/src/models/news_model.dart';
import 'package:news/src/theme/dark_theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(article: this.news[index], index: index);
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article article;
  final int index;

  const _News({@required this.article, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TargetTopBar(article, index),
        _TargetTitle(article),
        _TargetImage(article),
        _TargetBody(article),
        SizedBox(height: 10.0),
        Divider(),
        _TargetButtons()
      ],
    );
  }
}

class _TargetTopBar extends StatelessWidget {
  final Article article;
  final int index;

  const _TargetTopBar(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ',
              style: TextStyle(color: dartkTheme.accentColor)),
          Text('${article.source.name}. ')
        ],
      ),
    );
  }
}

class _TargetTitle extends StatelessWidget {
  final Article article;

  const _TargetTitle(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(article.title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
    );
  }
}

class _TargetImage extends StatelessWidget {
  final Article article;

  const _TargetImage(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
        child: Container(
          child: (article.urlToImage != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(article.urlToImage),
                )
              : Image(image: AssetImage('assets/img/no-image.png')),
        ),
      ),
    );
  }
}

class _TargetBody extends StatelessWidget {
  final Article article;

  const _TargetBody(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((article.description != null) ? article.description : ''),
    );
  }
}

class _TargetButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
              onPressed: () {},
              fillColor: dartkTheme.accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Icon(Icons.star_border)),
          SizedBox(width: 10.0),
          RawMaterialButton(
              onPressed: () {},
              fillColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Icon(Icons.more))
        ],
      ),
    );
  }
}
