import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/model/food.dart';
import 'package:sushi/model/shop.dart';
import 'package:sushi/pages/food_details.dart';
import 'package:sushi/theme/color.dart';

import '../components/food_title.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List foodMenu = [
    Food(
        name: 'Salmon sushi',
        price: '21.0',
        imagePath: 'lib/images/salmon.svg',
        rating: '8.5'),
    Food(
        name: 'Salmon sushi set',
        price: '21.0',
        imagePath: 'lib/images/salmon-set.svg',
        rating: '8.9')
  ];
  
  void navToFoodDetails (int idx) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=> FoodDetails(
          food: foodMenu[idx]
       ) 
      )
    );
  }
  @override
  Widget build(BuildContext context) {
   final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[900],
          elevation: 0,
          leading: const Icon(Icons.menu),
          title:  const Text(
            "Tokyo",
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/cart');
            }, icon: const Icon(Icons.shopping_cart))
          ],
          ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // prom banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // prom message
                    Text("Get 32% prom",
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 28, color: Colors.white)),

                    const SizedBox(height: 20),

                    // redeem button
                    CustomButton(text: "Redeem", onTap: () {}),
                  ],
                ),
                SvgPicture.asset('lib/images/sushi-rolls.svg', height: 100),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // search banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white)),
                      hintText: 'Search here...'
                    ),
            ),
          ),
          const SizedBox(height: 25),

          // menu list
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Food Menu',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18),
              )),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, idx) =>
                    FoodTitle(
                      food: foodMenu[idx],
                      onTap: ()=> navToFoodDetails(idx)
                    ),
            )
          ),
          const SizedBox(height: 20),

          // popular food
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             
              // name and price
              Row(
                children: [
                   // image
              SvgPicture.asset('lib/images/salmon_eggs.svg', height: 80),
              const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      'Salmon Eggs',
                      style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    //price
                    Text(
                      '\$21.00',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                )
              ]),

              // heart
              const Icon(Icons.favorite_outline, color: Colors.grey, size: 28)
            ]),
          )
        ],
      ),
    );
  }
}
