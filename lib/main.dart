import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// man hinh
import 'SignIn/dang_nhap.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
//#state management
class MyApp extends StatelessWidget {
  static final String title = 'Khám sức khỏe';
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: HomePage(),
    routes: {
      // man hinh dang nhap
      SignUpWidget.routeName: (ctx) => SignUpWidget(),
    },
  );
}