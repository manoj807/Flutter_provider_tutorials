
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCubitScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    print("HomeCubitScreen build called");
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Here you would typically use a BlocBuilder to listen to state changes
            // and display the count, but for simplicity, we are just showing a placeholder.
            Text(
              '0', // Placeholder for count
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Here you would typically dispatch an event to increment the count
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }


}