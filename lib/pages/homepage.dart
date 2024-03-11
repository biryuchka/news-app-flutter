import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_api_hw1/pages/details.dart';
import 'package:news_api_hw1/pages/appbar.dart';
import 'package:news_api_hw1/modal/article.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> Category = [
    "general",
    "it",
    "science",
    "business"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Category.length,
      child:Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: MyTitle(),
        bottom: TabBar(
          tabs: [
            for (var text in Category)
              Tab(text: text),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          for (var i in Category)
          _futureBuilder(i),
        ],
      )
      ),
    );
  }

  FutureBuilder<List<Article>> _futureBuilder(String category) {
    return FutureBuilder<List<Article>>(
      future: fetchArticles(category),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildNewsListView(snapshot.data as List<Article>);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        return
          const Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  Widget buildNewsListView(List<Article> articleList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Article article = articleList[index];
        return buildNewsItem(article);
      },
      itemCount: articleList.length,
    );
  }

  Widget buildNewsItem(Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsPage(title: "NewsPage", article: article);
        },),);
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  article.urlToImage,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(height: 80, width: 80);
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 10),
                        child: Row(

                          children: [
                            const Icon(Icons.people),
                            const SizedBox(width: 5),
                            Text(article.source),
                          ],
                        ),
                      ),
                    ],
                  ),),
            ],
          ),
        ),
      ),
    );
  }

}
