import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:realestate/2_Agent/Account.dart';

class WitnessPayment extends StatefulWidget {
  final String AgentName;
  WitnessPayment({
    required this.AgentName,
  });

  @override
  State<WitnessPayment> createState() => _WitnessPaymentState();
}

class _WitnessPaymentState extends State<WitnessPayment> {
  TextEditingController FirstWitness = TextEditingController();
  TextEditingController SecondWitness = TextEditingController();
  TextEditingController DownPayment = TextEditingController();
  TextEditingController FullPrice = TextEditingController();
  String? Agent;
  @override
  // void initState() {
  //   super.initState();
  //   Agent = widget.AgentName;
  //   print(Agent);
  // }

  Future PayWitness() async {
    String Url = "https://realestatecontract.000webhostapp.com/Contract.php";
    var res = await http.post(Uri.parse(Url), headers: {
      "Accept": "application/json"
    }, body: {
      "AgentName": widget.AgentName,
      "DownPayment": DownPayment.text,
      "Price": FullPrice.text,
      "FirstWitnessName": FirstWitness.text,
      "SecondWitnessName": SecondWitness.text,
    });
    var respBody = json.decode(res.body);
    print(respBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F5),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 1.2,
          decoration: BoxDecoration(
              color: const Color(0xffF4F6F5),
              border: Border.all(color: const Color(0xff167D7F)),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurStyle: BlurStyle.inner,
                    spreadRadius: 3,
                    blurRadius: 20,
                    offset: Offset(3, 5))
              ]),
          child: Column(
            children: [
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: 125),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Payment Information",
                    style: TextStyle(
                      color: Color(0xff167D7F),
                      fontSize: 40,
                      fontFamily: 'Amiri',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                color: Colors.white,
                child: TextFormField(
                  controller: DownPayment,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  cursorColor: const Color(0xff167D7F),
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Amiri',
                  ),
                  decoration: InputDecoration(
                    suffix: const Text(
                      "IQD",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff167D7F)),
                    ),
                    labelText: "Down Payment",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Amiri',
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xff167D7F),
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                color: Colors.white,
                child: TextFormField(
                  controller: FullPrice,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  cursorColor: const Color(0xff167D7F),
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Amiri',
                  ),
                  decoration: InputDecoration(
                    suffix: const Text(
                      "IQD",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff167D7F)),
                    ),
                    labelText: "Full Price",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Amiri',
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xff167D7F),
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 125, top: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Witness Information",
                    style: TextStyle(
                      color: Color(0xff167D7F),
                      fontSize: 40,
                      fontFamily: 'Amiri',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                color: Colors.white,
                child: TextFormField(
                  controller: FirstWitness,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+')),
                  ],
                  keyboardType: TextInputType.number,
                  cursorColor: const Color(0xff167D7F),
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Amiri',
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff167D7F)),
                    ),
                    labelText: "First Witness Name",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Amiri',
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xff167D7F),
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                color: Colors.white,
                child: TextFormField(
                  controller: SecondWitness,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+')),
                  ],
                  cursorColor: const Color(0xff167D7F),
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Amiri',
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff167D7F)),
                    ),
                    labelText: "Second Witness Name",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Amiri',
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xff167D7F),
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      color: const Color(0xff167D7F),
                      alignment: Alignment.center,
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          color: Color(0xffF4F6F5),
                          fontSize: 22,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      PayWitness();
                      if (FirstWitness.text.isNotEmpty &&
                          SecondWitness.text.isNotEmpty &&
                          DownPayment.text.isNotEmpty &&
                          FullPrice.text.isNotEmpty) {
                        showDialog(
                          useSafeArea: true,
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              "Information has been sent",
                              style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'Amiri',
                                color: Color(0xff167D7F),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            titlePadding: const EdgeInsets.only(
                              left: 25,
                              right: 50,
                              top: 50,
                              bottom: 10,
                            ),
                            content: const Text(
                              "It will be checked as SOON as possible",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Amiri',
                                color: Color(0xff167D7F),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 25,
                              right: 50,
                              bottom: 50,
                            ),
                            actions: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  color: const Color(0xff167D7F),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(
                                      color: Color(0xffF4F6F5),
                                      fontSize: 22,
                                      fontFamily: 'Amiri',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).then((_) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AccountDetails(
                                  AgentName: '${widget.AgentName}'),
                            ),
                          );
                        });
                      } else {
                        showDialog(
                          useSafeArea: true,
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              "Make sure No Field is EMPTY",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Amiri',
                                  color: Color(0xff167D7F)),
                              textAlign: TextAlign.left,
                            ),
                            titlePadding: const EdgeInsets.only(
                                left: 25, right: 50, top: 50, bottom: 25),
                            actions: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  color: const Color(0xff167D7F),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(
                                      color: Color(0xffF4F6F5),
                                      fontSize: 22,
                                      fontFamily: 'Amiri',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      color: const Color(0xff167D7F),
                      alignment: Alignment.center,
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Color(0xffF4F6F5),
                          fontSize: 22,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
