import 'package:algoriza_task1/screens/login_screen.dart';
import 'package:algoriza_task1/screens/register_screen.dart';
import 'package:algoriza_task1/widgets/material_button.dart';
import 'package:algoriza_task1/widgets/my_caption.dart';

import 'package:algoriza_task1/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboarding1.png',
      title: 'Buy Any Clothes From Your Favorite Shop',
      body:
          'we are constantly adding your Favorite restaurant throughout the territory and arount your area carefully selected',
    ),
    BoardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Buy Any Clothes From Your Favorite Shop',
      body:
          'we are constantly adding your Favorite restaurant throughout the territory and arount your area carefully selected',
    ),
    BoardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'Buy Any Clothes From Your Favorite Shop',
      body:
          'we are constantly adding your Favorite restaurant throughout the territory and arount your area carefully selected',
    ),
  ];

  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyTextButton(
                  textButton: 'Skip',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const LoginScreen(),
                      ),
                          (route) => false,
                    );
                  },
                  color: Colors.black,
                  fontSize: 20,
                ),
              ],
            ),
            Expanded(child: Image.asset('assets/images/logo.png',),flex: 1,),
            Expanded(
              flex: 2,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) => buildOnBoarding(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 10,),
            SmoothPageIndicator(
              controller: boardController,
              count:  boarding.length,
              axisDirection: Axis.horizontal,
              effect:  const ExpandingDotsEffect(
                  spacing:  4,
                  radius:  10,
                  dotWidth:  15,
                  dotHeight:  5.0,
                  activeDotColor:  Colors.blue
              ),
            ),
            const SizedBox(height: 10,),
            MyMaterialButton(onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(
                  builder: (
                      BuildContext context) => const LoginScreen(),
                ),
                (route) => false,
              );
            }, text: 'Get Started'),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t has any account ?'),
                MyTextButton(textButton: 'Sign Up', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (
                          BuildContext context) => const RegisterScreen(),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),

      ),
    );
  }

  Widget buildOnBoarding(BoardingModel model) => Column(
        children: [
          Expanded(
            child: Image.asset(
              model.image,
            ),
          ),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          MyCaption(
            text: model.body,
            fontSize: 16,
          ),
        ],
      );
}
