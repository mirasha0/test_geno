import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_geno/screens/forgot_pw.dart';
import 'package:test_geno/screens/home.dart';
import 'package:test_geno/screens/sign_up.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String> [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly'
    ]
);

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

 late GoogleSignIn _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account! as GoogleSignIn;
      });
      if(_currentUser!=null){
        print("user is already authenticated!!");
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> handelSignIn() async {
    try{
      await _googleSignIn.signIn();
    }catch(error) {
      print("sign in error"+error.toString());
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  home(),
      ),
    );
  }

  Future<void> handelSignOut () => _googleSignIn.disconnect();
  bool _isObscure3 = true;
  bool visible = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: 470,
            height: 812,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned( //home button
                  left: 121,
                  top: 778,
                  child: Container(
                    width: 134,
                    height: 34,
                    padding: const EdgeInsets.only(top: 21, bottom: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 134,
                          height: 5,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 101,
                  right: 101,
                  top: 151,
                  child: Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2D3D5C),
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.45,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                const Positioned(
                  left: 68,
                  right: 68,
                  top: 191,
                  child: Text(
                    'Please enter your account here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9FA5C0),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.67,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 248,
                  child: Container(
                    width: 327,
                    height: 56,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 327,
                          height: 56,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Email or phone Number',
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF9FA5C0),
                                      fontSize: 15,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.10,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Color(0xFF2E3E5C),
                                    ),
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFD0DAE9),
                                          width: 0.50),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) { //*****
                                      return "This Field Cannot be Empty";
                                    }
                                    if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Please Enter a valid Email!!"); //add worning
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    emailController.text = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 375,
                    height: 44,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 338.33,
                          top: 17.33,
                          child: Container(
                            width: 24.33,
                            height: 11.33,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Opacity(
                                    opacity: 0.35,
                                    child: Container(
                                      width: 22,
                                      height: 11.33,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 0.50),
                                          borderRadius: BorderRadius.circular(
                                              2.67),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 2,
                                  top: 2,
                                  child: Container(
                                    width: 18,
                                    height: 7.33,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            1.33),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 318,
                          top: 17.33,
                          child: Container(
                              width: 15.33,
                              height: 11,
                              child: SvgPicture.asset("assets/Wifi.svg")
                          ),
                        ),
                        Positioned(
                          left: 296,
                          top: 17.67,
                          child: Container(
                              width: 17,
                              height: 10.67,
                              child: SvgPicture.asset(
                                  "assets/Cellular Connection.svg")
                          ),
                        ),
                        const Positioned(
                          left: 31,
                          top: 14.33,
                          child: Text(
                            '9:41',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 320,
                  child: Container(
                    width: 327,
                    height: 56,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 327,
                            height: 56,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.50, color: Color(0xFFD0DAE9)),
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 279,
                          top: 16,
                          child: Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.only(
                              top: 4.75,
                              left: 2.75,
                              right: 2.75,
                              bottom: 4.65,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 18.50,
                                  height: 14.60,
                                  child: Stack(children: const [
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                color: Color(0xFF9FA5C0),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Color(0xFF9FA5C0),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.10,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline,

                              color: Color(0xFF2E3E5C),
                            ),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.50),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.50),
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password Cannot be Empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Please Enter Valid Password min. 6 Character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress, //password
                        ),
                        Positioned(
                          left: 24,
                          top: 16,
                          child: Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.only(
                              top: 2.75,
                              left: 4.25,
                              right: 4.52,
                              bottom: 2.75,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 15.23,
                                  height: 18.50,
                                  child: Stack(children: const [
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 215,
                  top: 400,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const forgotPass(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF2D3D5C),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1.67,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 25,
                  right: 25,
                  top: 497,
                  child: Center(
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      elevation: 5.0,
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
                      height: 56,
                      onPressed: () {
                        setState(() {
                          visible = true;
                        });
                        signIn(
                            emailController.text, passwordController.text);
                      },
                      color: Color(0xFF1FCC79),
                      //color
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  right: 25,
                  top: 626,
                  child: Center(
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      elevation: 5.0,
                      padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                      height: 56,
                      //56
                      onPressed: () {
                        handelSignIn();

                        },
                      color: Color(0xFFFF5842),
                      //color
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/Google.svg",),
                            const Text(
                              "Google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.10,
                              ),
                            ),
                            // SvgPicture.asset("assets/Google.svg" ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                const Positioned(
                  left: 124,
                  right: 124,
                  top: 577,
                  child: Text(
                    'Or continue with',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9FA5C0),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.67,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),

                Positioned(
                  left: 60,
                  right: 60,
                  top: 712,
                  child: Row(
                      children: <Widget>[
                        const Text(
                          'Don’t have any account?',
                          style: TextStyle(
                            color: Color(0xFF2D3D5C),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.67,
                            letterSpacing: 0.50,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const sign_up(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF1FCC79),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 1.67,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
   void route(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => home(),
            ),
          );
        } else {
          print('User not found in Firestore');
        }
      });
    } else {
      print('User is not logged in');
    }
  }
 void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // ignore: use_build_context_synchronously
        route(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        } else {
          print('Error: ${e.code}');
        }
      }
    }
  }
}