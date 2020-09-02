
import 'dart:io';

import 'package:bandname/models/banda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Banda> bandas = [
    Banda(id:'1', nombre: 'Banda 1', votos: 25),
    Banda(id:'2', nombre: 'Banda 2', votos: 15),
    Banda(id:'3', nombre: 'Banda 3', votos: 5),
    Banda(id:'4', nombre: 'Banda 4', votos: 20),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nombre de Bandas", style: TextStyle(color:Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bandas.length,
        itemBuilder: ( context, i ) => _bandaTile(bandas[i])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: _agregarNuevaBanda
      ),
    );
  }

  Widget _bandaTile(Banda banda) {
    return Dismissible(
      key: Key(banda.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print('$direction');
        print('ID Banda: ${banda.id}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 20),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Eliminar Banda", style: TextStyle(color: Colors.white),)
          ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(banda.nombre.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(banda.nombre),
        trailing: Text(banda.votos.toString()),
        onTap: (){
          print(banda.nombre);
        },
      ),
    );
  }

  _agregarNuevaBanda(){

    final textController = new TextEditingController();

    if(Platform.isAndroid){

      return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Nueva Banda'),
            content: TextField(
              controller: textController
            ),
            actions: [
              MaterialButton(
                child: Text("Agregar"),
                textColor: Colors.blue,
                elevation: 5,
                onPressed: () => agregarBandaLista(textController.text)
              )
            ],
          );
        }
      );
    }

    showCupertinoDialog(
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          title: Text("Nueva Banda"),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Agregar'),
              onPressed: () => agregarBandaLista(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('Cerrar'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      }
    );
    
  }

  void agregarBandaLista(String nombre){

    if(nombre.length > 2){
      final index = bandas.length + 1;

      setState(() {
        bandas.add(new Banda(
          id:index.toString(),
          nombre: nombre,
          votos: 0
          )
        );
        
      });
    }

    Navigator.pop(context);
  }
}