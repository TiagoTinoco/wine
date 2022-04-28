import 'package:flutter/material.dart';

class WineCard extends StatelessWidget {
  const WineCard({
    Key? key,
    this.wine,
    this.price,
    required this.child,
  }) : super(key: key);

  final String? wine;
  final int? price;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: const Color.fromARGB(222, 45, 40, 122), borderRadius: BorderRadius.circular(10), border: Border.all(width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wine.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.pink[100],
                  ),
                ),
                Text(
                  'Preço: ${price.toString()}.00',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
