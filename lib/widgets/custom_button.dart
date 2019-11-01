import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key, this.callback, this.text}) : super(key: key);

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Material(
            color: Colors.teal,
            clipBehavior: Clip.hardEdge,
            elevation: 6,
            borderRadius: BorderRadius.circular(30),
            child: MaterialButton(
              onPressed: callback,
              minWidth: 200,
              height: 45,
              child: Text(text),
            ),
          ),
        ),
      );
}
