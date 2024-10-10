import 'package:flutter/material.dart';
import 'package:news_app/models/artticles_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_container.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    required this.articles,
    super.key,
  });

  final List<ArtticlesModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return NewsContainer(
            artticlesModel: articles[index],
          );
        });
  }
}
