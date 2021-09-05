import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider = 400.0;
  bool _bloquearCheck = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.blueGrey,
         title: Text("Slider"),
       ),
       body: Container(
         padding: EdgeInsets.only(top: 20.0),
         child: Column(
           children : <Widget>[
             _crearSlider(),
             _crearCheckbox(),
             _crearSwitch(),
             Expanded(
               child: _crearImagen()
             ),
           ]
         ),

       ),
    );
  }

  Widget _crearSlider() {
    
    return Slider(
      activeColor: Colors.blueGrey[200],
      label: "Tamaño de la imagen",
      min: 10.0,
      value: _valorSlider,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      }
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      placeholder: AssetImage("assets/jar-loading.gif"),
      fadeInDuration: Duration( milliseconds: 200 ),
      fadeOutDuration: Duration( milliseconds: 500 ), 
      image: NetworkImage("https://www.pngitem.com/pimgs/m/50-508817_iron-new-suit-infinity-war-png-download-iron.png"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor){
    //     setState(() {
    //       _bloquearCheck = valor!;
    //     });
    //   }
    // );
    return CheckboxListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor!;
        });
      }
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
    );
  }
}