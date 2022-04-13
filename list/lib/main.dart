import 'package:flutter/material.dart';
import 'package:list/elemets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends QnA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Friends QnA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
      'https://i.ibb.co/rQGYWm5/MV5-BNDVk-Yj-U0-Mzct-MWRm-Zi00-NTkx-LTgw-ZWEt-OWVh-Yj-Zl-Yjll-Ym-U4-Xk-Ey-Xk-Fqc-Gde-QXVy-NTA4-Nz-Y1.jpg';
  Elements instance = Elements();
  String dropDownValue = '0';
  var downsitem = List<int>.generate(10, (i) => i).map((e) => e.toString());
  String answers = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Image.network(
                url,
                scale: 5,
              ),
            ),
            DropdownButton(
              value: dropDownValue.isEmpty ? dropDownValue : null,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: downsitem.map((String downsitem) {
                return DropdownMenuItem(
                  value: downsitem,
                  child: Text(downsitem),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropDownValue = newValue!;
                  answers = '';
                });
              },
            ),
            Text(
              instance.items[int.parse(dropDownValue)],
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text('Show Ans'),
              onPressed: () {
                setState(() {
                  answers = dropDownValue;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(answers.isEmpty ? answers : instance.ans[int.parse(answers)])
          ],
        ),
      ),
    );
  }
}
