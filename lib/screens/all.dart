import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../news_model.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<Article> _newsArticle = [];

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=46a382fa120e486193df44826fc1a37f'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> newsArticleData = jsonData['articles'];
      print(newsArticleData);

      setState(() {
        _newsArticle = newsArticleData
            .map((resultData) =>
                Article.fromJson(resultData as Map<String, dynamic>))
            .toList();
      });
    } else {
      throw Exception('Fail to fetch');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(8.0),

          child: ListView.builder(
              itemCount: _newsArticle.length,
              itemBuilder: (BuildContext context, int index) {
                Article result = _newsArticle[index];
                return Column(children: [
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(result.urlToImage),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              result.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Published by :'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  result.author,
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${result.publishedAt.month.toString().padLeft(2, '0')}/${result.publishedAt.day.toString().padLeft(2, '0')}/${result.publishedAt.year.toString()}',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ]);
              })),
    );
  }
}
