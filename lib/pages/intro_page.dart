import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 71, 64),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            // shop name
            Text(
              "SUSHI MANN",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(height: 25),
            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: SvgPicture.asset(
                  'lib/images/salmon_eggs.svg',
                ),
              ),
            ),

            // title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
            ),

            const SizedBox(height: 10),

            // subtitle
            Text(
              "Feel the tast of the most popular Japanse food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[200],
                height: 2,
              ),
            ),

             const SizedBox(height: 10),

            // get started button
            CustomButton(text: "Get started", onTap: (){
              Navigator.pushNamed(context, '/menupage');
            },)

          ],
        ),
      ),
    );
  }
}
