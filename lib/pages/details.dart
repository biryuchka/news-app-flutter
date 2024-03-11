import 'package:flutter/material.dart';
import 'package:news_api_hw1/pages/appbar.dart';
import 'package:news_api_hw1/modal/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget{
  const DetailsPage({Key? key, required this.title, required this.article}) : super(key: key);
  final String title;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
              child: Image.network(
                article.urlToImage,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(height: 0, width: 0);
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.people),
                            const SizedBox(width: 5),
                            Text("${article.source}: "),
                            Text(article.author),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.date_range),
                            const SizedBox(width: 5),
                            Text(article.publishedAt),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.description,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _launchUrl,
                    child: const Text("See More"),
                  ),
                ],
              ),
            ),
          ],),
          ),

    );
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(article.url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
