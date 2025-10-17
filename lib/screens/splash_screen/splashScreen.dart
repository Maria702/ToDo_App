import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen/home.dart';
import 'package:todo_app/utils/color_contraint.dart';
import 'package:todo_app/utils/font_contraint.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorContraint.primaryThemeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),

            Center(
              child: Text(
                "Manage your\nDaily TO DO ",

                style: TextStyle(
                  fontSize: FontContraint.splashTitle,
                  fontWeight: FontContraint.primaryThemeFontWeight,
                  color: ColorContraint.primaryFontColor,
                ),
              ),
            ),

            SizedBox(height: 20),

            Column(children: [Image.asset("assets/images/SplashScreen.png")]),

            SizedBox(height: 20),

            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 56,
                    height: 18,
                    decoration: BoxDecoration(
                      color: ColorContraint.createButton,

                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 56,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCD873),

                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 56,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCD873),

                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    "Without much worry just manage\nthings as easy as piece of cake",
                    style: TextStyle(fontSize: FontContraint.title),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Center(
              child: SizedBox(
                width: 232,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorContraint.createButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                  ),

                  child: Text(
                    "Create a note",
                    style: TextStyle(
                      fontWeight: FontContraint.primaryThemeFontWeight,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
