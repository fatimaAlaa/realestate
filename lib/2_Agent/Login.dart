import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:realestate/1_Home/HomePage.dart';
import 'package:realestate/2_Agent/Account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController UserName = TextEditingController();
  TextEditingController Password = TextEditingController();
  String Agent = "";
  bool check = false;

  List<dynamic> Usernames = [];
  List<dynamic> Passwords = [];
  List<dynamic> AgentName = [];

  Future getusernameData() async {
    var url = "https://realestatecontract.000webhostapp.com/Get_Username.php";
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var data = jsonDecode(response.body);
    Usernames = data.map((item) => item['username'] as String).toList();
    print(Usernames);
  }

  Future getpasswordData() async {
    var url = "https://realestatecontract.000webhostapp.com/Get_Password.php";
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var data = jsonDecode(response.body);
    Passwords = data.map((item) => item['password'] as String).toList();
    print(Passwords);
  }

  Future getAgentname() async {
    var url = "https://realestatecontract.000webhostapp.com/Get_AgentName.php";
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var data = jsonDecode(response.body);
    AgentName = data
        .map((item) =>
            item['CONCAT(`[First Name]`," ",`[Second Name]`)'] as String)
        .toList();
    //print(AgentName);
  }

  @override
  void initState() {
    super.initState();
    getusernameData();
    getpasswordData();
    getAgentname();
  }

  bool isAuthenticated(String username, String password) {
    for (int i = 0; i < Usernames.length; i++) {
      if (username == Usernames[i] && password == Passwords[i]) {
        Agent = AgentName[i];
        return true;
      }
    }
    return false;
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
                  controller: UserName,
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
                    labelText: "Uesername",
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
                  controller: Password,
                  cursorColor: const Color(0xff167D7F),
                  obscureText: !check,
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
                    labelText: "Password",
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
              Padding(
                padding: const EdgeInsets.only(left: 168, top: 10),
                child: CheckboxListTile(
                  selected: check,
                  value: check,
                  onChanged: (val) {
                    setState(() {
                      check = val!;
                    });
                  },
                  title: const Text(
                    "Show Password",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                  activeColor: const Color(0xff167D7F),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  if (isAuthenticated(UserName.text, Password.text)) {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AccountDetails(
                          AgentName: '$Agent',
                        ),
                      ),
                    );
                    UserName.text = "";
                    Password.text = "";
                  } else {
                    showDialog(
                      useSafeArea: true,
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          "Error",
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Amiri',
                              color: Colors.red),
                          textAlign: TextAlign.left,
                        ),
                        titlePadding: const EdgeInsets.only(
                            left: 25, right: 50, top: 50, bottom: 10),
                        content: const Text(
                          "Please check your Username or Password",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Amiri',
                              color: Color(0xff167D7F)),
                          textAlign: TextAlign.left,
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 25, right: 50, bottom: 50),
                        actions: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 80,
                              height: 40,
                              color: Color(0xff167D7F),
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
                  width: 150,
                  height: 50,
                  color: const Color(0xff167D7F),
                  alignment: Alignment.center,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xffF4F6F5),
                      fontSize: 18,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
