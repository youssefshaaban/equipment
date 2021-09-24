

import 'package:flutter/cupertino.dart';

class Details{
  int? custodyNumber;
  DateTime? date;
  double? cost;
  String? description;

  Details({this.custodyNumber,this.date,this.cost, this.description});


}

final List<Details> detailsList=
[
  Details(custodyNumber: 1,date:DateTime.now() ,cost:200,description: 'description of the process'),
  Details(custodyNumber: 1,date:DateTime.now() ,cost:200,description: 'description of the process'),
  Details(custodyNumber: 1,date:DateTime.now() ,cost:200,description: 'description of the process'),
  Details(custodyNumber: 1,date:DateTime.now() ,cost:200,description: 'description of the process'),
  Details(custodyNumber: 1,date:DateTime.now() ,cost:200,description: 'description of the process'),
  Details(custodyNumber: 1,date:DateTime.now() ,cost:200,description: 'description of the process'),
];


List<Image> imageNetwork=[];
