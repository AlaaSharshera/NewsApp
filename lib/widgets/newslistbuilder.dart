import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/models/artticles_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_sliverlist.dart';

class Newslistbuilder extends StatefulWidget {
  const Newslistbuilder({super.key});

  @override
  State<Newslistbuilder> createState() => _NewslistbuilderState();
}

class _NewslistbuilderState extends State<Newslistbuilder> {
  var articles;
  @override
  void initState() {
    super.initState();
    articles = NewsService().getNews(categoryName: "general");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArtticlesModel>>(
            future: articles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return NewsSliverlist(
                  articles: snapshot.data ?? [],
                );
              } else if (snapshot.hasError) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text("There's an error ,please try again later"),
                  ),
                );
              } else {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            })
        // isLoading
        //     ? const SliverFillRemaining(
        //         hasScrollBody: false,
        //         child: Center(child: CircularProgressIndicator()),
        //       )
        //     : articles.isEmpty
        //         ? const SliverFillRemaining(
        //             hasScrollBody: false,
        //             child: Center(
        //               child: Text("There's no News right now"),
        //             ),
        //           )
        //         : NewsSliverlist(
        //             articles: articles,
        ;
  }
}
// List<ArtticlesModel> articles = [];
// bool isLoading = true;
// @override
// void initState() {
//   super.initState();
//   getGeneralNews();
// }

// Future<void> getGeneralNews() async {
//   articles = await NewsService().getGeneralNews();
//   isLoading = false;
//   setState(() {});
// }
