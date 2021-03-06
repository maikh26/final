import 'package:blogapp/grouth/constants.dart';
import 'package:blogapp/grouth/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.weightRatio,
      @required this.heightRatio,
      @required this.averWeight,
      @required this.averHeight,
      @required this.month,
      @required this.gender,
      @required this.height,
      @required this.weight});

  final String weightRatio;
  final String heightRatio;
  final String averWeight;
  final String averHeight;
  final int month;
  final String gender;
  final double weight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Infant Growth and Development ',
            style: TextStyle(color: Color(0xFF4C4F5E)),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kInactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Measurement result',
                      style: kResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
'My child \n weight is $weight kg top $weightRatio%.\n height is ${height.toStringAsFixed(1)}cm top $heightRatio%. ',            
          style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
'$month Months $gender The average weight of a child \n\n is $averWeight kg. \nThe average height is $averHeight cm.',                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
                color: kBottomContainerColor,
                child: Center(
                    child: Text(
                  'recalculate',
                  style: kLabelTextStyle.copyWith(color: Colors.black),
                )),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            )
          ],
        ));
  }
}
