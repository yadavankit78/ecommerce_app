import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

String _searchText = '';

  

// add shoe to cart 
    void addShoeToCart(Shoe shoe){
       Provider.of<Cart>(context ,listen: false ).addItemToCart(shoe);

       // alert the user , shoe is successfully added 

       showDialog(context: context, builder: (context) => const AlertDialog(
              // ignore: prefer_const_constructors
              title:  Text("Successfully added"),
              content: Text('Check your cart'),
       ),);
    }

    void _updateSearchText(String searchText) {
    setState(() {
      _searchText = searchText;
    });
  }

     


  @override
  Widget build(BuildContext context) {
    final filteredProducts = Provider.of<Cart>(context).getShopList()
        .where((product) =>
            product.name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
     
    return Consumer<Cart>(builder: (context, value, child) => 
    
    SingleChildScrollView(
      child: Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            // ignore: prefer_const_constructors
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                              decoration:const InputDecoration(
                                hintText: 'Search Products...',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Color.fromARGB(179, 74, 68, 68)),
                              ),
                              style: const TextStyle(color: Colors.white),
                              onChanged: _updateSearchText,
                            ),
                  ),
                const  Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ],
              ),
          
          ),
      
          // message
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: const Text(
              'everyone flies.. some fly longer than others',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
      
          // hot picks of shoes
      
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
               
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
      
          SizedBox(
            height: 400,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe =filteredProducts[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: ()=> addShoeToCart(shoe),
                );
              },
            ),
          ),
      
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    ));
  }
}
