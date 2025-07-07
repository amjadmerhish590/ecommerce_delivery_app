import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:granddelivery/core/class/statusrequest.dart';
import 'package:granddelivery/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkUrl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print(responseBody);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
