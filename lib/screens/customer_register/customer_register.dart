import 'package:digital_dukan_minor_project/bloc/register_bloc/register_bloc.dart';
import 'package:digital_dukan_minor_project/models/address.dart';
import 'package:digital_dukan_minor_project/models/register_model.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:digital_dukan_minor_project/screens/verify_otp/verify_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerRegister extends StatelessWidget {
  CustomerRegister({Key? key}) : super(key: key);
  final TextEditingController phoneNumberController =
      new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController stateController = new TextEditingController();
  final TextEditingController zipController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digital Dukaan"),
        centerTitle: true,
      ),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterMessage) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is RegisterLoaded) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          }
          if (state is RegisterCodeSent) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      VerifyOTP(state.verificationID, state.registerModel)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Register as customer",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: phoneNumberController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(305.0),
                          ),
                        ),
                        hintText: "phone number",
                        labelText: "phone number",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: passwordController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(305.0),
                          ),
                        ),
                        hintText: "password",
                        labelText: "password",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.shop),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(305.0),
                          ),
                        ),
                        hintText: "name",
                        labelText: "name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: cityController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(305.0),
                          ),
                        ),
                        hintText: "city",
                        labelText: "city",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: stateController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(305.0),
                          ),
                        ),
                        hintText: "state",
                        labelText: "state",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: zipController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.code),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(305.0),
                          ),
                        ),
                        hintText: "zip",
                        labelText: "zip",
                      ),
                    ),
                  ),
                  state is RegisterLoading
                      ? CircularProgressIndicator()
                      : Container(),
                  Container(
                    width: 140,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: new RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(30.0))),
                      onPressed: () {
                        Address address = new Address(cityController.text,
                            stateController.text, zipController.text);
                        RegisterModel ownerRegisterModel =
                            new RegisterModel.customer(
                                phoneNumberController.text,
                                nameController.text,
                                passwordController.text,
                                address,
                                UserType.customer);
                        BlocProvider.of<RegisterBloc>(context)
                            .add(Register(ownerRegisterModel, context));
                      },
                      child: new Text(
                        "Register",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
