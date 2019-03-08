import 'package:flutter/material.dart';

import 'dart:async';

import '../widgets/ui_elements/title_default.dart';
import '../widgets/products/address_tag.dart';
import '../widgets/products/price_tag.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  Widget _buildPriceDescriptionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AddressTag('Australia'),
        SizedBox(width: 5.0,),
        PriceTag(price.toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10),
              child: TitleDefault(title),
            ),
            _buildPriceDescriptionRow(),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
