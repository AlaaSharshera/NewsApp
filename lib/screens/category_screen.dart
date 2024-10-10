import 'package:flutter/material.dart';
import 'package:news_app/models/artticles_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_listview.dart';
import 'package:news_app/widgets/news_sliverlist.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.categoryName, super.key});
  final String categoryName;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var categoryNews;
  @override
  void initState() {
    super.initState();
    categoryNews = NewsService().getNews(categoryName: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    List<ArtticlesModel> articles = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.categoryName} News"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: FutureBuilder<List<ArtticlesModel>>(
          future: categoryNews,
          builder: (context, snapshot) {
            articles = snapshot.data ?? [];
            if (snapshot.hasData) {
              return NewsListView(
                articles: snapshot.data ?? [],
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("There's an error ,please try again later"),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
