import 'dart:js_util';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:realestate/2_Agent/Account.dart';
import 'package:realestate/2_Agent/Create_Contract/Payment_Witness_Information.dart';

class RealestateInfo extends StatefulWidget {
  final String AgentName;
  RealestateInfo({
    required this.AgentName,
  });
  @override
  State<RealestateInfo> createState() => _RealestateInfoState();
}

class _RealestateInfoState extends State<RealestateInfo> {
  TextEditingController RSID = TextEditingController();
  TextEditingController CityNumber = TextEditingController();
  TextEditingController StreetNumber = TextEditingController();
  TextEditingController HouseNumber = TextEditingController();
  TextEditingController Area = TextEditingController();

  @override
  Future REData() async {
    String Url =
        "https://realestatecontract.000webhostapp.com/Post_RealestateInfo.php";
    var res = await http.post(Uri.parse(Url), headers: {
      "Accept": "application/json"
    }, body: {
      "RSID": RSID.text,
      "CityNumber": CityNumber.text,
      "StreetNumber": StreetNumber.text,
      "HouseNumber": HouseNumber.text,
      "Area": Area.text,
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
                "Real-estate Information",
                style: TextStyle(
                  color: Color(0xff167D7F),
                  fontSize: 50,
                  fontFamily: 'Amiri',
                ),
              ),
              const Spacer(),
              Container(
                // margin: const EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                color: Colors.white,
                child: TextFormField(
                  controller: RSID,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                    LengthLimitingTextInputFormatter(10),
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
                    hintText: "e.g 4444/44/4",
                    labelText: "Real-estate ID Number",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 9.5,
                    height: 50,
                    color: Colors.white,
                    child: TextFormField(
                      controller: CityNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
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
                        labelText: "City Number",
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
                    margin: const EdgeInsets.only(top: 40, left: 15, right: 15),
                    width: MediaQuery.of(context).size.width / 9.5,
                    height: 50,
                    color: Colors.white,
                    child: TextFormField(
                      controller: StreetNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
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
                        labelText: "Street Number",
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
                    margin: const EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 9.5,
                    height: 50,
                    color: Colors.white,
                    child: TextFormField(
                      controller: HouseNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
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
                        labelText: "House Number",
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
                margin: const EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                color: Colors.white,
                child: TextFormField(
                  controller: Area,
                  keyboardType: TextInputType.number,
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
                      "m/s",
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
                    labelText: "Area",
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
                      REData();
                      if (RSID.text.isNotEmpty &&
                          CityNumber.text.isNotEmpty &&
                          StreetNumber.text.isNotEmpty &&
                          HouseNumber.text.isNotEmpty &&
                          Area.text.isNotEmpty) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WitnessPayment(
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
                      RSID.text = "";
                      CityNumber.text = "";
                      StreetNumber.text = "";
                      HouseNumber.text = "";
                      Area.text = "";
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
