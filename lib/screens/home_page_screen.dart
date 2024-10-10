import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/category_listview.dart';

import 'package:news_app/widgets/news_sliverlist.dart';
import 'package:news_app/widgets/newslistbuilder.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              NewsService().getNews(categoryName: "general");
            },
            icon: Icon(Icons.abc),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "News",
                  style: TextStyle(color: Colors.black, fontSize: 24.r),
                ),
                TextSpan(
                  text: "Cloud",
                  style: TextStyle(color: Colors.orange, fontSize: 24.r),
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            const Newslistbuilder(),
          ],
        )
        // NestedScrollView(
        //   headerSliverBuilder: (context, innerBoxIsScrolled) {
        //     return [
        //       SliverToBoxAdapter(
        //         child: CategoryListView(),
        //       )
        //     ];
        //   },
        //   body: const NewsListView(),
        // ),
        );
  }
}
