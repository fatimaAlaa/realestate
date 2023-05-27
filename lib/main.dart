import 'package:flutter/material.dart';
import 'package:realestate/1_Home/HomePage.dart';
import 'package:realestate/2_Agent/Login.dart';
import 'package:realestate/2_Agent/Account.dart';
import 'package:realestate/2_Agent/Create_Contract/Seller_Information.dart';
import 'package:realestate/2_Agent/Create_Contract/Buyer_Information.dart';
import 'package:realestate/2_Agent/Create_Contract/Realestate_Information.dart';
import 'package:realestate/2_Agent/Create_Contract/Payment_Witness_Information.dart';
import 'package:realestate/3_Seller/ContractDetails.dart';
import 'package:realestate/3_Seller/SignIn.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SignInSeller(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
