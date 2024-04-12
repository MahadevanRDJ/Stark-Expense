import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:stark_expense/resource/app_constant.dart';
import 'package:stark_expense/resource/string_resource.dart';

import '../model/product_response.dart' '';
import '../model/user_response.dart';

class TransactionService {
  final String _transactionHistoryUrl = "https://dummyjson.com";
  final String _transactionPath = "/products";
  final String _usersPath = "/users?limit=12";

  static final TransactionService _sInstance =
      TransactionService._privateConstructor();

  TransactionService._privateConstructor();

  static TransactionService getInstance() {
    return _sInstance;
  }

  Future<Products> getProduct() async {
    final response = await http.get(
        Uri.parse(_transactionHistoryUrl + _transactionPath),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      Products product = Products.fromJson(jsonDecode(response.body));
      log("Success");
      return product;
    } else {
      log("Failed");
      throw (StringResource.sErrorResponse);
    }
  }

  Future<People> getAllPeople() async {
    final response = await http.get(
        Uri.parse(_transactionHistoryUrl + _usersPath),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    if (response.statusCode == 200) {
      People people = People.fromJson(jsonDecode(response.body));
      log(people.toString());
      AppConstant.people = people;
      return people;
      // flag = true;
    } else {
      throw ('Error while getting people from Internet.');
    }
  }
}
