import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //add a calendar here fit to container height and width
          // Padding(padding:const EdgeInsets.symmetric(horizontal:15,vertical: 15),
          // child: Container(
          //   color: Styles.primaryRedColor,
          //   height: 110,
          //   child: Column(
          //     children: [

          //     ],
          //   ),
          // )
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 15,
              ),
              child: Text(
                "View Report by Time\n   Select Time here",
                style: TextStyle(
                    color: Styles.primaryRedColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 9,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    //on click show calendar
                    
                  },
                  // Padding(padding:const EdgeInsets.symmetric(horizontal:15,vertical: 15),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 0.9,color: Styles.primaryRedColor)
                    ),
                    child: Center(
                      child: Text(
                        "Start date",
                        style: TextStyle(color: Styles.primaryRedColor,fontSize: 16),
                      ),
                    ),
                  )),
                 GestureDetector(
                  onTap: () {
                    //on click show calendar
                    
                  },
                  // Padding(padding:const EdgeInsets.symmetric(horizontal:15,vertical: 15),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Styles.primaryRedColor,
                    ),
                    child: Center(
                      child: Text(
                        "End Date",
                        style: TextStyle(color: Styles.primaryWhiteColor,fontSize: 16),
                      ),
                    ),
                  )),
            ],
          ),

           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // add the two category action chip here
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Styles.primaryRedColor,
                  )
                ),
              
            ],
          )
        ],
      ),
    ));
  }
}
