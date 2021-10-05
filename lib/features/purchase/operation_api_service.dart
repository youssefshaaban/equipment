

import 'dart:convert';
import 'dart:io';

import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OperationApiService {

  Future<CustodyOper> addOperation(BuildContext context,CustodyOper oper)async{
    var url = Uri.parse("http://abuzaidwf-001-site4.etempurl.com/api/CustodyApi/SubmitOperations");
    var response=await http.post(url,
    body: json.encode({
      "OperAmount":oper.operAmount,
      "OperDetails":oper.operDetails,
      "CustodyId":oper.custodyId,
      "InvoiceNumber":oper.invoiceNumber,
      "DriverUserId":oper.driverUserId,
    }),
        headers: {
          // HttpHeaders.authorizationHeader: 'Basic $authToken',
          HttpHeaders.contentTypeHeader: "application/json"
        }
    );

      var jsonResults=jsonDecode(response.body);
      CustodyOper custodyOper;
      var data = jsonResults;
      custodyOper=CustodyOper.fromJson(data);
      return custodyOper;



  }

}