import 'package:ecommerce_app/components/bottom_nav_bar.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this is selected index is to control the bottom nav bar
  int selectedIndex = 0;

  // this is method to update the selected index
  // when the user taps on bottom bar

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // pages to display 

  final List<Widget> _pages = [
    // shop page 
    const ShopPage(),
    // cart page 
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar:
          MyBottomNavBar(onTabChange: (index) => navigateBottomBar(index)),
          body: _pages[selectedIndex],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          
            leading: Builder(builder: (context) => 
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: IconButton(
                icon: const Icon(Icons.menu ,
                color: Colors.black,) ,
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },),
            ),)
          ),
          drawer: Drawer(
            backgroundColor:Colors.grey[900],
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
              children: [
                // logo 
                DrawerHeader(child: 
                Image.asset('lib/images/nike.png',
                color: Colors.white,),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  // ignore: prefer_const_constructors
                  child: ListTile(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.home,
                    color: Colors.white,),
                    title:const Text('Home'
                    , style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ),


                
              ],
            ),

          
              ],
            )),
    );
  }
}
