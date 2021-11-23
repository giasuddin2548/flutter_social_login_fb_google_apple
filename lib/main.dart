import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: SignInButton(
              Buttons.Google,
              onPressed: () {},
            ),
          ),
          Center(
            child: SignInButton(
              Buttons.Facebook,
              onPressed: () {
                _facebookLoginRequestSend();
              },
            ),
          ),
          Center(
            child: SignInButton(
              Buttons.Apple,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  void _facebookLoginRequestSend() async{

    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    print('FBLogin ${result.status}');
    print('FBLogin ${result.accessToken}');

    // final LoginResult result = await FacebookAuth.instance.login(
    //   permissions: ['public_profile', 'email', 'pages_show_list', 'pages_messaging', 'pages_manage_metadata'],
    // );
    // if (result.status == LoginStatus.success) {
    //   final AccessToken accessToken = result.accessToken!;
    //
    //   print('FBLogin ${accessToken.userId}');
    // } else {
    //
    //   print('FBLogin ${result.status}');
    //   print('FBLogin ${result.accessToken}');
    // }


  }
}


