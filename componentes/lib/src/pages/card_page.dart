import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 10.0),
          _cardTipo2(),
          SizedBox(height: 10.0),
          _cardTipo2(),
          SizedBox(height: 10.0),
          _cardTipo2(),
          SizedBox(height: 10.0),
          _cardTipo2(),
          SizedBox(height: 10.0),
          _cardTipo2(),
          SizedBox(height: 10.0),
          _cardTipo2(),
          SizedBox(height: 10.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1(){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album,color: Colors.blueGrey),
            title: Text("Tarjeta cual."),
            subtitle: Text("Es una tarjeta cual."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text("Cancelar"),
                onPressed: (){
                  
                },
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: (){
                  
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2(){

    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage("https://www.wallpaperflare.com/static/838/938/455/dog-street-spotted-adult-wallpaper.jpg"),
            placeholder: AssetImage("assets/jar-loading.gif"),
            fadeInDuration: Duration( milliseconds: 200 ),
            fadeOutDuration: Duration( milliseconds: 500 ), 
            height: 250.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage("https://www.wallpaperflare.com/static/838/938/455/dog-street-spotted-adult-wallpaper.jpg"),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Un rocky"))
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        child : card,
        borderRadius: BorderRadius.circular(12.0),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          ),
        ]
      ),
    );
  }
}