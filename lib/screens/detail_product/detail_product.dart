import 'package:flutter/material.dart';
import 'package:flutter_dating_app/models/product.dart';

class DetailProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Detail Product ${product.productId}'),
      ),
    );
  }
}
