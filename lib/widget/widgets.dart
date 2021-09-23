
import 'package:flutter/material.dart';

Widget createText(String title,double size){
  return Text(title,style:TextStyle(fontSize:size,color:Colors.black,fontWeight: FontWeight.bold));
}

Widget customEditText({double? circular,String? label,String? hint , TextEditingController? controller ,
  bool? isTextArea ,double? height  ,bool? isEnabled , TextInputType? keyboardType,int? maxLines,double? width} ){
    return TextField(
        keyboardType: keyboardType ?? TextInputType.multiline,
        controller: controller,
        enabled: isEnabled ?? true,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          hintStyle: TextStyle(fontSize: 14,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circular??0),
          ),
        ),
        maxLines:maxLines?? 5,
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

Widget customCard(double height,double width){
 return
   Container(

     width: width,
     height: height,
     child: Card(
       elevation: 6,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(15.0),
       ),
       borderOnForeground: true,
       color: Colors.grey,
     ),
   );
}

Widget customCard1({double? height,double? width,Function()? onTap,
Widget? widget,double? circular,Color? color,double? elevation,double? borderWidth}){
  return
    Container(

      width: width ??50,
      height: height ??50,
      child: InkWell(
        onTap:onTap ?? null,
        child: Card(
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: borderWidth?? 0),
            borderRadius: BorderRadius.circular(circular??10),
          ),
          borderOnForeground: true,
          color: color?? Colors.grey,
          child:Center(child:widget ?? null),
        ),
      ),
    );
}

Widget customEditText1({String? hint , TextEditingController? controller , bool? isTextArea , bool? isEnabled , TextInputType? keyboardType} ) {
  return Container(
    height: isTextArea != null ? 120 : 50,
    child: TextFormField(
      keyboardType: keyboardType ?? TextInputType.multiline,
      controller: controller,
      enabled: isEnabled ?? true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      maxLines: isTextArea != null ? 20 : 1,
    ),
  );
}