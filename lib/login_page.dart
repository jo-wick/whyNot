import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vacation_project/setting.dart';

import 'home.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
);
class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  int _selection = 0;
  String userInfo = "";
  static final storage =
  new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    //비동기로 flutter secure storage 정보를 불러오는 작업.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    userInfo = await storage.read(key: "login");
    print(userInfo);

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (userInfo != null) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          // 파라미터 todo로 tap된 index의 아이템을 전달
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아니 이거 왜 안돼',
      theme: theme ? _darkTheme : _lightTheme,
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('로그인'),
          centerTitle: true,
        ),
        body: Builder(builder: (BuildContext context) {
          return
            // Form(
            // key: formKey,
            // child:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // _idText(),
                  // Container(height: 16.0),
                  // Container(
                  //   width: 300,
                  //   child: TextFormField(
                  //     controller: _emailController,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       prefixIcon: Icon(Icons.perm_identity),
                  //     ),
                  //     validator: (String value) {
                  //       if (value.isEmpty) {
                  //         return 'Please enter some text';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  // Container(height: 25.0),
                  // _passwordText(),
                  // Container(height: 16.0),
                  // Container(
                  //   width: 300,
                  //   child: TextFormField(
                  //     controller: _passwordController,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       prefixIcon: Icon(Icons.vpn_key),
                  //     ),
                  //     obscureText: true,
                  //     validator: (String value) {
                  //       if (value.isEmpty) {
                  //         return 'Please enter some text';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  // Container(height: 30.0),
                  _googleSignInButton(),
                  // Container(height: 20),
                  //_loginButton(),
                ],
              ),
            // ),
          );
        }),
      ),
    );
  }

  Widget _idText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 63.0),
        Text(
          '이메일',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _passwordText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 63.0),
        Text(
          '비밀번호',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _googleSignInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        _signInWithOtherProvider();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('images/google_logo.png'), height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 165.0),
        SizedBox(
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _RegisterEmailSection(),
                ),
              );
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF3A70AF)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              )),
            ),
          ),
        ),
        Container(width: 10.0),
        SizedBox(
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              _signInWithEmailAndPassword();
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF3A70AF)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              )),
            ),
          ),
        ),
      ],
    );
  }

  void _signInWithEmailAndPassword() async {
    final User user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    setState(() {
      if(user != null){
        _success = true;
        _userEmail = user.email;
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => HomePage()),
        );
      }
      else {
        setState(() {
          _success = false;
        });
      }
    });

  }

  void _signInWithOtherProvider() {
    switch (_selection) {
      default:
        _signInWithGoogle();
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn());

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }

      final user = userCredential.user;
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text('Sign In ${user.uid} with Google'),
      // ));
      String useremail = user.email;

      if(useremail.contains('handong.edu')){
        await storage.write(
            key: "login",
            value: "id " +
                useremail);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            // 파라미터 todo로 tap된 index의 아이템을 전달
            builder: (context) => HomePage(),
          ),
        );
      }
      else{
        GoogleSignIn _googleSignIn = GoogleSignIn();
        await _googleSignIn.disconnect();
        await FirebaseAuth.instance.signOut();
        print('fail to login');
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Please sign in handong email'),
        ));
      }
    } catch (e) {
      print(e);
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Failed to sign in with Google: $e'),
      //   ),
      // );
    }
  }
}

class _RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => _RegisterEmailSectionState();
}

class _RegisterEmailSectionState extends State<_RegisterEmailSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  bool _passwordlength;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Builder(builder: (BuildContext context) {
          return ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(height: 150.0),
                        _idText(),
                        Container(height: 16.0),
                        Container(
                          width: 300,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.perm_identity),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(height: 25.0),
                        _passwordText(),
                        Container(height: 16.0),
                        Container(
                          width: 300,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.vpn_key),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              } else if (value.length <= 6) {
                                return 'Password should be at least 6 characters';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Container(height: 40.0),
                        _loginButton(),
                      ],
                    ),
                  ),
                )
              ]);
        }));
  }

  Widget _idText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 65.0),
        Text(
          '아이디',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _passwordText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 65.0),
        Text(
          '비밀번호',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 230.0),
        SizedBox(
          width: 120,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              if (_passwordController.text.length < 6) {
                _passwordlength = false;
                print("Password should be at least 6 characters");
                return 'Password should be at least 6 characters';
              }
              _register();
              Navigator.pop(context);
              //기능 추가
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF3A70AF)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              )),
            ),
          ),
        ),
      ],
    );
  }

  void _signInWithEmailAndPassword() async {
    final User user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
