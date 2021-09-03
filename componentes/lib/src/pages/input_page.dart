import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre= "";
  String _email = "";
  String _fecha = "";

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Inputs de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearPersona(),
          Divider(),
        ],
      ),
    );
  }
  Widget _crearInput() {
    return TextField(

      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12.0)
        ),
        counter: Text("letras " + _nombre.length.toString()),
        hintText: "Nombre",
        labelText: "Nombre",
        helperText: "Solo nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)

      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12.0)
        ),
        counter: Text("letras " + _email.length.toString()),
        hintText: "Email",
        labelText: "Email",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)

      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12.0)
        ),
        counter: Text("letras " + _email.length.toString()),
        hintText: "Password",
        labelText: "Pwd",
        suffixIcon: Icon(Icons.lock_clock),
        icon: Icon(Icons.lock_clock_rounded)

      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPersona(){

    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email"),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12.0)
        ),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha de Nacimiento",
        suffixIcon: Icon(Icons.calendar_today_sharp),
        icon: Icon(Icons.calendar_view_day_rounded)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

   _selectDate(BuildContext context) async {

     DateTime? picked = await showDatePicker(
       context: context, 
       initialDate: new DateTime.now(), 
       firstDate: new DateTime(2003), 
       lastDate: new DateTime(2025)
       locale: Locale('es','ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}




