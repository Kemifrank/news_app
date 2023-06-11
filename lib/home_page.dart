import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jet_news/components/bottom_navigation.dart';
import 'package:jet_news/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:jet_news/screens/details.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'tab_bars/tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> _newsarticles = [];

  Future<void> _fetchArticles() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=46a382fa120e486193df44826fc1a37f'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> newsArticleData = jsonData['articles'];
      print(newsArticleData);

      setState(() {
        _newsarticles = newsArticleData
            .map((resultData) =>
                Article.fromJson(resultData as Map<String, dynamic>))
            .toList();
      });
    } else {
      throw Exception('Failed to fetch');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.black,
          )
        ],
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigation(),
      body: _newsarticles.isEmpty
          ? Container(
            
          )
          : Column(
            
              children: [
                
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Breaking News',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Show More',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    constraints: const BoxConstraints(
                        maxHeight:
                            300), // Set a desired height or use constraints
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 8.0),
                      itemCount: _newsarticles.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        Article result = _newsarticles[index];
                        return Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsPage(result: result),
                                    ),
                                  );
                                },
                                child: Stack(children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              result.urlToImage,
                                            ),
                                            fit: BoxFit.cover)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            result.title,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                height: 1.5,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ])));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: const Tabs(),
                )
              ],
            ),
    );
  }
}
