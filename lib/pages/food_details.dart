import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/model/food.dart';
import 'package:sushi/model/shop.dart';
import 'package:sushi/theme/color.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantityCount = 0;

  void decrementQuantity() {
    if (quantityCount <= 0) return;
    setState(() {
      quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount <= 0) return;

    final shop = context.read<Shop>();

    shop.addToCart(widget.food, quantityCount);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              backgroundColor: primaryColor,
              content: const Text(
                "Successfully added to cart",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      // pop once to remove dialog box
                      Navigator.pop(context);

                      // pop again to go previous screen
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.done,color: Colors.white))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(children: [
        // listView of details
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            children: [
              // image
              SvgPicture.asset("lib/images/salmon_eggs.svg", height: 200),

              const SizedBox(height: 25),
              // rating
              Row(
                children: [
                  // start icon
                  Icon(Icons.star, color: Colors.yellow[800]),

                  const SizedBox(width: 20),

                  // rating number
                  Text(
                    widget.food.rating,
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 10),

              // food name
              Text(
                widget.food.name,
                style: GoogleFonts.dmSerifDisplay(fontSize: 28),
              ),

              const SizedBox(height: 25),

              // description
              Text("Description",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),

              const SizedBox(height: 10),

              Text(
                "Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.",
                style: TextStyle(
                    color: Colors.grey[600], fontSize: 24, height: 1.8),
              )
            ],
          ),
        )),

        // price + quantity + add to cart button
        Container(
          color: primaryColor,
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            // price + quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // price
                Text(
                  "\$" + widget.food.price,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),

                // quantity
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 187, 84, 77),
                          shape: BoxShape.circle),
                      child: IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white),
                          onPressed: decrementQuantity),
                    ),
                    SizedBox(
                        width: 40,
                        child: Center(
                            child: Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 187, 84, 77),
                          shape: BoxShape.circle),
                      child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: incrementQuantity),
                    )
                  ],
                )
              ],
            ),

            const SizedBox(height: 25),
            // add to cart button
            CustomButton(text: "Add to Cart", onTap: addToCart),
          ]),
        )
      ]),
    );
  }
}
