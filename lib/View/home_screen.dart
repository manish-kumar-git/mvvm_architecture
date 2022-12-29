import 'package:flutter/material.dart';
import 'package:mvvm/View_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Image(
              image: NetworkImage(
                  'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/5ecc4759709309.5a2c667410e20.png')),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(onPressed: () {
            UserViewModel().removeUser(context);
          },
          color: Colors.brown,
          child: Text('Remove',style: TextStyle(color: Colors.white),),)
        ],
      ),
    );
  }
}
