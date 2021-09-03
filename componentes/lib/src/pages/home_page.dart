import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: _lista(),
    );
  }

  Widget _lista() {
    
    
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        
        print('builder');

        return ListView(
          children: _listaItems( snapshot.data, context ),
        );
      }
    );

    
  }

  List<Widget> _listaItems( List<dynamic>? data, BuildContext context ) {
    
    final List<Widget> opciones = [];

    data!.forEach((element) { 

      final widgetTemp = ListTile(
        title: Text(element['texto'] ),
        leading: getIcon( element['icon'] ),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.lightBlueAccent),
        onTap: (){

          Navigator.pushNamed(context, element['ruta']);
          // final route = MaterialPageRoute(
          //   builder: (context)=> AlertPage()
          //   );
          // Navigator.push(context, route);
        },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });
    
    return opciones;

  }
}