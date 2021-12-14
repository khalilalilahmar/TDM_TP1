import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TP 01'),
      routes: {Activity.routeName: (ctx) => Activity()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var remarque;
  var resultat ="Résultat";
  var massec = TextEditingController();
  var taillec = TextEditingController();
  var masse;
  var taille;
  var img = "assets/1.png";
  final GlobalKey<FormState> _formKey = GlobalKey();
   void  calcule(String masse, String taille){
     print(masse);
     print(taille);
    double massed = double.parse(masse);
    double tailled = double.parse(taille);
    tailled=tailled/100;
    print(massed);
    print(tailled);
    double resultatd = (massed / (tailled*tailled));
    print(resultatd);
    if (resultatd > 40 ) {
      remarque = " Obésité morbide ou massive";
      img="assets/7.png";
    }
    else if (resultatd > 35  && resultatd <= 40){

      remarque =" Obésité sévère";
      img="assets/6.png";
    }else if (resultatd > 30 && resultatd <=35){
      remarque ="Obésité modérée";
      img="assets/5.png";
    }else if (resultatd > 25 && resultatd <= 30){
      remarque = "Surpoids";
      img="assets/4.png";
    }else if (resultatd >18.5 && resultatd<=25){
      remarque="Corpulence normale";
      img="assets/3.png";
    }else if (resultatd >16.5 && resultatd<=18.5){
      remarque="Maigreur";
      img="assets/2.png";
    }else if (resultatd <=16.5){
      remarque="Famine";
      img="assets/1.png";
    }
     setState(() {
       resultat = remarque + "  "+ resultatd.round().toString();
     });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TP1EXO2"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Container(
                     width: MediaQuery.of(context).size.width*0.4,
                     child: TextFormField(
                       keyboardType:TextInputType.number  ,
                       textAlign: TextAlign.left,
                       controller: taillec,
                       autovalidate: true,
                       decoration: InputDecoration(
                         labelText: "Votre Taille (CM)"
                       ),
                     ),
                   ) ,
                   Container(
                     width: MediaQuery.of(context).size.width*0.4,
                     child: TextFormField(
                       keyboardType:TextInputType.number  ,
                       textAlign: TextAlign.left,
                       controller: massec,
                       autovalidate: true,
                       decoration: InputDecoration(
                         labelText:"Votre Masse (KG)"
                       ),
                     ),
                   )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(50),
                  child: RaisedButton(
                    color: Colors.black38,
                    onPressed: () {

                      print("debugging");
                      calcule(massec.text, taillec.text);
                    },
                    child: Text(
                      "IMC",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
               Text(
                 resultat,
                 textAlign: TextAlign.center,
                 overflow: TextOverflow.fade,
                 textDirection: TextDirection.rtl,
               ),
                (resultat=="Résultat") ? Text("") :
                   Image.asset(img),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
