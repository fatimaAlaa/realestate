import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:realestate/2_Agent/Create_Contract/Realestate_Information.dart';

class BuyerInfo extends StatefulWidget {
  final String AgentName;
  const BuyerInfo({
    required this.AgentName,
  });
  @override
  State<BuyerInfo> createState() => _BuyerInfoState();
}

class _BuyerInfoState extends State<BuyerInfo> {
  TextEditingController FirstName = TextEditingController();
  TextEditingController SecondName = TextEditingController();
  TextEditingController ThirdName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController IDNumber = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();

  Future BuyerData() async {
    String Url =
        "https://realestatecontract.000webhostapp.com/Post_BuyerInfo.php";
    var res = await http.post(Uri.parse(Url), headers: {
      "Accept": "application/json"
    }, body: {
      "FirstName": FirstName.text,
      "SecondName": SecondName.text,
      "ThirdName": ThirdName.text,
      "LastName": LastName.text,
      "IDNumber": IDNumber.text,
      "PhoneNumber": PhoneNumber.text
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
              const SizedBox(height: 10),
              const Text(
                "Buyer Information",
                style: TextStyle(
                  color: Color(0xff167D7F),
                  fontSize: 50,
                  fontFamily: 'Amiri',
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: 50,
                    color: Colors.white,
                    child: TextFormField(
                      controller: FirstName,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z]+')),
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
                        labelText: "First Name",
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
                    margin: const EdgeInsets.only(left: 5),
                    width: MediaQuery.of(context).size.width / 6,
                    height: 50,
                    color: Colors.white,
                    child: TextFormField(
                      controller: SecondName,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z]+')),
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
                        labelText: "Second Name",
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width / 6,
                    height: 50,
                    color: Colors.white,
                    child: TextFormField(
                      controller: ThirdName,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z]+')),
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
                        labelText: "Third Name",
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
                    margin: const EdgeInsets.only(top: 20, left: 5),
                    width: MediaQuery.of(context).size.width / 6,
                    height: 50,
                    color: Colors.white,
                    child: TextFormField(
                      controller: LastName,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z]+')),
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
                        labelText: "Last Name",
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
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                color: Colors.white,
                child: TextFormField(
                  controller: IDNumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
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
                    labelText: "ID Number",
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
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                color: Colors.white,
                child: TextFormField(
                  controller: PhoneNumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  cursorColor: const Color(0xff167D7F),
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Amiri',
                  ),
                  decoration: InputDecoration(
                    prefixText: '+964 ',
                    prefixStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Amiri',
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff167D7F)),
                    ),
                    labelText: "Phone Number",
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
                      BuyerData();
                      if (FirstName.text.isNotEmpty &&
                          SecondName.text.isNotEmpty &&
                          ThirdName.text.isNotEmpty &&
                          LastName.text.isNotEmpty &&
                          IDNumber.text.isNotEmpty &&
                          PhoneNumber.text.isNotEmpty) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RealestateInfo(
                                AgentName: '${widget.AgentName}'),
                          ),
                        );
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
                      FirstName.text = "";
                      SecondName.text = "";
                      ThirdName.text = "";
                      LastName.text = "";
                      IDNumber.text = "";
                      PhoneNumber.text = "";
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      color: const Color(0xff167D7F),
                      alignment: Alignment.center,
                      child: const Text(
                        "Next",
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
