import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? text;

  List<String> names = [];
  //TextEditingController controler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('show dialoge'),
        ),
        body: Column(
          children: [
            TextField( controller:TextEditingController() ,

              onChanged: onTextChanged,
              decoration: InputDecoration(hintText: 'write here'),
            ),
            ElevatedButton(
                onPressed: () {
                  showCustomDialog(context);
                },
                child: Text('add text')),
            Expanded(child:
            ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext Context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      names[index],
                      textAlign: TextAlign.center,
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildContext) => AlertDialog(
          title: Text('alert'),
          content: Text(text!),
        ));
    setState(() {
      names.add(text!);

    });
TextEditingController().clear();

  }

  void onTextChanged(String newText) {
    text = newText;
  }
}
