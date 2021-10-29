import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';

class LoggedInWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.black26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          // hinh user
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          // tên user
          Text(
            'Name: '+ user.displayName,
            style: TextStyle(color:Colors.white),
          ),
          SizedBox(height: 8),
          // email
          Text(
            'Email: '+ user.email,
            style: TextStyle(color:Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
              onPressed: (){
                final provider = Provider.of<GoogleSignInProvider>(context);
                provider.logout();
              },
              child: Text('Logout')
          )
        ],
      ),
    );
  }
}