// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  double input = 0;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Currency Convertor',
            style: TextStyle(fontSize: 20, letterSpacing: 5),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network('https://www.cec.ro/sites/default/files/img/media/2021-06/curs%20valutar.jpg'),
              TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                onChanged: (String value) {
                  setState(() {
                    final double? x = double.tryParse(value);
                    if (x == null) {
                      errorText = 'Introdu Doar Numere';
                    } else {
                      input = x;
                      errorText = null;
                    }
                  });
                },
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(fontSize: 25),
                decoration: InputDecoration(
                    hintText: 'Introdu Suma in Euro',
                    errorText: errorText,
                    errorStyle: const TextStyle(fontSize: 15),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _controller.clear();
                            input = 0;
                          });
                        })),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                child: Text(
                  '${(input* 4.95).toStringAsFixed(2) } RON ',
                  style: const TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ));
  }
}
