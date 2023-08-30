import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_geno/model/user_model.dart';
import 'package:test_geno/screens/login.dart';
import 'home.dart';

class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {

  bool showProgress = false;
  bool visible = false;

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController nameController =  TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController =
  TextEditingController();


  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
       elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined ,  color: Color(0xFF2E3E5C)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white38,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        const Text(
                          "Register Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigoAccent,
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Your Name',
                            hintStyle: const TextStyle(
                              color: Color(0xFF9FA5C0),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.10,
                            ),
                            prefixIcon: const Icon(
                              Icons.person_outlined,
                              color: Color(0xFF2E3E5C),
                            ),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFD0DAE9) , width: 0.50),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:  const BorderSide(color: Colors.white),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name Cannot Be empty";
                            }
                            else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress, //-*+-7-
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Your Email',
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
                              borderSide: const BorderSide(color: Color(0xFFD0DAE9) , width: 0.50),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:  const BorderSide(color: Colors.white),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Cannot Be empty";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter A Valid Email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: mobile,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Your Phone number',
                            hintStyle: const TextStyle(
                              color: Color(0xFF9FA5C0),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.10,
                            ),
                            prefixIcon: const Icon(
                              Icons.phone_outlined,
                              color: Color(0xFF2E3E5C),
                            ),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFD0DAE9) , width: 0.50),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:  const BorderSide(color: Colors.white),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone Number Cannot Be empty";
                            }
                            else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress, //-*+-7-
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                color: Color(0xFF9FA5C0),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
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
                              borderSide:  const BorderSide(color: Color(0xFFD0DAE9) , width: 0.50),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:  const BorderSide(color: Colors.white),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password Cannot Be Empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Please Enter Valid Password min. 6 Character");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure2,
                          controller: confirmpassController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                color: Color(0xFF9FA5C0),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              color: Color(0xFF9FA5C0),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.10,
                            ),
                            prefixIcon: const Icon(
                              Icons.vpn_key_outlined,
                              color: Color(0xFF2E3E5C),
                            ),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFD0DAE9) , width: 0.50),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:  const BorderSide(color: Colors.white),
                              borderRadius:  BorderRadius.circular(32),
                            ),
                          ),
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "Password Incorrect!! Try Again";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                              ),
                              elevation: 5.0,
                              padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
                              height: 56,
                              onPressed: () {
                                signUp(emailController.text, passwordController.text);
                              },
                              color: Color(0xFF1FCC79), //color
                              child: const Text(
                                "Sign Up",
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
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
void signUp(String email,String password) async{
  if(_formKey.currentState!.validate()){
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
      postDetailsToFirestore(),

    }).catchError((e){
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
  postDetailsToFirestore() async{

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.uid = user?.uid;
    userModel.name = nameController.text;
    userModel.email = user!.email;
    userModel.phone = mobile.text;
    userModel.password = passwordController.text;

    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully!");

    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => login()), (route) => false);
  }
}