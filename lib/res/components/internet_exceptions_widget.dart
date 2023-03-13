import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;

  InternetExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
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
