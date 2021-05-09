import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color1 = Colors.red;
  Color color2 = Colors.blue;
  Color targetColor;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dragable Practice"),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Draggable<Color>(
                  data: color1,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color1,
                      shape:
                          StadiumBorder(), //if the width and height is the same its gonna make it circle, but iv not its gonna make oval like stadium
                      elevation: 3, //to make an effect shadow
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    //this is what left behind when we drag our widget, its left at the start place
                    width: 50,
                    height: 50,
                    child: Material(
                      color: Colors.deepOrange,
                      shape:
                          StadiumBorder(), //if the width and height is the same its gonna make it circle, but iv not its gonna make oval like stadium
                      elevation: 0, //to make an effect shadow
                    ),
                  ),
                  feedback: SizedBox(
                    //feedback is when we drag the widget it turns the draggable colors, so we know the draggable is works
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color1.withOpacity(
                          0.7), //with opacity is for making  the color transparant
                      shape:
                          StadiumBorder(), //if the width and height is the same its gonna make it circle, but iv not its gonna make oval like stadium
                      elevation: 3, //to make an effect shadow
                    ),
                  ),
                ),
                Draggable<Color>( //double the draggable and change all the color1 to color 2
                  data: color2,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color2,
                      shape:
                          StadiumBorder(), //if the width and height is the same its gonna make it circle, but iv not its gonna make oval like stadium
                      elevation: 3, //to make an effect shadow
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    //this is what left behind when we drag our widget, its left at the start place
                    width: 50,
                    height: 50,
                    child: Material(
                      color: Colors.cyan,
                      shape:
                          StadiumBorder(), //if the width and height is the same its gonna make it circle, but iv not its gonna make oval like stadium
                      elevation: 0, //to make an effect shadow
                    ),
                  ),
                  feedback: SizedBox(
                    //feedback is when we drag the widget it turns the draggable colors, so we know the draggable is works
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color2.withOpacity(
                          0.7), //with opacity is for making  the color transparant
                      shape:
                          StadiumBorder(), //if the width and height is the same its gonna make it circle, but iv not its gonna make oval like stadium
                      elevation: 3, //to make an effect shadow
                    ),
                  ),
                ), //Sizedbox is to wrap a widget that doesnt have width and height
              ],
            ),
            DragTarget<Color>(
              onWillAccept: (value) => true, //this is for when we want to take it or not, i put true so its always true when we want to put
              onAccept: (value) {isAccepted = true; targetColor = value;}, //this is when its accepted it turns the color to what we drag
              builder: (context, candidates, rejected) {
                return (isAccepted) ? SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: targetColor, //this is when it is accepted it turns the color to what we have  drag in, we use targetcolor=value
                      shape: StadiumBorder(), //if the width and height is the same its gonna make it circle, but iv not its gonna make oval like stadium
                    ),
                ):
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: Colors.black26,  //target dragable color
                      shape: StadiumBorder(), //if the width and height is the same its gonna make it circle, but iv not its gonna make oval like stadium
                    ) ,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
