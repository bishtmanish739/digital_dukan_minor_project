import 'package:digital_dukan_minor_project/bloc/register_bloc/register_bloc.dart';
import 'package:digital_dukan_minor_project/models/register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOTP extends StatefulWidget {
  final String veritifcationID;
  final RegisterModel ownerRegisterModel;
  const VerifyOTP(this.veritifcationID, this.ownerRegisterModel);

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final TextEditingController otpController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: otpController,
                decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey[300]!),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(305.0),
                    ),
                  ),
                  hintText: "OTP",
                  labelText: "OTP",
                ),
              ),
            ),
            Container(
              width: 140,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: new RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green),
                        borderRadius: new BorderRadius.circular(30.0))),
                onPressed: () async {
                  if (otpController.text.isEmpty) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Enter OTP")));
                  } else {
                    // Create a PhoneAuthCredential with the code
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.veritifcationID,
                            smsCode: otpController.text);

                    // Sign the user in (or link) with the credential
                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      BlocProvider.of<RegisterBloc>(context).add(
                          VerificationCompleted(
                              widget.ownerRegisterModel, context));
                      Navigator.pop(context);
                    }).catchError((e) {
                      BlocProvider.of<RegisterBloc>(context)
                          .add(UserRegisterErrorMessage(e.toString()));
                      Navigator.pop(context);
                    });
                  }
                },
                child: new Text(
                  "Verify",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
