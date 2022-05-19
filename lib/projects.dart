import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> getString() async {
      FirebaseDatabase ref = FirebaseDatabase.instance;
      //await ref.ref().child('d').set('3');
      final _d = await ref.ref().get();
      print(_d);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Projects'),
        ElevatedButton(onPressed: (){
          getString();
        }, child: const Text('test'))
      ],
    );
  }
}
