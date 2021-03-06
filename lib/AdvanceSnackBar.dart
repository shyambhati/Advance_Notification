part of advance_notification;

class AdvanceSnackBar {
  final String tittle;
  final String message;

  final Duration duration;
  final TextAlign textAlign;

  final bool isFixed;
  final sType type;

  final Mode mode;
  final FontWeight fontWeight;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  final Color dividerColor;
  final double tittleSize;
  final double textSize;
  final bool isIcon;
  final bool isDivider;
  final bool isClosable;
  final bool isChildLeft;

  final double iconSize;
  // final String iconPosition;
  final IconPosition iconPosition;
  final IconPosition closeIconPosition;
  final VoidCallback? onClick;
  final Widget? icon;
  final Widget? child;
  final double borderRadius;
  final double mHeight;
  final double margin;

  const AdvanceSnackBar({
    this.message = "Advance Snackbar",
    this.tittle = "",
    this.bgColor = const Color(0xFF323232),
    this.textColor = const Color(0xFFffffff),
    this.iconColor = const Color(0xFFffffff),
    this.dividerColor = Colors.white70,
    this.tittleSize = 18,
    this.textSize = 16,
    this.iconSize = 24.0,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.left,
    this.duration = const Duration(seconds: 4),
    this.isIcon = false,
    this.isFixed = true,
    this.isClosable = true,
    this.isDivider = true,
    this.isChildLeft = true,
    this.type = sType.SUCCESS,
    this.mode = Mode.BASIC,
    this.iconPosition = IconPosition.NORMAL,
    this.closeIconPosition = IconPosition.NORMAL,
    this.onClick,
    this.icon,
    this.child,
    this.borderRadius = 10,
    this.mHeight = 40,
    this.margin = 20,
  });

  show(
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            behavior: mode == Mode.BASIC
                ? (isFixed ? SnackBarBehavior.fixed : SnackBarBehavior.floating)
                : SnackBarBehavior.floating,
            padding: mode != Mode.BASIC ? new EdgeInsets.all(0) : null,
            duration: duration,
            backgroundColor: mode != Mode.BASIC ? Colors.transparent : bgColor,
            content: __genrateBar(context),
            elevation: 0,
          ),
        )
        .closed
        .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
  }

  Widget __genrateBar(context) {
    return mode != Mode.BASIC
        ? Container(
            margin: new EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(mode == Mode.ADVANCE ? borderRadius : 0)),
              child: Container(
                decoration: BoxDecoration(
                  border: mode == Mode.MODERN
                      ? Border(
                          left: BorderSide(
                            width: 10.0,
                            color:
                                __generateBgColor(), //__getColor("SUCCESS", "dark"),
                          ),
                        )
                      : null,
                  color: mode == Mode.MODERN
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
                      textDirection: closeIconPosition == IconPosition.LEFT
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              textDirection: iconPosition == IconPosition.RIGHT
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

    if (type == sType.ERROR)
      icon = Icons.error;
    else if (type == sType.WARNING)
      icon = Icons.warning_rounded;
    else if (type == sType.INFO) icon = Icons.info;
    return Icon(
      icon,
      color: mode == Mode.MODERN
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
    String c = Color(0xFF323232).toString();
    if (bgColor.toString() != c)
      return bgColor;
    else if (type == sType.DARK)
      c = "161c2d";
    else if (type == sType.ERROR)
      c = "df4759";
    else if (type == sType.WARNING)
      c = "ffc107";
    else if (type == sType.INFO)
      c = "467fd0";
    else if (type == sType.PRIMARY)
      c = "7c69ef";
    else if (type == sType.SECONDARY)
      c = "d9e2ef";
    else if (type == sType.LIGHT)
      c = "f1f4f8";
    else if (type == sType.SUCCESS)
      c = "42ba96";
    else
      c = "ffffff";
    return Color(int.parse("0xff$c"));
  }

  __generateColor(var opacity, var color) {
    if (type == sType.DARK) {
      return Colors.white.withOpacity(opacity);
    } else if (type == sType.SECONDARY ||
        type == sType.LIGHT ||
        mode == Mode.MODERN ||
        type != sType.DARK) {
      return Colors.black.withOpacity(opacity);
    } else {
      return color.withOpacity(opacity);
    }
  }

  __genrateText() {
    return (mode == Mode.BASIC || tittle == "")
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
                isDivider
                    ? Divider(
                        color: mode == Mode.MODERN
                            ? lighten(Color(int.parse("0xff111111")), .1)
                            : dividerColor,
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
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: mode == Mode.MODERN
              ? __generateColor(opacity, textColor)
              : textColor,
          fontWeight: fontWeight,
          fontSize: size),
    );
  }

  __generatemainAxisAlignment() {
    if (isClosable || iconPosition == IconPosition.NORMAL)
      return MainAxisAlignment.start;
    else if (iconPosition == IconPosition.LEFT ||
        iconPosition == IconPosition.RIGHT)
      return MainAxisAlignment.spaceBetween;
    else if (iconPosition == IconPosition.CENTER)
      return MainAxisAlignment.center;
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

enum IconPosition { NORMAL, LEFT, RIGHT, CENTER }
enum sType { DARK, ERROR, WARNING, INFO, PRIMARY, SECONDARY, LIGHT, SUCCESS }
enum Mode { BASIC, MODERN, ADVANCE }
