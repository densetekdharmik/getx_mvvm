import 'package:flutter/material.dart';

class GenralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;

  GenralExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<GenralExceptionWidget> createState() =>
      _GenralExceptionWidgetState();
}

class _GenralExceptionWidgetState extends State<GenralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.cloud_off),
            Text("No Internet"),
            ElevatedButton(
              onPressed: widget.onPress,
              child: Text("Retry"),
            )
          ],
        ),
      ),
    );
  }
}
