
import 'package:flutter/material.dart';

Widget createText(String title,double size){
  return Text(title,style:TextStyle(fontSize:size,color:Colors.black,fontWeight: FontWeight.bold));
}

Widget customEditText({String? hint , TextEditingController? controller ,
  bool? isTextArea ,double? height  ,bool? isEnabled , TextInputType? keyboardType,int? maxLines,double? width} ){
  return  Container(
    height:height,
    width: width,
    child: TextFormField(
      keyboardType: keyboardType ?? TextInputType.multiline,
      controller: controller,
      enabled: isEnabled ?? true,

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      maxLines:maxLines?? 5,
    ),
  );
}


customSnackBar(BuildContext context, {String msg = ""}) {
  final snackBar = SnackBar(
    duration: const Duration(milliseconds: 1500),
    backgroundColor: Colors.black54.withOpacity(0.8),
    padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0// Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    content: Row(
      children: [
        Icon(Icons.error , size: 24, color: Colors.white,),
        const SizedBox(width:5),
        Flexible(child: Text(msg , maxLines: 2, style: TextStyle(fontSize: 18), ),),
      ],
    ), /*behavior: SnackBarBehavior.floating,*/
  );

  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}