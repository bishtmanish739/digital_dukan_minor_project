import 'package:digital_dukan_minor_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:digital_dukan_minor_project/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderModeSettings extends StatefulWidget {
  const OrderModeSettings({Key? key}) : super(key: key);

  @override
  State<OrderModeSettings> createState() => _OrderModeSettingsState();
}

class _OrderModeSettingsState extends State<OrderModeSettings> {
  static String cash = "Cash";
  static String payNow = "PayNow";
  static String pickup = "Pickup";
  static String delivery = "Delivery";
  final TextEditingController ref = new TextEditingController();
  final TextEditingController upi = new TextEditingController();

  String _selectedDelivery = pickup;
  String _selectedPayment = cash;

  List<String> _choices = [cash, payNow];
  List<String> _choicesDelivery = [pickup, delivery];
  @override
  void initState() {
    upi.text = BlocProvider.of<CartBloc>(context).shopId!.upi;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Settings"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Mode of Payment"),
              ),
              DropdownButton<String>(
                value: _selectedPayment,
                hint: Text('Please choose a mode of payment'),
                items: _choices.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? val) {
                  setState(() {
                    _selectedPayment = val!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Mode of Delivery"),
              ),
              DropdownButton<String>(
                hint: Text('Please choose a mode of delivery'),
                value: _selectedDelivery,
                items: _choicesDelivery.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? val) {
                  setState(() {
                    _selectedDelivery = val!;
                  });
                },
              ),
              _selectedPayment == payNow
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: upi,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.payment),
                          border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey[300]!),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(35.0),
                            ),
                          ),
                          hintText: "UPI ID",
                          labelText: "UPI ID",
                        ),
                      ),
                    )
                  : Container(),
              _selectedPayment == payNow
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: ref,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.format_list_numbered),
                          border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey[300]!),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(35.0),
                            ),
                          ),
                          hintText: "Reference Number",
                          labelText: "Reference Number",
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Payment? paymentType;
                      Delivery? deliveryType;
                      if (_selectedDelivery == pickup)
                        deliveryType = Delivery.pickup;
                      else
                        deliveryType = Delivery.delivery;
                      if (_selectedPayment == cash)
                        paymentType = Payment.cash;
                      else
                        paymentType = Payment.paid;
                      if (paymentType == Payment.paid) {
                        if (ref.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Reference number is required")));
                        } else{
                          
                          BlocProvider.of<CartBloc>(context).add(
                              CartEventCreateOrder(paymentType, deliveryType,
                                  ref: ref.text.toString()));
                        Navigator.pop(context);
                        }
                      } else {
                        BlocProvider.of<CartBloc>(context).add(
                            CartEventCreateOrder(paymentType, deliveryType));
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Proceed")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
