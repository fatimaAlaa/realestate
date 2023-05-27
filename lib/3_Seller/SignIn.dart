import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInSeller extends StatefulWidget {
  const SignInSeller({Key? key}) : super(key: key);

  @override
  State<SignInSeller> createState() => _SignInSellerState();
}

class _SignInSellerState extends State<SignInSeller> {
  TextEditingController RealestateID = TextEditingController();
  TextEditingController FullName = TextEditingController();
  bool? check;
  List<dynamic> rsInfoData = [];
  String RS = "";
  String OwnerName = "";
  String location = "";
  String cityNumber = "";
  String streetNumber = "";
  String houseNumber = "";
  String LegalReservation = "";
  String ElectricityDebt = "";
  String WaterDebt = "";
  String MortgageforLoan = "";
  String MortgageforWarranty = "";
  String Infraction = "";
  String Status = "";

  Future SellerCheckData() async {
    String Url = "https://realestatecontract.000webhostapp.com/CheckSeller.php";
    var res = await http.post(Uri.parse(Url), headers: {
      "Accept": "application/json"
    }, body: {
      "RealestateNumber": RealestateID.text,
      "FullName": FullName.text,
    });
    var respBody = json.decode(res.body);
    print(respBody);
    if (respBody == "Match found") {
      check = true;
    } else if (respBody == "Match not found") {
      check = false;
    }
  }

  Future RSInfo() async {
    String Url = "https://realestatecontract.000webhostapp.com/Get_RSinfo.php";
    var res = await http.post(Uri.parse(Url), headers: {
      "Accept": "application/json"
    }, body: {
      "RealestateNumber": RealestateID.text,
      "FullName": FullName.text,
    });
    var respBody = json.decode(res.body);
    print(respBody);
    setState(() {
      rsInfoData = respBody as List<dynamic>;
    });
    if (rsInfoData.isNotEmpty) {
      var rsInfo = rsInfoData[0];
      OwnerName = rsInfo['[Owner Name]'];
      RS = rsInfo['[Realestate Number]'];
      cityNumber = rsInfo['[City Number]'];
      streetNumber = rsInfo['[Street Number]'];
      houseNumber = rsInfo['[House Number]'];
      location = '$cityNumber - $streetNumber - $houseNumber';
      LegalReservation = rsInfo['[Legal Reservation]'] == '1' ? 'Yes' : 'No';
      ElectricityDebt = rsInfo['[Electricity Debt]'] == '1' ? 'Yes' : 'No';
      WaterDebt = rsInfo['[Water Debt]'] == '1' ? 'Yes' : 'No';
      MortgageforLoan = rsInfo['[Mortgage for Loan]'] == '1' ? 'Yes' : 'No';
      MortgageforWarranty =
          rsInfo['[Mortgage for Warranty]'] == '1' ? 'Yes' : 'No';
      Infraction = rsInfo['Infraction'] == '1' ? 'Yes' : 'No';
    }
    if (LegalReservation == 'Yes' ||
        MortgageforWarranty == 'Yes' ||
        MortgageforLoan == 'Yes' ||
        Infraction == 'Yes') {
      Status = "Rejected";
    } else {
      Status = "Approved";
    }
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
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff167D7F),
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Images/Logo.png"),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 45,
                child: TextFormField(
                  controller: RealestateID,
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
                    labelText: "Real-estate Number",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
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
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 45,
                child: TextFormField(
                  controller: FullName,
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
                    labelText: "Full Name",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
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
              InkWell(
                onTap: () async {
                  await SellerCheckData();
                  await RSInfo();
                  if (check == true) {
                    showDialog(
                      useSafeArea: true,
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Color(0xff167D7F),
                        title: const Text(
                          "Realestate Details",
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Amiri',
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        titlePadding: const EdgeInsets.only(
                            left: 200, right: 200, top: 50, bottom: 10),
                        actions: [
                          Column(
                            children: [
                              Table(
                                children: [
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Realestate Number : ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        RS,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Owner Name : ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        OwnerName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Location : ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        location,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Electricity Debt:",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        ElectricityDebt,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Water Debt :",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        LegalReservation,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Legal Reservation :",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        LegalReservation,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Mortgage for Loan :",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        MortgageforLoan,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Mortgage for Warranty :",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        MortgageforWarranty,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Infraction :",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        Infraction,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Contract Status :",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 36,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        Status,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 36,
                                          fontFamily: 'Amiri',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 20, right: 20),
                              width: 80,
                              height: 40,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                  color: Color(0xff167D7F),
                                  fontSize: 22,
                                  fontFamily: 'Amiri',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      useSafeArea: true,
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          "Check Your Data Again!",
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
                  width: 100,
                  height: 40,
                  color: const Color(0xff167D7F),
                  alignment: Alignment.center,
                  child: const Text(
                    "Check",
                    style: TextStyle(
                      color: Color(0xffF4F6F5),
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
