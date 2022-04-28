import 'package:flutter/material.dart';
import 'package:wine/models/wine.dart';
import 'package:wine/repository/wine.dart';
import 'package:wine/widgets/button.dart';
import 'package:wine/widgets/logo.dart';

class FormWinePage extends StatefulWidget {
  const FormWinePage({Key? key}) : super(key: key);

  @override
  State<FormWinePage> createState() => _FormWinePageState();
}

class _FormWinePageState extends State<FormWinePage> {
  final wineRepository = WineRepository();

  String nameValue = '';
  String temperatureValue = '';
  String grapesValue = '';
  String pairingsValue = '';
  String priceValue = '';

  void submit() {
    wineRepository.postWine(
      Wine(
        name: nameValue,
        temperature: double.parse(temperatureValue),
        grapes: grapesValue,
        pairings: pairingsValue,
        price: int.parse(priceValue),
      ),
    );
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.pink),
        elevation: 2,
        title: const LogoWidget(title: 'Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              onChanged: (value) {
                nameValue = value;
              },
              cursorColor: Colors.pink,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Temperature',
              ),
              onChanged: (value) {
                temperatureValue = value;
              },
              cursorColor: Colors.pink,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Grapes',
              ),
              onChanged: (value) {
                grapesValue = value;
              },
              cursorColor: Colors.pink,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Food pairings',
              ),
              onChanged: (value) {
                pairingsValue = value;
              },
              cursorColor: Colors.pink,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Price',
              ),
              onChanged: (value) {
                priceValue = value;
              },
              cursorColor: Colors.pink,
            ),
            const SizedBox(height: 20),
            const Spacer(),
            ButtonWidget(
              title: 'Send',
              onPressed: submit,
            ),
          ],
        ),
      ),
    );
  }
}
