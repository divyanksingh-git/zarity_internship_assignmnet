import 'package:flutter/material.dart';
import 'package:zarity_intern_assignment/style/color.dart';

import '../services/functions.dart';

class Article extends StatelessWidget {
  String title;
  String description;
  String imgUrl;
  Article(this.title, this.description, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor().articlecard,
      child: Row(children: [
        const SizedBox(width: 10),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(
            imgUrl,
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
            child: RichText(
          text: TextSpan(
              text: '$title\n\n',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor().textcolor),
              children: [
                TextSpan(
                    text: '$description\n',
                    style: const TextStyle(fontWeight: FontWeight.normal))
              ]),
          overflow: TextOverflow.visible,
        )),
      ]),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
        Article(artTitle(), artDescription(), artimgUrl()),
      ],
    ));
  }
}
