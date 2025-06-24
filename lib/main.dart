import 'package:flutter/material.dart';
import 'package:flutter_state_management/auth/auth_provider.dart';
import 'package:flutter_state_management/auth/login_screen.dart';
import 'package:flutter_state_management/example_one/example_one.dart';
import 'package:flutter_state_management/example_one/example_one_provider.dart';
import 'package:flutter_state_management/value_notifier/value_notifier_listner.dart';
import 'package:flutter_state_management/why/stateful_widget_screen.dart';
import 'package:flutter_state_management/why/stateless_widget_screen.dart';
import 'package:flutter_state_management/why/why_privider_screen.dart';
import 'package:provider/provider.dart';

import 'counter/counter_screen.dart';
import 'counter/couter_provider.dart';
import 'example_two/example_two_screen.dart';
import 'example_two/provider/example_two_provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  //showing error to navigation to counter screen
  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider<CounterProvider>(
          create: (BuildContext context) {
            return CounterProvider();
          },
        child: HomePage()
      ),
    );
  }*/

//for single provider

/*  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomePage(),
      ),
    );
  }*/

 //for multiprovider
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider(),),
        ChangeNotifierProvider<ExampleOneProvider>(create: (_)=> ExampleOneProvider(),),
        ChangeNotifierProvider<ExampleTwoProvider>(create: (_)=> ExampleTwoProvider(),),
        ChangeNotifierProvider<AuthProvider>(create: (_)=> AuthProvider(),),
         ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider()), // Uncomment if you have a Counter provider
        // Add other providers here if needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomePage build called");
   // final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context , index) {
        return ListTile(
          title: Text(list[index]),
          leading: Icon(Icons.star),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            nivigation(context, list[index]);
          },
        );
      },
    ),
    );

  }

  List<String> list= ["why",  "stateless_widget","stateful_widget","ValueNotifierListener",
    "example_one", "example_two","counter", "auth"];

  void nivigation(BuildContext buildContext, String type)
  {
    switch(type)
        {
          case "counter":
          Navigator.push(buildContext, MaterialPageRoute(builder: (context) => CounterScreen()));
           break;
          case "why":
            Navigator.push(buildContext, MaterialPageRoute(builder: (context) => WhyProviderScreen()));
         case "stateless_widget":
             Navigator.push(buildContext, MaterialPageRoute(builder: (context) => StateLessWidgetScreen()));
        case "stateful_widget":
          Navigator.push(buildContext, MaterialPageRoute(builder: (context) => StateFullWidgetScreen()));
      case "ValueNotifierListener":
        Navigator.push(buildContext, MaterialPageRoute(builder: (context) => ValueNotifierListener()));
      case "example_one":
        Navigator.push(buildContext, MaterialPageRoute(builder: (context) => ExampleOneScreen()));
      case "example_two":
            Navigator.push(buildContext, MaterialPageRoute(builder: (context) => ExampleTwoScreen()));
      case "auth":
        Navigator.push(buildContext, MaterialPageRoute(builder: (context) => LoginScreen()));
        break;
          default:
            Navigator.push(buildContext, MaterialPageRoute(builder: (context) => CounterScreen()));
       }

  }
}
