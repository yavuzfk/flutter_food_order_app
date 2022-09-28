//*********************************************************************************************
//This widget is not developed by yavuzfk !!!
//To reach the developer https://github.com/samarthagarwal
//*********************************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/views/main_page/main_page.dart';
class SimpleRoundIconButton extends StatelessWidget {
  final Color backgroundColor;
  final Text buttonText;
  final Icon icon;
  final Color? iconColor;
  final Alignment iconAlignment;
  final Function? onPressed;
  final String userName;
  SimpleRoundIconButton(
      {this.backgroundColor = Colors.redAccent,
        this.buttonText = const Text("REQUIRED TEXT"),
        this.icon = const Icon(Icons.email),
        this.iconColor,
        this.iconAlignment = Alignment.centerLeft,
        this.onPressed, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
                  overlayColor: MaterialStateProperty.all(backgroundColor),
                  backgroundColor:
                  MaterialStateProperty.all(backgroundColor),
                ),
                child:  Row(
                  children: <Widget>[
                    iconAlignment == Alignment.centerLeft
                        ?  Transform.translate(
                      offset: const Offset(-10.0, 0.0),
                      child:  Container(
                        padding: const EdgeInsets.all(2.0),
                        child: FlatButton(
                          shape:  RoundedRectangleBorder(
                              borderRadius:
                               BorderRadius.circular(28.0)),
                          splashColor: Colors.white,
                          color: Colors.white,
                          child: Icon(
                            icon.icon,
                            // color: iconColor == null
                            //     ? backgroundColor
                            //     : iconColor,
                          ),
                          onPressed: () => {

                          },
                        ),
                      ),
                    )
                        : Container(),
                    iconAlignment == Alignment.centerLeft
                        ? Container()
                        : Container(),
                     Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      child: buttonText,
                    ),
                    iconAlignment == Alignment.centerRight
                        ? Container()
                        : Container(),
                    iconAlignment == Alignment.centerRight
                        ?  Transform.translate(
                      offset: Offset(10.0, 0.0),
                      child:  Container(
                        padding:  EdgeInsets.all(5.0),
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                               BorderRadius.circular(28.0)),
                          splashColor: Colors.white,
                          color: Colors.white,
                          child: Icon(
                            icon.icon,
                            color: iconColor == null
                                ? backgroundColor
                                : iconColor,
                          ),
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MainPage(userName: userName),
                                ))
                          },
                        ),
                      ),
                    )
                        : Container()
                  ],
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MainPage(userName: userName),
                      ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}