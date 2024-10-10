import 'package:flutter/material.dart';
import 'package:news_app/models/artticles_model.dart';

import 'package:news_app/widgets/news_container.dart';

class NewsSliverlist extends StatelessWidget {
  const NewsSliverlist({required this.articles, super.key});
  final List<ArtticlesModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return NewsContainer(
        artticlesModel: articles[index],
      );
    }));
  }
}
