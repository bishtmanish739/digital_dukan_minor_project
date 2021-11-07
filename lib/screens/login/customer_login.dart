import 'package:digital_dukan_minor_project/bloc/login_bloc/login_bloc.dart';
import 'package:digital_dukan_minor_project/models/login_model.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerLogin extends StatefulWidget {
  CustomerLogin({Key? key}) : super(key: key);

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  final TextEditingController phoneNumberController =
      new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Customer Login"),
          centerTitle: true,
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoaded)
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);

            if (state is LoginError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
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
                                borderSide:
                                    new BorderSide(color: Colors.grey[300]!),
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
                                borderSide:
                                    new BorderSide(color: Colors.grey[300]!),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(305.0),
                                ),
                              ),
                              hintText: "password",
                              labelText: "password",
                            ),
                          ),
                        ),
                        state is LoginLoaded
                            ? CircularProgressIndicator()
                            : Container(),
                        Container(
                          width: 140,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.green),
                                    borderRadius:
                                        new BorderRadius.circular(30.0))),
                            onPressed: () {
                              LoginModel login = new LoginModel(
                                  phoneNumberController.text,
                                  passwordController.text,
                                  UserType.customer);
                              BlocProvider.of<LoginBloc>(context)
                                  .add(LoginUser(login));
                            },
                            child: new Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
