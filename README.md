
# Flutter Fade Package
 Flutter package that i created to help freelancers to guarantee their rights 
 
 
# How it  works 
you give the package the date that you and the client agreed to take the money 
after that wrapping your widgets that you want them to hide and give them days before you want to hide 
the package will do the rest (the application is going to fade in front of the client just like this) .
<img src="ex.gif" width="200" height="350">


# How to use it 
It is simple 

## 1 
 first :
 wrap your material app with fade package 
 ```
 Fade(
      paid: false,
      //paidFunction: paidFunction,

      // you can call your api here or any Future function

      dateTime: DateTime(2021, 4, 10),
      materialApp: MaterialApp(
        title: 'Fade',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Fade  Page'),
      ),
    );
 ```

## 2
 second :
 wrap your widget  with ContainerF and add last days to hide this
 
 ```
  ContainerF(
                child: Container(
                  height: 60,                    //this code will make your widget hide when remaining days <=lastDaysToHideThis
                  width: 60,
                  color: Colors.red,
                ),
                lastDaysToHideThis: 5, //this that tell your widget when to fade (days before fading)
            ),
 ```

that's it your app now is ready (don't let the client use you).
