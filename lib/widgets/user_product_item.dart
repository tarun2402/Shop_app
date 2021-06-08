import 'package:flutter/material.dart';
import 'package:shop_app/providers/products.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  // final Products productData;
  final String title;
  // final int index;
  final String id;
  final String imageUrl;
  UserProductItem({this.title, this.imageUrl, this.id});
  @override
  Widget build(BuildContext context) {
    final scaffold =  Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_) => EditProductScreen(index: index, productData: productData,)));
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                await  Provider.of<Products>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  // scaffold.showSnackBar(SnackBar(content: Text('Deleting Failed!', textAlign: TextAlign.center,),),);
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deleting Failed!', textAlign: TextAlign.center,),),);
                }
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
