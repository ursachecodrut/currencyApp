import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(currencyApp());
}

class currencyApp extends StatefulWidget {
  const currencyApp();

  @override
  _currencyAppState createState() => _currencyAppState();
}

class _currencyAppState extends State<currencyApp> {

  TextEditingController controller = TextEditingController();
  String? money;
  // double? result;
  
  bool isNumeric(String string){
    return double.tryParse(string) != null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'currency App'
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Center(
                child: Image.network("https://www.101computing.net/wp/wp-content/uploads/currencies.png")),
            TextField(
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your amount in EUR",
                errorText: isNumeric(controller.text) ? null : "Please enter a valid number",
                errorStyle: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: (){
                    setState(() {
                      if(isNumeric(controller.text)){
                        double result = double.parse(controller.text);
                        result *= 4.93;
                        money = result.toStringAsFixed(2);
                      }
                    });

                  },
                  child: Text(
                      'Convert',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
              ),
            ),
            if(money != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "${money!} RON",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
