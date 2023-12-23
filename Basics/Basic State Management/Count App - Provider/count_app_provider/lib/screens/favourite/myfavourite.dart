import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);

    // Filter the items based on whether they are favorites
    List<int> favoriteItems = favouriteProvider.selectedItem;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourite Items"),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          int itemIndex = favoriteItems[index];
          return ListTile(
            title: Text(
              "item $itemIndex",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
          );
        },
      ),
    );
  }
}
