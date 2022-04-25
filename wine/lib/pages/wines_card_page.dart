import 'package:flutter/material.dart';
import 'package:wine/repository/wine.dart';

class WinescardPage extends StatefulWidget {
  const WinescardPage({
    Key? key,
    required this.name,
    required this.grape,
    required this.pairings,
    required this.price,
    required this.temperature,
    required this.qtde,
  }) : super(key: key);

  final String name;
  final String grape;
  final String pairings;
  final int temperature;
  final int price;
  final int qtde;

  @override
  State<WinescardPage> createState() => _WinescardPageState();
}

class _WinescardPageState extends State<WinescardPage> {
  final wine = WineRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: RichText(
          text: TextSpan(
            text: 'Wi',
            style: TextStyle(
              fontSize: 50,
              color: Colors.pink[200],
              fontWeight: FontWeight.bold,
              fontFamily: 'PlayfairDisplay',
            ),
            children: const <TextSpan>[
              TextSpan(
                text: ' ne.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(255, 45, 40, 122),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: const Color.fromARGB(255, 45, 40, 122),
            onPressed: () {},
          ),
          const SizedBox(width: 20),
          CircleAvatar(backgroundColor: Colors.pink[200]),
          const SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 50, left: 50, top: 40, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text(
                'Bordeaux',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              'Pauillac red',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 45, 40, 122),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Service(
              title: 'Service temperature',
              subtitle: widget.temperature.toString() + '°',
            ),
            Service(
              title: 'Grapes',
              subtitle: widget.grape,
            ),
            Service(
              title: 'Food pairings',
              subtitle: widget.pairings,
            ),
            const SizedBox(height: 30),
            Text(
              '\$ ${widget.price}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CountButton(
                  qtde: widget.qtde,
                ),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey[50],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.heart_broken,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextButton(
              child: const Text(
                "Add to cart",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 50,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 45, 40, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ))),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Service extends StatelessWidget {
  const Service({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 210,
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CountButton extends StatefulWidget {
  CountButton({
    Key? key,
    required this.qtde,
  }) : super(key: key);

  int qtde;

  @override
  State<CountButton> createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey[50],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (widget.qtde >= 2) {
                setState(() {
                  widget.qtde--;
                });
              }
            },
            icon: const Icon(Icons.remove, size: 13),
          ),
          Text(
            widget.qtde.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              if (widget.qtde <= 9) {
                setState(() {
                  widget.qtde++;
                });
              }
            },
            icon: const Icon(Icons.add, size: 15),
          ),
        ],
      ),
    );
  }
}
