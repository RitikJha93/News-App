import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/helpers/data.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/categoryTile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<NewsModel> news = <NewsModel>[];

  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    news = newsClass.news;
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
            )
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                                imageUrl: categories[index].imageUrl!,
                                categoryName: categories[index].categoryName!);
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: news.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                                imageUrl: news[index].urlToImage!,
                                title: news[index].title!,
                                description: news[index].description!);
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
