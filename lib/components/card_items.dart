
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CardItems extends StatefulWidget {
  Shoe shoe ;
   CardItems({super.key , required this.shoe});

  @override
  State<CardItems> createState() => _CardItemsState();
}

class _CardItemsState extends State<CardItems> {

  // remove item from cart 
  void removeItemFromcart(){
    Provider.of<Cart>(context , listen: false).removeItem(widget.shoe);
  }

  // increment the quantity 
  void incrementQty(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Image.asset(widget.shoe.imgPath),
              title: Text(widget.shoe.name),
              subtitle: Text('\$ ${widget.shoe.price}'),
              trailing: IconButton(
                icon:const Icon(Icons.delete ) ,
                onPressed: removeItemFromcart,),
            ),
          ),

      ],
    ) ;
  }
}