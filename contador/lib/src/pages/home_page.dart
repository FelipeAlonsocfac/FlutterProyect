import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  final TextStyle estiloTexto = new TextStyle( fontSize: 25);
  final Text hola = new Text("Hola");

  final int conteo = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Titulo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Numero de clicks:",style: estiloTexto),
            Text("$conteo",style: estiloTexto),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () { 
          
         },

      ),
    );
  }
}