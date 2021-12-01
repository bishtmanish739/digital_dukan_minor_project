import 'package:digital_dukan_minor_project/bloc/profile_bloc/profile_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/register_bloc/register_bloc.dart';
import 'package:digital_dukan_minor_project/models/address.dart';
import 'package:digital_dukan_minor_project/models/register_model.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerProfile extends StatefulWidget {
  CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  ProfileBloc bloc = new ProfileBloc();
  @override
  void initState() {
    bloc.add(FetchProfile(UserType.customer));
    super.initState();
  }

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
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: BlocConsumer(
        bloc: bloc,
        listener: (context, state) {
          if (state is ProfileMessage) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading)
            return Center(child: CircularProgressIndicator());
          if (state is ProfileLoaded) {
            RegisterModel model = state.model;
            phoneNumberController.text = model.phoneNumber!;
            passwordController.text = model.password!;
            nameController.text = model.name!;
            cityController.text = model.address!.city!;
            stateController.text = model.address!.state!;
            zipController.text = model.address!.zip!;
          }

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Customer Profile",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        bloc.add(
                            SaveProfile(ownerRegisterModel, UserType.customer));
                      },
                      child: new Text(
                        "Save",
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
