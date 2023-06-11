import 'package:flutter/material.dart';
import 'package:jet_news/screens/politics.dart';

import '../screens/all.dart';
import '../screens/education.dart';
import '../screens/entertain.dart';
import '../screens/games.dart';
import '../screens/sports.dart';
import '../screens/tech.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        children: [
          Container(
            height: 60,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TabBar(
                    splashBorderRadius: BorderRadius.circular(25),
                    isScrollable: true,
                    // indicatorWeight: 7,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.blueGrey,
                    unselectedLabelStyle: TextStyle(),
                    labelColor: Colors.black,
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue,
                    ),
                    tabs: [
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: const [
                              Icon(Icons.temple_buddhist),
                              SizedBox(width: 5),
                              Text('Politics'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: const [
                              Icon(Icons.sports_football),
                              SizedBox(width: 5),
                              Text('Sports'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: const [
                              Icon(Icons.computer),
                              SizedBox(width: 5),
                              Text('Tech'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: const [
                              Icon(Icons.movie),
                              SizedBox(width: 5),
                              Text('Entertainment'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: const [
                              Icon(Icons.sports_soccer),
                              SizedBox(width: 5),
                              Text('Games'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: const [
                              Icon(Icons.school),
                              SizedBox(width: 5),
                              Text('Education'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: const[
                AllNews(),
                Politics(),
                Sports(),
                Tech(),
                EntertainmentPage(),
                Games(),
                Education()
              ]),
            ),
          )
        ],
      ),

      
    );
    // Flexible(

    // // fit: FlexFit.loose,

    // child: Container(
    //   height: 200,
    //   child: TabBarView(children: [
    //   // AllNews()
    //           ],),
    // ))
  }
}
