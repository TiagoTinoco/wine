import 'package:flutter/material.dart';
import 'package:wine/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 45, 40, 122),
        elevation: 0,
        title: RichText(
          text: TextSpan(
            text: 'Wi',
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'PlayfairDisplay',
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' ne.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[200],
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 45, 40, 122),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text(
                'Exceptional',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w300,
                  color: Colors.pink[100],
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
              Text(
                'Wines',
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[200],
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Red, rosé, white and sparkling, wines are an enchanting world. Contemplate their colors, discover their aromas and flovors...',
                style: TextStyle(fontSize: 15, color: Colors.grey[300]),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  color: Colors.white,
                  iconSize: 20,
                  onPressed: () => Navigator.of(context).pushNamed(HomePage.routeName),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
