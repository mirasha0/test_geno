import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:test_geno/screens/login.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' ;


class forgotPass extends StatefulWidget {
  const forgotPass({Key? key}) : super(key: key);

  @override
  State<forgotPass> createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
  final formKey = GlobalKey<FormState>();
  final forgetPasswordController = TextEditingController();

 /* @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text("Receive an Email to\nreset your Password" , textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),),
              SizedBox(height: 20,),
              TextFormField(
                controller: forgetPasswordController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText:'Email' ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                ? 'Enter valid email'
                : null ,
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.email_outlined),
                label: const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  var forgotEmail = forgetPasswordController.text.trim();

                  try{
                   await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgotEmail)
                        .then((value) => {
                          print("Email Sent!"),
                      Get.off(() =>  login()),
                    });
                  }on FirebaseAuthException catch (e) {
                    print("Error $e");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
