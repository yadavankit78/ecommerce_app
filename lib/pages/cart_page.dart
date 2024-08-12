import 'package:ecommerce_app/components/card_items.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  double _calculateTotalPrice(){
   return Provider.of<Cart>(context , listen: false).calculateTotalPrice();
  } 


  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Cart',
                style: TextStyle(fontSize: 24, 
                fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 10,),

              Expanded(
                child: value.userCart.isNotEmpty ?  ListView.builder(
                  itemCount: value.getUserCard().length,
                  itemBuilder: (context, index) {
                    
                    // get individual shoe 
                    Shoe individualShoe = value.getUserCard()[index];
                  
                    // return the card item
                  
                    return CardItems(shoe: individualShoe);
                  },
                  ) : const Center(child: Text("Your cart is empty")), 
                  ),
                Padding(
            padding: const EdgeInsets.all(10.0),
            child:value.userCart.isNotEmpty ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text(
                  'Total:',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ ${_calculateTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ) : null,
           ),
        

                  
            ],
          ),
        );
      },
    );
  }
}
