import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/05/traje-iron-man.jpg?itok=Pvirjf3M"),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("IM"),
              backgroundColor: Colors.blueGrey,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"), 
          image: NetworkImage("https://i.pinimg.com/originals/a4/ab/91/a4ab91e4f4d9972853cadb484547c2d4.png"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}