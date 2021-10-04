# advance_notification

advance_notification is a Flutter package with Custom Snackabar.


## Development is continue

- There are **many new features planed** for Advance Notification.

## Getting Started

### Why Advance Notification

The Advance Notification provide light weight you can use Multiple design of Snackbar notification.
### Examples

Advance Notification have three mode in  Advance Notification Snackbar =>  BASIC,ADVANCE,MODERN.

### Basic Mode

You can use basic Snackbar with background color, text color, position

```dart
///For Basic mode you don't need to write mode
AdvanceSnackBar(message: "Hello...").show(context);
```

```dart
///Basic with Background color
 AdvanceSnackBar(message: "Notification Message", bgColor: Colors.blueAccent).show(context);
```


```dart
///Basic with background color or text color
AdvanceSnackBar(
                message: "Notification Message",
                bgColor: Colors.tealAccent,
                textColor: Colors.red).show(context);
```


```dart
///Basic with background color or text  or fixed position
AdvanceSnackBar(
                message: "Notification Message",
                bgColor: Colors.tealAccent,
                textColor: Colors.red,
                isFixed: false).show(context);
```

### Advance mode 

You can use Advance mode Snackbar with many features. it has close default close button.
you can override the close button event or color  and icon image. 

```dart
/// Advance mode :- Example 1
/// Advance mode have many 
 AdvanceSnackBar(
                message: "Notification Message",
                mode: "ADVANCE",).show(context);
```


```dart
///Advance mode :- Example 2
/// You can add your custom duration for hide notification. default duration is 4 seconds. We have multiple types in Advance mode like : PRIMARY,SECONDARY,LIGHT,DARK,SUCCESS,INFO,WARNING,ERROR default type is SUCCESS

AdvanceSnackBar(
                message: "Notification Message",
                mode: "ADVANCE",
                duration: Duration(seconds: 5),).show(context);
```

```dart
///Advance mode :- Example 3
/// Change bgColor , text color close iconColor 
AdvanceSnackBar(
                message: "Notification Message",
                mode: "ADVANCE",
                duration: Duration(seconds: 5),
                bgColor: Colors.red,
                textColor: Colors.black,
                iconColor: Colors.black,).show(context);
```


```dart
///Advance mode :- Example 4
// With this example you can change textSize or show notification icon
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

```


```dart
///Advance mode :- Example 5
/// Every type has owen icon you can show and hode with isIcon
AdvanceSnackBar(
                message: "Notification Message",
                mode: "ADVANCE",
                duration: Duration(seconds: 5),
                type: "ERROR",
                textSize: 20,
                isIcon: true,// it shold be after text
            ).show(context);
```


```dart
///Advance mode :- Example 6
///Change type icon position
AdvanceSnackBar(
                message: "Notification Message",
                mode: "ADVANCE",
                duration: Duration(seconds: 5),
                type: "ERROR",
                textSize: 20,
                isIcon: true,
                iconPosition: "RIGHT",
            ).show(context);
```


```dart
///Advance mode :- Example 7
/// You can also add tittle 
AdvanceSnackBar(
                message: "Notification Message",
                tittle: "Tittle message",
                mode: "ADVANCE",
                type: "ERROR",
                textSize: 20,
                isIcon: true,
                closeIconPosition: "LEFT", 
            ).show(context);

```


```dart
///Advance mode :- Example 7
/// You can change devider color (hr line)
AdvanceSnackBar(
                message: "Notification Message",
                tittle: "Tittle message",
                mode: "ADVANCE",
                type: "ERROR",
                textSize: 20,
                isIcon: true,
                deviderColor: Colors.red,
                closeIconPosition: "LEFT", 
            ).show(context);

```


```dart
///Advance mode :- Example 7
///with child you can add a extra widgets it can be button, icon, image, etc..
AdvanceSnackBar(
                message: "Notification Message ",
                mode: "ADVANCE",
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

```
```dart
///Advance mode :- Example 8
/// You can override onclick function of close button
AdvanceSnackBar(
                message: "Notification Message ",
                mode: "ADVANCE",
                type: "PRIMARY",
                onClick: () 
                {
                    print("Hello");
                },
                isIcon: true).show(context);

```

### Modern mode 
Modern mode have all advance mode features nad it have some ne featers. It has a qnique design. 
You can change advance mode design with add a single word "MODERN".
in modern mode youcan't change devider color we are working on it.

```dart
///Modern mode :- Example 1
AdvanceSnackBar(
                message: "Notification Message",
                mode: "MODERN",).show(context);

```

```dart
///Modern mode :- Example 2
// You can change the type like advance mode
AdvanceSnackBar(
                message: "Notification Message",
                mode: "MODERN",type: "WARNING")).show(context);
```

```dart
///Modern mode :- Example 3
AdvanceSnackBar(
                message: "Notification Message",
                mode: "MODERN",
                type: "ERROR",
                isIcon: true)
            .show(context);
```

```dart
///Modern mode :- Example 3
AdvanceSnackBar(
                message: "Notification Message content",
                mode: "MODERN",
                type: "ERROR",
                tittle: "Tittle message",
                isIcon: true)
            .show(context);

```

## Bugs or Requests
If you encounter any problems feel free to open an issue. If you feel the library is missing a feature, please raise a ticket on GitHub and I'll look into it. Pull request are also welcome.

