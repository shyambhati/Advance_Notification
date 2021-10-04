part of advance_notification;

class AdvanceSnackBar {
  final String tittle;
  final String message;

  final Duration duration;
  final TextAlign textAlign;

  final bool isFixed;
  final String type;

  final String mode;
  final FontWeight fontWeight;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  final Color deviderColor;
  final double tittleSize;
  final double textSize;
  final bool isIcon;
  final bool isDevider;
  final bool isClosable;
  final bool isChildLeft;

  final double iconSize;
  final String iconPosition;
  final String closeIconPosition;
  final VoidCallback? onClick;
  final Widget? icon;
  final Widget? child;
  final double borderRadius;
  final double mHeight;

  const AdvanceSnackBar(
      {@required this.message = "",
      this.tittle = "",
      this.bgColor = const Color(0xFF323232),
      this.textColor = const Color(0xFFffffff),
      this.iconColor = const Color(0xFFffffff),
      this.deviderColor = Colors.white70,
      this.tittleSize = 18,
      this.textSize = 16,
      this.iconSize = 24.0,
      this.fontWeight = FontWeight.w500,
      this.textAlign = TextAlign.left,
      this.duration = const Duration(seconds: 4),
      this.isIcon = false,
      this.isFixed = true,
      this.isClosable = true,
      this.isDevider = true,
      this.isChildLeft = true,
      this.type = "SUCCESS",
      this.mode = "BASIC",
      this.iconPosition = "NORMAL",
      this.closeIconPosition = "NORMAL",
      this.onClick,
      this.icon,
      this.child,
      this.borderRadius = 10,
      this.mHeight = 40});

  show(
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            behavior: mode == "BASIC"
                ? (isFixed ? SnackBarBehavior.fixed : SnackBarBehavior.floating)
                : SnackBarBehavior.fixed,
            padding: mode != "BASIC" ? new EdgeInsets.all(0) : null,
            duration: duration,
            backgroundColor: mode != "BASIC" ? Colors.transparent : bgColor,
            content: __genrateBar(context),
            elevation: 0,
          ),
        )
        .closed
        .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
  }

  Widget __genrateBar(context) {
    return mode != "BASIC"
        ? Container(
            margin: new EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(mode == "ADVANCE" ? borderRadius : 0)),
              child: Container(
                decoration: BoxDecoration(
                  border: mode == "MODERN"
                      ? Border(
                          left: BorderSide(
                            width: 10.0,
                            color:
                                __generateBgColor(), //__getColor("SUCCESS", "dark"),
                          ),
                        )
                      : null,
                  color: mode == "MODERN"
                      ? lighten(__generateBgColor(), .2)
                      : __generateBgColor(),
                ),
                width: MediaQuery.of(context).size.width,
                padding: new EdgeInsets.all(5),
                height: mHeight > 40
                    ? mHeight
                    : tittle == ""
                        ? 40.0
                        : (tittleSize + textSize + 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: closeIconPosition == "LEFT"
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              textDirection: iconPosition == "RIGHT"
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              mainAxisAlignment: __generatemainAxisAlignment(),
                              children: [
                                isIcon
                                    ? Container(
                                        padding: new EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: __genrateIcon(),
                                      )
                                    : SizedBox.shrink(),
                                __genrateText(),
                              ],
                            ),
                          ),
                        ),
                        (isClosable || child != null)
                            ? Row(
                                textDirection: isChildLeft
                                    ? __generateRtl(true)
                                    : __generateRtl(false),
                                // isChildLeft?__generateRtl(true):,
                                children: [
                                  isClosable
                                      ? GestureDetector(
                                          onTap: () {
                                            onClick == null
                                                ? ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar()
                                                : onClick!.call();
                                          },
                                          child: Container(
                                            margin: new EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: __closeIcon(),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  child != null
                                      ? Container(child: child)
                                      : SizedBox.shrink(),
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : __genrateText();
  }

  __genrateIcon() {
    var icon = Icons.check_circle;

    if (type == "ERROR")
      icon = Icons.error;
    else if (type == "WARNING")
      icon = Icons.warning_rounded;
    else if (type == "INFO") icon = Icons.info;
    return Icon(
      icon,
      color: mode == "MODERN"
          ? __generateBgColor()
          : __generateColor(1.0, iconColor),
      size: tittle == "" ? iconSize : iconSize + 10,
    );
  }

  __closeIcon() {
    return icon != null
        ? icon
        : Icon(
            Icons.close_outlined,
            color: __generateColor(1.0, iconColor),
            size: tittle == "" ? iconSize : iconSize + 5,
          );
  }

  __generateBgColor() {
    // https://backstrap.net/colors.html
    String c = Color(0xFF323232).toString();
    if (bgColor.toString() != c)
      return bgColor;
    else if (type == "DARK")
      c = "161c2d";
    else if (type == "ERROR")
      c = "df4759";
    else if (type == "WARNING")
      c = "ffc107";
    else if (type == "INFO")
      c = "467fd0";
    else if (type == "PRIMARY")
      c = "7c69ef";
    else if (type == "SECONDARY")
      c = "d9e2ef";
    else if (type == "LIGHT")
      c = "f1f4f8";
    else if (type == "SUCCESS")
      c = "42ba96";
    else
      c = "ffffff";
    return Color(int.parse("0xff${c}"));
  }

  __generateColor(var opacity, var color) {
    if (type == "DARK") {
      return Colors.white.withOpacity(opacity);
    } else if (type == "SECONDARY" ||
        type == "LIGHT" ||
        mode == "MODERN" ||
        type != "DARK") {
      return Colors.black.withOpacity(opacity);
    } else {
      return color.withOpacity(opacity);
    }
  }

  __genrateText() {
    return (mode == "BASIC" || tittle == "")
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: __getText(message, textSize, FontWeight.normal, 1.0),
          )
        : Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                __getText(tittle, tittleSize, FontWeight.bold, 1.0),
                isDevider
                    ? Divider(
                        color: mode == "MODERN"
                            ? lighten(Color(int.parse("0xff111111")), .1)
                            : deviderColor,
                        height: 2,
                        thickness: 1.5,
                      )
                    : SizedBox.shrink(),
                __getText(message, textSize, FontWeight.normal, 0.7),
              ],
            ),
          );
  }

  __getText(String text, double size, var fontWeight, var opacity) {
    return Text(
      text,
      style: TextStyle(
          color: mode == "MODERN"
              ? __generateColor(opacity, textColor)
              : textColor,
          fontWeight: fontWeight,
          fontSize: size),
    );
  }

  __generatemainAxisAlignment() {
    if (isClosable || iconPosition == "NORMAL")
      return MainAxisAlignment.start;
    else if (iconPosition == "LEFT" || iconPosition == "RIGHT")
      return MainAxisAlignment.spaceBetween;
    else if (iconPosition == "CENTER") return MainAxisAlignment.center;
  }

  __generateRtl(var type) {
    return type ? TextDirection.rtl : TextDirection.ltr;
  }

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
