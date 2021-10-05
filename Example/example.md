
# 📝 Examples

```dart
import 'package:flutter/material.dart';
import 'package:smart_notification/smart_notification.dart';


class NotificationDemo extends StatefulWidget {
  const NotificationDemo({Key? key}) : super(key: key);

  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Center(
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ebutton(
                  text: "Notification | Basic ",
                  color: Colors.purple,
                  onClick: () {
                    AdvanceSnackBar(message: "Hello....").show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Basic 1",
                  color: Colors.purple,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message",
                            bgColor: Colors.blueAccent)
                        .show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Basic 2",
                  color: Colors.purple,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message",
                            bgColor: Colors.tealAccent,
                            textColor: Colors.red)
                        .show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Basic 3",
                  color: Colors.purple,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message",
                            bgColor: Colors.blueAccent,
                            textColor: Colors.white,
                            isFixed: false)
                        .show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Advance 1",
                  color: Colors.redAccent,
                  onClick: () {
                    AdvanceSnackBar(
                      message: "Notification Message",
                      mode: "ADVANCE",
                    ).show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Advance 2",
                  color: Colors.redAccent,
                  onClick: () {
                    AdvanceSnackBar(
                      message: "Notification Message",
                      mode: "ADVANCE",
                      duration: Duration(seconds: 5),
                      bgColor: Colors.red,
                      textColor: Colors.black,
                      iconColor: Colors.black,
                    ).show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Advance 3",
                  color: Colors.redAccent,
                  onClick: () {
                    AdvanceSnackBar(
                      message: "Notification Message",
                      mode: "ADVANCE",
                      duration: Duration(seconds: 5),
                      bgColor: Colors.red,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      textSize: 22,
                      isIcon: true,
                    ).show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Advance 4",
                  color: Colors.redAccent,
                  onClick: () {
                    AdvanceSnackBar(
                      message: "Notification Message",
                      mode: "ADVANCE",
                      duration: Duration(seconds: 5),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      type: "ERROR",
                      textSize: 20,
                      isIcon: true,
                      iconPosition: "RIGHT", // it shold be after text
                    ).show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Advance 5",
                  color: Colors.redAccent,
                  onClick: () {
                    AdvanceSnackBar(
                      message: "Notification Message",
                      mode: "ADVANCE",
                      duration: Duration(seconds: 5),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      type: "ERROR",
                      textSize: 20,
                      isIcon: true,
                      closeIconPosition: "LEFT",
                      iconPosition: "RIGHT", // it shold be after text
                    ).show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Modern 1",
                  color: Colors.brown,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message", mode: "MODERN")
                        .show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Modern 2",
                  color: Colors.brown,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message",
                            mode: "MODERN",
                            type: "WARNING")
                        .show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Modern 3",
                  color: Colors.brown,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message",
                            mode: "MODERN",
                            type: "ERROR",
                            isIcon: true)
                        .show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Modern 4",
                  color: Colors.brown,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message content",
                            mode: "MODERN",
                            type: "ERROR",
                            tittle: "Tittle message",
                            isIcon: true)
                        .show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Modern 5",
                  color: Colors.brown,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message ",
                            mode: "MODERN",
                            type: "PRIMARY",
                            tittle: "Tittle message",
                            iconPosition: "RIGHT",
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Icon(
                                Icons.all_inbox,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                            isIcon: true)
                        .show(context);
                  },
                ),
                Ebutton(
                  text: "Notification | Modern 6",
                  color: Colors.brown,
                  onClick: () {
                    AdvanceSnackBar(
                            message: "Notification Message ",
                            mode: "ADVANCE",
                            type: "PRIMARY",
                            tittle: "Tittle message",
                            iconPosition: "RIGHT",
                            dividerColor: Colors.red,
                            onClick: () {
                              print("Hello");
                            },
                            isIcon: true)
                        .show(context);
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}


/// Ebutton is a custom ElevatedButton widget.
class Ebutton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onClick;

  const Ebutton({
    @required this.text = "",
    this.color = Colors.blueAccent,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick!.call();
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color, //
      ),
    );
  }
}


```