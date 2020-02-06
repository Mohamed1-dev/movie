import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/customapp_bar.dart';
import '../Pages/homePage.dart';
import '../widgets/app_drawer.dart';
import './postersPage.dart';

class ContentPage extends StatelessWidget {
  static String  route = '/contentPage';

  List categories = [
    {'name': 'الرئيسية'},
  ];


  Future<Map> fetchData() async {
    var url = 'http://shashtyapi.sports-mate.net/api/Home';
    http.Response response = await http.get(url);
    print(json.decode(response.body).toString());
    return json.decode(response.body);
  }
  Widget buildNavigationPage(String name, data) {
    if (name == 'الرئيسية')
      return Home(
        data: data,
      );
    return PostersPage();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        categories.addAll(snapshot.data['categories']);
        return DefaultTabController(
          length: categories.length,
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: CustomAppBar(categories),
            body: TabBarView(
              children: categories.map((category) {
                return buildNavigationPage(category['name'], snapshot.data);
              }).toList(),
            ),
            drawer: AppDrawer(),
          ),
        );
      },
    );
  }


}
