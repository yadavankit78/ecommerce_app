
import 'package:ecommerce_app/models/shoe.dart';
import 'package:ecommerce_app/pages/shoe_detail_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  Shoe shoe ;
  void Function()? onTap;
   ShoeTile({super.key , required this.shoe ,required this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ShoeDetailPage(shoe: shoe,),));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 25 ,),
        width: 280,
       
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             // shoe pic 
             Padding(
               padding: const EdgeInsets.only(top: 25),
               child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(shoe.imgPath ,
                height: 200, 
                ),),
             ),
      
             // description 
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 25.0),
               child: Text(
                shoe.description ,
                style: const TextStyle(
                  color: Colors.grey ,
                ),
               ),
             ),
      
             // price + details
      
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // shoe name 
                  Text(
                    shoe.name ,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20 ,
                    ),
                  ),
                
                  const SizedBox(height: 5,),
                  // price 
                  Text(
                    '\$'+ shoe.price.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                
                
                    ),
                  ),
                
                    ],
                  ),
                
                  // plus button 
                
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        color: Colors.black,
                        // ignore: prefer_const_constructors
                        borderRadius: BorderRadius.only(
                          topLeft:const Radius.circular(12),
                          bottomRight:const Radius.circular(12),
                        )
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                  
                
                
                           ],),
              )
      
             // button to add cart 
          ],
        ),
      ),
    ) ;
  }
}