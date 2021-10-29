import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'google_sign_in.dart';
import 'thong_tin_nhan_vat.dart';


class SignUpWidget extends StatelessWidget{
  @override
  static const routeName = '/first-screen';

  Widget build(BuildContext context) => buildSignUp();

  Widget buildSignUp() => Column(
    children: [
      Align(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child:  Text(
              'App khám sức khỏe',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            )
        ),
      ),
      Spacer(),
      GoogleSignupButtonWidget(),
      SizedBox(height:12),
      Text(
        'Login to continue',
        style: TextStyle(fontSize: 20, decoration:TextDecoration.none),
      ),

      Spacer(),
    ],
  );
}

class GoogleSignupButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(4),

    child: OutlinedButton.icon(
      label: Text(
        'Sign In with Google',
        style: TextStyle( fontSize: 20,decoration:TextDecoration.none, fontWeight: FontWeight.bold ),
      ),
      style: OutlinedButton.styleFrom(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
        side: BorderSide(
          color: Colors.green ,
        ),
        primary: Colors.black, // foreground
      ),
      //textColor: Colors.black,

      icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
      onPressed: () {
        final provider = Provider.of<GoogleSignInProvider>(context,listen: false);

        provider.login();
      },
    ),
  );
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          final provider = Provider.of<GoogleSignInProvider>(context);

          if (provider.isSigningIn){
            return buildLoading();
          } else if (snapshot.hasData) {
            return LoggedInWidget();
          } else {
            return SignUpWidget();
          }
        },
      )
    ),
  );
  Widget buildLoading() => Center(child: CircularProgressIndicator());
}

