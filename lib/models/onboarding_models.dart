import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';



class OnboardingModel  {

    static Widget buildPage({ required String image, required String title, required String subtitle}){

    return Container(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(image,
            
            fit: BoxFit.contain,)),
             const SizedBox(height: 10),
          Text(title,style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          Text(subtitle,style: TextStyle(fontSize: 18,color: Colors.grey ), textAlign: TextAlign.center,),  const SizedBox(height: 120),
        ],
       ),
    );
  }
}