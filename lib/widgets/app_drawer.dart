
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/content_page.dart';
import '../providers/movies.dart';

class AppDrawer extends StatelessWidget {
  Movies _movies;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        color: Color.fromRGBO(0, 0, 0, 0.6),
        child: FutureBuilder(
          future: _movies.getUser(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: snapshot.hasData &&
                                      snapshot.data.image != null
                                  ? NetworkImage(
                                      "http://shashtyapi.sports-mate.net/public/${snapshot.data.image}")
                                  : AssetImage('assets/images/img.jpg'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    InkWell(
                      onTap: () {
                        if (snapshot.hasData && snapshot.data.image != null)
                          return null;
                        return Navigator.pushNamed(context, 'login');
                      },
                      child: Text(
                        snapshot.hasData && snapshot.data.name != null
                            ? snapshot.data.name
                            : "تسجيل الدخول",
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text("المساعدة"),
                ),
                ListTile(
                  leading: Icon(Icons.headset_mic),
                  title: Text("اتصل بنا"),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("حقوق الملكية"),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text("الشروط و الاحكام"),
                ),
                snapshot.hasData && snapshot.data.name != null
                    ? ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text("خروج"),
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.clear();
                          Navigator.pushNamed(context, ContentPage.route);
                        },
                      )
                    : Container(),
              ],
            );
          },
        ));
  }
}