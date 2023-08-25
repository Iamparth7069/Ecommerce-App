import 'package:flutter/material.dart';
import 'package:shoppio_app/preferences/pref_manager.dart';
import 'package:shoppio_app/rooutes/approutes.dart';
import 'package:shoppio_app/screens/onboarding/component/indicator.dart';
import 'package:shoppio_app/screens/onboarding/component/side_view.dart';

import '../../../model/items.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> listitems = [];
  int currentIndex = 0;
  final _pageController = PageController();
  @override
  void initState() {
    super.initState();
    listitems.add(
      Item(title: 'select  Items', desc:  'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.', image: 'assets/images/onboarding.jpg'),
    );
    listitems.add(
      Item(
          title: 'Purchase',
          desc:
          'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
          image: 'assets/images/onboarding.jpg'),
    );
    listitems.add(
      Item(
          title: 'Delivery',
          desc:
          'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
          image: 'assets/images/onboarding.jpg'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Scaffold(
        body: PageView.builder(onPageChanged: (value) {
          setState(() {
            currentIndex = value!;
            // print("The Current Index $value");
          });
        },
          itemCount: listitems.length,controller: _pageController,itemBuilder: (context, index) {
          return Sliderview(listitems[index]);
        },),
        bottomSheet: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                for (int i = 0; i < listitems.length; i++)
                  if (i == currentIndex)
                    getindicator(true)
                  else
                    getindicator(false)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                    if(currentIndex == listitems.length -1){
                      PrefManager.updateOnboardingStatus(true);
                      Navigator.pushReplacementNamed(context,AppRoute.loginScreen);
                    }else{
                      currentIndex++;
                      _pageController.animateToPage(currentIndex, duration: Duration(milliseconds: 300), curve: Curves.linear);
                    }
                },
                child: Text(currentIndex == listitems.length -1 ?"Finish" : "Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
