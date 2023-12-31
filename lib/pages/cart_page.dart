import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/model/food.dart';
import 'package:sushi/model/shop.dart';
import 'package:sushi/theme/color.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  
  void removeFromCart (Food food, BuildContext context) {

    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: primaryColor,
              appBar: AppBar(
                title: const Text(
                  'My Cart',
                ),
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      if (index >= value.cart.length) {
                        // 確保索引值在有效範圍內
                        return null; // 或其他的處理方式
                      }
                      final Food food = value.cart[index];
                      final String foodPrice = food.price;
                      return Container(
                        decoration: BoxDecoration(color: secondaryColor,borderRadius: BorderRadius.circular(8)),
                        margin: const EdgeInsets.only(left: 20,top: 20,right: 20),
                        child: ListTile(
                          title: Text(food.name,
                          style: TextStyle(color:   Colors.white, fontWeight:  FontWeight.bold)
                          ),
                          subtitle: Text(foodPrice, style: TextStyle(color:Colors.grey[200]),),
                          trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.white,),onPressed: ()=> removeFromCart(food, context)),
                        ),
                      );
                    }),
                  ),
                   // Pay now button
                   Padding(
                     padding: const EdgeInsets.all(25.0),
                     child: CustomButton(text: "Pay Now", onTap: (){}),
                   )
                ],
              ),
            ));
  }
}
