import 'package:atletasunidos/Views/CustomUser/AddResults.dart';
import 'package:atletasunidos/Widgets/ButtonSelector.dart';
import 'package:atletasunidos/Widgets/CharData.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataPage extends StatefulWidget {
  bool selectOne = false;
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackPrimary,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: ButtonSelector(
                            iconD: Icons.person,
                            colorB: widget.selectOne ? redPrimary : blackPrimary,
                            onCall: (){
                              setState(() {
                                widget.selectOne = true;
                              });
                            },  
                          )),
                    SizedBox(
                      width: 10,
                    ),
                    RotatedBox(
                        quarterTurns: 3,
                        child: ButtonSelector(
                          iconD: Icons.people,
                          colorB: widget.selectOne ? blackPrimary : redPrimary,
                          onCall: (){
                            setState(() {
                                widget.selectOne = false;
                              });
                          },
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    RotatedBox(
                        quarterTurns: 3,
                        child: ButtonSelector(
                          iconD: Icons.add,
                          colorB: redPrimary,
                          onCall: (){
                              Get.to(AddResult(),
                                transition: Transition.downToUp,
                                curve: Interval(0.65, 1.0),
                                duration: Duration(milliseconds: 900)
                              );
                          },
                        ))
                  ],
                ),
              ),
              RotatedBox(
                  quarterTurns: 3,
                  child: ChartData(
                    titleChar: 'IRG',
                    titleChar2: 'IRK',
                    titleChar3: 'IRR',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
