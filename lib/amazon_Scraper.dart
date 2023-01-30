import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

class AmazonScraper extends StatefulWidget {
  const AmazonScraper({super.key});

  @override
  State<AmazonScraper> createState() => _AmazonScraperState();
}

class _AmazonScraperState extends State<AmazonScraper> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();

    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.amazon.com/s?k=iphone');
    print(url.toString());
    final response = await http.get(url);
    print(response.toString());
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll(' h2 > a > span')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urls = html
        .querySelectorAll('h2 > a')
        .map(
            (element) => 'https://www.amazon.com/${element.attributes['href']}')
        .toList();

    final urlImage = html
        .querySelectorAll('span > a > div > img')
        .map((element) => element.attributes['src']!)
        .toList();

    print('Count: ${titles.length}');

    setState(() {
      articles = List.generate(
        titles.length,
        (index) => Article(
          url: urls[index],
          title: titles[index],
          urlImage: urlImage[index],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebScraping"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];

          return ListTile(
            leading: Image.network(article.urlImage,
                width: 50, fit: BoxFit.fitHeight),
            title: Text(article.title, style: TextStyle(fontSize: 18)),
            subtitle: Text(article.url, style: TextStyle(fontSize: 9)),
          );
        },
      ),
    );
  }
}

// Article class --------------------------
class Article {
  final String url;
  final String title;
  final String urlImage;

  const Article({
    required this.url,
    required this.title,
    required this.urlImage,
  });
}
//--------------------------------------------