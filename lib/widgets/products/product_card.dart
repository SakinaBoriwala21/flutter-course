import 'package:flutter/material.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow () {
    return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleDefault(product['title']),
                SizedBox(
                  width: 10,
                ),
                PriceTag(product['price'].toString()),
              ],
            ),
            padding: EdgeInsets.only(top: 10.0),
          );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  tooltip: 'Details',
                  color: Theme.of(context).accentColor,
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + productIndex.toString())),
              IconButton(
                icon: Icon(Icons.favorite),
                tooltip: 'Favorite',
                onPressed: () {},
                color: Colors.redAccent,
              )
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          _buildTitlePriceRow(),
          AddressTag('Austria'),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
