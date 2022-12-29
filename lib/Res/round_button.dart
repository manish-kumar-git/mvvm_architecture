import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.title, this.loading=true, required this.callback});
  final String title;
  final bool loading;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blueGrey,
      onPressed: callback,
      child: Text(title,style: const TextStyle(color: Colors.white),),
    );
  }
}
