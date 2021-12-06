import 'package:flutter/material.dart';
import 'package:testpro/constant/constant.dart';
import 'package:testpro/widget/left_side_bar.dart';
import 'package:testpro/widget/right_side_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _widthcontroller = TextEditingController();
  double _bmiResult=0;
  String _textResult="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "بژمێرەی BMI",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Rabar',
            color: Colors.amber,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightcontroller,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w100,
                      color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "بەرزی",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        color: Colors.white.withOpacity(.8),
                        fontFamily: 'Rabar'
                      )

                    ),
                  ),
                ),
                Container(

                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _widthcontroller,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w100,
                      color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'کێش',
                      hintStyle: TextStyle(
                        fontFamily: 'Rabar',
                        color: Colors.white.withOpacity(.8),

                      )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _h=double.parse(_heightcontroller.text);
                double _w=double.parse(_widthcontroller.text);
                setState(() {
                  _h=_h/100;
                  _bmiResult=_w / (_h*_h);
                  if(_bmiResult>25){
                    _textResult="کێشت زۆرە هەوڵ بدە کێشت دا ببەزێنە";
                  }else if(_bmiResult >=18.5 && _bmiResult <=25){
                    _textResult="کێشت ئاساییە";

                  }else{
                    _textResult="کێشت کەمە هەوڵبدە کێشت سەربخەیت";
                  }
                });
              },
              child: Container(
                child: Text('هەژمارکردن',textAlign: TextAlign.center,style: TextStyle(
                  fontFamily: 'Rabar',
                  fontSize: 42,
                  fontWeight: FontWeight.w100,
                  color: accentHexColor,
                ),),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),textAlign: TextAlign.center,style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.w100,
                color: accentHexColor,
                fontFamily: 'Rabar'
              ),),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
              child: Text(_textResult,textAlign: TextAlign.center,style: TextStyle(
                fontFamily: 'Rabar',
                fontWeight: FontWeight.w100,
                fontSize: 42,
                color: accentHexColor,
              ),),
            ),),
            SizedBox(height: 40,),
            LeftBar(barWidth: 40),
            SizedBox(height: 10,),
            LeftBar(barWidth: 60),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40),
            SizedBox(height: 10,),
            RightBar(barWidth: 20),
            SizedBox(height: 10,),
            RightBar(barWidth: 40),
            SizedBox(height: 10,),
            RightBar(barWidth: 60),
            SizedBox(height: 10,),
            RightBar(barWidth: 20),
          ],
        ),
      ),
    );
  }
}
