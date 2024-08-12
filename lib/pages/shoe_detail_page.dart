import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ShoeDetailPage extends StatefulWidget {
  Shoe shoe;
  ShoeDetailPage({super.key, required this.shoe});

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  
  void _addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user , shoe is successfully added

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        // ignore: prefer_const_constructors
        title: Text("Successfully added"),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
         
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                height: 400,
                child: Image.asset(widget.shoe.imgPath),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.shoe.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$ ${widget.shoe.price}',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.shoe.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                   _addShoeToCart(widget.shoe);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black26),
                  child: const Center(
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
