import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visibleHead = false;
  bool visibleBody = false;
  bool visibleRhand = false;
  bool visibleLhand = false;
  bool visibleRleg = false;
  bool visibleLleg = false;
  bool visibleF = false;
  bool visibleL = false;
  bool visibleU = false;
  bool visibleT = false;
  bool visibleE = false;
  bool visibleR = false;
  int count = 0;
  int flag = 0;

  void reset() {
    visibleHead = false;
    visibleBody = false;
    visibleRhand = false;
    visibleLhand = false;
    visibleRleg = false;
    visibleLleg = false;
    visibleF = false;
    visibleL = false;
    visibleU = false;
    visibleT = false;
    visibleE = false;
    visibleR = false;
  }

  void display(String text) {
    setState(() {
      if (count == 5) {
        Alert(
            context: context,
            type: AlertType.error,
            title: 'Game Over!!!!',
            desc: 'You Loss...!',
            buttons: [
              DialogButton(
                  child: Text('Play Again'),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage())))
            ]).show();
        reset();
      } else if (flag == 5) {
        Alert(
            context: context,
            type: AlertType.error,
            title: 'Game Over',
            desc: 'You Win !!Congratulations!!',
            buttons: [
              DialogButton(
                  child: Text('Play Again'),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage())))
            ]).show();
        reset();
      } else {
        if (text == 'F') {
          visibleF = true;
          flag++;
        } else if (text == 'L') {
          visibleL = true;
          flag++;
        } else if (text == 'U') {
          visibleU = true;
          flag++;
        } else if (text == 'T') {
          visibleT = true;
          flag++;
        } else if (text == 'E') {
          visibleE = true;
          flag++;
        } else if (text == 'R') {
          visibleR = true;
          flag++;
        } else {
          count++;
          if (count == 1) {
            visibleHead = true;
          } else if (count == 2) {
            visibleBody = true;
          } else if (count == 3) {
            visibleRhand = true;
          } else if (count == 4) {
            visibleLhand = true;
          } else if (count == 5) {
            visibleRleg = true;
          } else if (count == 6) {
            visibleLleg = true;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Image(image: AssetImage('images/hang.png')),
                  Visibility(
                      visible: visibleHead,
                      child: Image(image: AssetImage('images/head.png'))),
                  Visibility(
                      visible: visibleBody,
                      child: Image(image: AssetImage('images/body.png'))),
                  Visibility(
                      visible: visibleRhand,
                      child: Image(image: AssetImage('images/ra.png'))),
                  Visibility(
                      visible: visibleLhand,
                      child: Image(image: AssetImage('images/la.png'))),
                  Visibility(
                      visible: visibleRleg,
                      child: Image(image: AssetImage('images/rl.png'))),
                  Visibility(
                      visible: visibleLleg,
                      child: Image(image: AssetImage('images/ll.png'))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContainer('F', Colors.white, visibleF),
                    buildContainer('L', Colors.white, visibleL),
                    buildContainer('U', Colors.white, visibleU),
                    buildContainer('T', Colors.white, visibleT),
                    buildContainer('T', Colors.white, visibleT),
                    buildContainer('E', Colors.white, visibleE),
                    buildContainer('R', Colors.white, visibleR),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                  crossAxisCount: 6,
                  children: [
                    buildContainer2('A', Colors.white),
                    buildContainer2('B', Colors.white),
                    buildContainer2('C', Colors.white),
                    buildContainer2('D', Colors.white),
                    buildContainer2('E', Colors.white),
                    buildContainer2('F', Colors.white),
                    buildContainer2('G', Colors.white),
                    buildContainer2('H', Colors.white),
                    buildContainer2('I', Colors.white),
                    buildContainer2('J', Colors.white),
                    buildContainer2('K', Colors.white),
                    buildContainer2('L', Colors.white),
                    buildContainer2('M', Colors.white),
                    buildContainer2('N', Colors.white),
                    buildContainer2('O', Colors.white),
                    buildContainer2('P', Colors.white),
                    buildContainer2('Q', Colors.white),
                    buildContainer2('R', Colors.white),
                    buildContainer2('S', Colors.white),
                    buildContainer2('T', Colors.white),
                    buildContainer2('U', Colors.white),
                    buildContainer2('V', Colors.white),
                    buildContainer2('W', Colors.white),
                    buildContainer2('X', Colors.white),
                    buildContainer2('Y', Colors.white),
                    buildContainer2('Z', Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildContainer2(String text, Color color) {
    return GestureDetector(
      onTap: () {
        display(text);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }

  Container buildContainer(String text, Color color, bool visibility) {
    return Container(
      width: 45,
      height: 45,
      color: color,
      child: Center(child: Visibility(visible: visibility, child: Text(text))),
    );
  }
}
