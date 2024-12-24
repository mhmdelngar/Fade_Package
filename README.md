
# Flutter Fade Package

The **Flutter Fade Package** is a tool designed to empower freelancers by ensuring their rights are protected. It allows you to make specific widgets in your app fade out after a predefined period, encouraging timely payment from clients.

---

## Features

- Easily hide widgets based on a deadline.
- Customizable fade-out timing.
- Simple integration into your Flutter app.

---

## How It Works

1. **Set the Deadline**: Specify the date when you expect payment from the client.
2. **Wrap Your Widgets**: Use the provided widget wrapper to define elements that should fade out.
3. **Automated Action**: The package will handle the rest, making the app fade out when the deadline approaches. 

Example of the fading effect:  
![fade](ex.gif)

---

## How to Use It

### Step 1: Wrap Your MaterialApp with the `Fade` Widget

First, integrate the `Fade` widget at the root of your app. Configure it with the payment status, deadline, and any functions you wish to execute.

```dart
Fade(
  paid: false, // Set to true once payment is received
  dateTime: DateTime(2021, 4, 10), // The agreed payment deadline
  materialApp: MaterialApp(
    title: 'Fade',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(title: 'Flutter Fade Page'),
  ),
);
```

### Step 2: Wrap Widgets with `ContainerF`

Next, identify the widgets you want to hide as the deadline approaches. Wrap them with the `ContainerF` widget and specify the number of days before fading.

```dart
ContainerF(
  child: Container(
    height: 60, 
    width: 60, 
    color: Colors.red, // This widget will fade out when the deadline is near
  ),
  lastDaysToHideThis: 5, // Number of days before fading begins
);
```

---

## Ready to Go!

That's it! Your app is now configured to fade widgets as needed. Don't let clients take advantage of your work—this package has your back.

For any issues, suggestions, or contributions, feel free to reach out. 💪
