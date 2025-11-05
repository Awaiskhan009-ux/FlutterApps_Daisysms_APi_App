import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/onboarding_models.dart';
import 'package:flutter_application_2/views/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // 

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
      
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2); 
              });
            },
            children: [

           OnboardingModel.buildPage(
  
                image: 'assets/images/one.png',
                title: 'Free Calls',
                subtitle: 'Make HD calls anytime, anywhere',
              ),
              OnboardingModel.buildPage(
                image: 'assets/images/two.png',
                title: 'Free Messages',
                subtitle: 'Send unlimited messages to anyone',
              ),
              OnboardingModel.buildPage(
                image: 'assets/images/three.png',
                title: 'Stay Connected',
                subtitle: 'Connect with friends instantly',
              ),
            ],
          ),

          
          Positioned(
              bottom: 50,
              right: 20,
              left: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip Button
                TextButton(
                  onPressed: () => _controller.jumpToPage(2),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),

                // Dots Indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Colors.blue,
                  ),
                ),

                
                TextButton(
                  onPressed: () {
                    if (onLastPage) {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreenFirebase()));
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    onLastPage ? "Done" : "Next",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
