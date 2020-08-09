import 'package:flutter/material.dart';

class SimpleProduct extends StatelessWidget {
  const SimpleProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.network('https://picsum.photos/200',
                  fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
          child: Text(
            '17,500',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Text(
            '레몬트리',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            '[원피스/4ps구성] 퍼펙트SET (5color)',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ),
        Text(
          '2,233개 구매중',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        )
      ],
    );
  }
}
