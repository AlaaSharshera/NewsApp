import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/artticles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({required this.artticlesModel, super.key});
  final ArtticlesModel artticlesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.r),
      child: Column(
        children: [
          Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: CachedNetworkImage(
              imageUrl: artticlesModel.urlToImage ??
                  'https://cdn.pixabay.com/photo/2017/06/26/19/03/news-2444778_1280.jpg',
              placeholder: (context, url) {
                return const Center(child: CircularProgressIndicator());
              },
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return const Image(
                    image: AssetImage('assets/images/news.webp'));
              },
            ),
          ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            artticlesModel.title ?? "",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            artticlesModel.description ?? " ",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
