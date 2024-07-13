import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usersexplorer/states/userStates.dart';
import 'package:usersexplorer/ui/homeui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserState(),
          child: MaterialApp(
        title: 'Users Explorer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
