# Advance_Notification

Advance_Notification is a Flutter package with custom snackabar.


## Development is continue

- There are **many new features planned** for Advance_Notification.



# Installing

### 1. Depend on it
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  smart_notification: <latest_version>
```


### 2. Install it

You can install packages from the command line:

Run this command with flutter:


```yaml
flutter pub add smart_notification
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:smart_notification/smart_notification.dart';
```

## Getting Started || Usage

### Why Advance Notification

The Advance_Notification provide multiple design of snackbar notification.
### Examples

Advance_Notification have three mode in snackbar =>  BASIC,ADVANCE,MODERN.

### 1: Basic Mode

<hr>

You can use basic snackbar with background color, text color, position

<img src="https://github.com/shyambhati/Advance_Notification/blob/main/display/basic.gif?raw=true" align = "right" width="300px" height = "600px">

#### 1.1 => Example
**Note:** For basic mode you don't need to write mode.
```dart
AdvanceSnackBar(message: "Hello...").show(context);
```


**Note:** Basic with background color.
```dart
 AdvanceSnackBar(
     message: "Notification Message", 
     bgColor: Colors.blueAccent).show(context);
```


#### 1.2 => Example
**Note:** Basic with background color or text color.

```dart
AdvanceSnackBar(
    message: "Notification Message",
    bgColor: Colors.tealAccent,
    textColor: Colors.red).show(context);
```


#### 1.3 => Example
**Note:** Basic with background color or text  or fixed position.
```dart
AdvanceSnackBar(
    message: "Notification Message",
    bgColor: Colors.tealAccent,
    textColor: Colors.red,
    isFixed: false).show(context);
```

### 2: Advance mode 

You can use advance mode snackbar with many features. It has default close button.
You can override the close button event, color and icon image. 

<img src="https://github.com/shyambhati/Advance_Notification/blob/main/display/advance.gif?raw=true" align = "right" width="300px" height = "600px">

#### 2.1 => Example

```dart
 AdvanceSnackBar(
     message: "Notification Message",
     mode: "ADVANCE",).show(context);
```

#### 2.2 => Example

You can add your custom duration for hide notification. default duration is 4 seconds. We have multiple types in Advance mode like : PRIMARY,SECONDARY,LIGHT,DARK,SUCCESS,INFO,WARNING,ERROR,default type is SUCCESS.

```dart

AdvanceSnackBar(
    message: "Notification Message",
    mode: "ADVANCE",
    duration: Duration(seconds: 5),).show(context);
```

#### 2.3 => Example
**Note:** Change bgColor, text color close iconColor.

```dart
AdvanceSnackBar(
    message: "Notification Message",
    mode: "ADVANCE",
    duration: Duration(seconds: 5),
    bgColor: Colors.red,
    textColor: Colors.black,
    iconColor: Colors.black,).show(context);
```

#### 2.4 => Example
**Note:** With this example you can change textSize or show notification icon.

```dart
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

#### 2.5 => Example
**Note:** Every type has own icon you can show and hide with isIcon.
```dart
AdvanceSnackBar(
        message: "Notification Message",
        mode: "ADVANCE",
        duration: Duration(seconds: 5),
        type: "ERROR",
        textSize: 20,
        isIcon: true,
    ).show(context);
```

#### 2.6 => Example
**Note:** Change type icon position.
```dart
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

#### 2.7 => Example
**Note:** You can also add tittle.
```dart
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

#### 2.8 => Example
**Note:** You can change divider color (hr line).
```dart

AdvanceSnackBar(
        message: "Notification Message",
        tittle: "Tittle message",
        mode: "ADVANCE",
        type: "ERROR",
        textSize: 20,
        isIcon: true,
        dividerColor: Colors.red,
        closeIconPosition: "LEFT", 
    ).show(context);

```

#### 2.9 => Example
**Note:** With child you can add an extra widgets it can be a button, icon, image, etc.
```dart
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

#### 2.10 => Example
**Note:** You can override onclick function of close button.

```dart
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

### 3: Modern mode 
Modern mode have all advance mode features and it have some new features. 
It has a unique design. 
You can change advance mode design with add a single word "MODERN".
In modern mode you can't change divider color we are working on it.

<img src="https://github.com/shyambhati/Advance_Notification/blob/main/display/modern.gif?raw=true" align = "right" width="300px" height = "600px">

#### 3.1 => Example
```dart
AdvanceSnackBar(
        message: "Notification Message",
        mode: "MODERN",).show(context);

```
#### 3.2 => Example

**Note:** You can change the type like advance mode.

```dart
AdvanceSnackBar(
        message: "Notification Message",
        mode: "MODERN",type: "WARNING")).show(context);
```

#### 3.3 => Example
```dart
AdvanceSnackBar(
        message: "Notification Message",
        mode: "MODERN",
        type: "ERROR",
        isIcon: true)
    .show(context);
```

#### 3.4 => Example
```dart
AdvanceSnackBar(
        message: "Notification Message content",
        mode: "MODERN",
        type: "ERROR",
        tittle: "Tittle message",
        isIcon: true)
    .show(context);
```
<hr>

### The component takes 1 compulsory prop - message. Other props are optional. The table below explains more.

| Prop              | Mode            |  Type     | Description/Purpose                | Default     | Required |
| :-----------------| :-------------: | :-------: | :--------------------------------: | :---------- |:------   |
| tittle            | Advance,Modern  |`String`   |It is for notification tittle.      | ""          |  NO      |
| message           | All             |`String`   |It is for notification Message.      | ""          |  YES     |
| duration          | Advance,Modern  |`Duration` |Duration of notification hide.         | "Duration(seconds: 4)"          |  NO      |
| isIcon            | Advance,Modern  |`String`   |Icon show in advance and modern.                  | false          |  NO      |
| isFixed           | Basic           |`bool`     |It will work in basic mode only.                   | ""          |  true      |
| isClosable        | Advance,Modern  |`bool`     |Hide/show close icon.                 | true          |  NO      |
| isDivider         | Advance,Modern  |`bool`     |It will show when you add tittle.                   | true          |  NO      |
| isChildLeft       | Advance,Modern  |`bool`   |It swap close icon and child widget left to right.                   | true          |  NO      |
| type              | Advance,Modern  |`String`   | These are default design of snackbar | PRIMARY, SECONDARY, LIGHT, DARK, SUCCESS, INFO, WARNING, ERROR.          |  NO      |
| mode              |  |`String`   |BASIC, ADVANCE, MODERN.                   | BASIC          |  NO      |
| iconPosition      | Advance,Modern  |`String`   |You can change icon position of types icons.     | "LEFT"          |  NO      |
| closeIconPosition | Advance,Modern  |`String`   |You can also change closeIconPosition.           | "RIGHT"          |  NO      |
| onClick           | Advance,Modern  |`function` |Override the closeButton onclick function.                   | ""          |  NO      |
| icon              | Advance,Modern  |`widget`   |You can change icon.                   | ""          |  NO      |
| child             | Advance,Modern  |`widget`   |You can add extra widget.                   | ""          |  NO      |
| borderRadius      | Advance,Modern  |`double`   |Can change borderRadius.             | 10          |  NO      |
| mHeight           | Advance,Modern  |`double`   |Can change snackbar height.                  | 40          |  NO      |


## Bugs or Requests
If you encounter any problems feel free to open an [issue](https://github.com/aagarwal1012/Animated-Text-Kit/issues/new?assignees=&labels=&template=bug_report.md). If you feel the library is missing a [feature](https://github.com/aagarwal1012/Animated-Text-Kit/issues/new?assignees=&labels=&template=feature_request.md), please raise a ticket on GitHub and I'll look into it. Pull request are also welcome.

