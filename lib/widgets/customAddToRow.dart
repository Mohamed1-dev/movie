import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAddToRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            onPressed:()=> addTo(context)),
        IconButton(icon: Icon(Icons.star, color: Colors.grey,), onPressed:()=> addTo(context)),
      ],
    );
  }



    void addTo(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get('user_id') == null) {
      showDialog(
        context: context,
        child: AlertDialog(
            backgroundColor: Colors.grey,
            contentPadding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: Container(
              height: 150,
              child: Column(
                children: <Widget>[
                  Text("قم بتسجيل الدخول اولا او انشاء حساب للحصول على الصلاحيات"),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.red,
                        child: Text("تسجيل الدخول"),
                        onPressed: () => Navigator.pushNamed(context, 'login'),
                      ),

                      RaisedButton(
                        color: Colors.red,
                        child: Text("انشاء حساب"),
                        onPressed: () => Navigator.pushNamed(context, 'signup'),
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      );
    }
  }
}