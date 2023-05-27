import 'package:flutter/material.dart';
import 'package:realestate/2_Agent/Login.dart';
import 'package:realestate/3_Seller/SignIn.dart';
import 'package:realestate/4_Buyer/SignIn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hoverA = false;
  bool hoverS = false;
  bool hoverB = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Images/BG1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.01),
          elevation: 0,
          toolbarHeight: 90,
          title: Column(
            children: const [
              // Padding(
              //   padding: const EdgeInsets.only(left: 60),
              //   child: Row(
              //     children: const [
              //       Text(
              //         "Home",
              //         style: TextStyle(
              //           color: Color(0xff167D7F),
              //           fontSize: 18,
              //           fontFamily: 'Amiri',
              //         ),
              //       ),
              //       SizedBox(width: 60),
              //       Text(
              //         "About System",
              //         style: TextStyle(
              //           color: Color(0xff167D7F),
              //           fontSize: 18,
              //           fontFamily: 'Amiri',
              //         ),
              //       ),
              //       SizedBox(width: 60),
              //       Text(
              //         "Contact",
              //         style: TextStyle(
              //           color: Color(0xff167D7F),
              //           fontSize: 18,
              //           fontFamily: 'Amiri',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Divider(color: Color(0xff167D7F)),
            ],
          ),
          leadingWidth: 200,
          leading: Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Images/Logo.png"), fit: BoxFit.cover),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 120, top: 180),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                borderRadius: BorderRadius.circular(20),
                hoverColor: const Color(0xff167D7F),
                onHover: (value) {
                  setState(() {
                    hoverA = !hoverA;
                  });
                },
                child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        //color: Colors.black.withOpacity(0.3),
                        border: Border.all(color: const Color(0xff167D7F)),
                        borderRadius: BorderRadius.circular(20)),
                    child: hoverA
                        ? const Text(
                            "Agent",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Amiri',
                            ),
                          )
                        : const Text(
                            "Agent",
                            style: TextStyle(
                              color: Color(0xff167D7F),
                              fontSize: 30,
                              fontFamily: 'Amiri',
                            ),
                          )),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignInSeller()));
                },
                borderRadius: BorderRadius.circular(20),
                hoverColor: const Color(0xff167D7F),
                onHover: (value) {
                  setState(() {
                    hoverS = !hoverS;
                  });
                },
                child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        //color: Colors.black.withOpacity(0.3),
                        border: Border.all(color: const Color(0xff167D7F)),
                        borderRadius: BorderRadius.circular(20)),
                    child: hoverS
                        ? const Text(
                            "Seller",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Amiri',
                            ),
                          )
                        : const Text(
                            "Seller",
                            style: TextStyle(
                              color: Color(0xff167D7F),
                              fontSize: 30,
                              fontFamily: 'Amiri',
                            ),
                          )),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
                borderRadius: BorderRadius.circular(20),
                hoverColor: const Color(0xff167D7F),
                onHover: (value) {
                  setState(() {
                    hoverB = !hoverB;
                  });
                },
                child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        //color: Colors.black.withOpacity(0.3),
                        border: Border.all(color: const Color(0xff167D7F)),
                        borderRadius: BorderRadius.circular(20)),
                    child: hoverB
                        ? const Text(
                            "Buyer",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Amiri',
                            ),
                          )
                        : const Text(
                            "Buyer",
                            style: TextStyle(
                              color: Color(0xff167D7F),
                              fontSize: 30,
                              fontFamily: 'Amiri',
                            ),
                          )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
