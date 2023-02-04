import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/categoryTile.dart';

class CategoryNews extends StatefulWidget {
  final String categoryName;
  const CategoryNews({super.key, required this.categoryName});

  @override
  State<CategoryNews> createState() => CategoryNewsState();
}

class CategoryNewsState extends State<CategoryNews> {
  List<NewsModel> categoryList = [];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNewsList();
  }

  getCategoryNewsList() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.categoryName);
    categoryList = newsClass.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Flutter', style: TextStyle(color: Colors.black)),
            Text(
              'News',
              style: TextStyle(color: Colors.blue[300]),
            ),
            const Opacity(
                opacity: 0,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.search),
                ))
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return BlogTile(
                      imageUrl: categoryList[index].urlToImage!,
                      title: categoryList[index].title!,
                      description: categoryList[index].description!,
                      url: categoryList[index].url!,
                    );
                  }),
            ),
    );
  }
}
