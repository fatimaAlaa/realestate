import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:realestate/1_Home/HomePage.dart';
import 'package:realestate/2_Agent/Create_Contract/Seller_Information.dart';

class AccountDetails extends StatefulWidget {
  final String AgentName;
  const AccountDetails({super.key,
    required this.AgentName,
  });
  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  bool hover = false;
  List<dynamic> RS_Number = [];

  Future getRSNumber() async {
    var url = "https://realestatecontract.000webhostapp.com/Get_RSNumber.php";
    http.Response response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    }, body: {
      "AgentName": widget.AgentName,
    });
    var data = jsonDecode(response.body);
    setState(() {
      RS_Number =
          data.map((item) => item['[Realestate Number]'] as String).toList();
    });
    print(RS_Number);
  }

  void initState() {
    super.initState();
    getRSNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF4F6F5),
        iconTheme: const IconThemeData(
          color: Color(0xff167D7F),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 20, top: 5),
          child: Row(
            children: [
              Icon(Icons.person, size: 20),
              SizedBox(width: 5),
              Text(
                "${widget.AgentName}",
                style: const TextStyle(
                  color: Color(0xff167D7F),
                  fontSize: 22,
                  fontFamily: 'Amiri',
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Container(
              width: 80,
              height: 20,
              alignment: Alignment.center,
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xff167D7F),
                  fontSize: 20,
                  fontFamily: 'Amiri',
                ),
              ),
            ),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
            child: Table(
              border: const TableBorder(
                //horizontalInside: BorderSide(color: Colors.grey, width: 2),
                verticalInside: BorderSide(color: Colors.grey),
              ),
              children: const [
                TableRow(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide()),
                        color: Color(0xff167D7F)),
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Realestate Number",
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
                          "Status",
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
                          "Contract",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontFamily: 'Amiri',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: _buildRowView(RS_Number),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 90,
        width: 90,
        margin: const EdgeInsets.all(15),
        child: FittedBox(
          child: FloatingActionButton(
            tooltip: "Add New Contract",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      SellerInfo(AgentName: '${widget.AgentName}'),
                ),
              );
            },
            child: const Icon(Icons.add),
            backgroundColor: const Color(0xff167D7F),
          ),
        ),
      ),
    );
  }

  Widget _buildRowView(List<dynamic> RS_Number) {
    List<TableRow> rows = [];
    for (int i = 0; i < RS_Number.length; i++) {
      rows.add(
        TableRow(
          decoration: const BoxDecoration(color: Color(0xffF4F6F5)),
          children: [
            Text(
              RS_Number[i],
              style: const TextStyle(
                color: Color(0xff167D7F),
                fontSize: 26,
                fontFamily: 'Amiri',
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Pending",
                style: TextStyle(
                  color: Color(0xff167D7F),
                  fontSize: 26,
                  fontFamily: 'Amiri',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const LoginPage()));
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 150,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        //color: Colors.black.withOpacity(0.3),
                        border: Border.all(color: const Color(0xff167D7F)),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      "View",
                      style: TextStyle(
                        color: Color(0xff167D7F),
                        fontSize: 22,
                        fontFamily: 'Amiri',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Table(
      border: const TableBorder(
        verticalInside: BorderSide(color: Colors.grey),
      ),
      children: rows,
    );
  }
}
