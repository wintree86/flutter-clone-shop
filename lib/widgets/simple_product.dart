import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dating_app/models/product.dart';

final formatCurrency = new NumberFormat("#,##0");

class SimpleProduct extends StatelessWidget {
  final Product item;
  final int index;

  SimpleProduct({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('on Tap ${item.productId}');
        Navigator.pushNamed(context, '/product', arguments: item);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network('https://picsum.photos/seed/$index*3/200',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width),
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
          Row(
            children: [
              if (item.sale > 0.0)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(
                    '${item.sale.floor().toString()}% ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.red),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text(
                  formatCurrency.format(item.price),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Text(
              item.shop,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              item.title,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          Text(
            '${formatCurrency.format(item.sellingCount)} 개 구매중',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }
}
