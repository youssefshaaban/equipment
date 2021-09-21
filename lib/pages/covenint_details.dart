
import 'package:equipment/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CovenantDetails extends StatefulWidget {
  const CovenantDetails({Key? key}) : super(key: key);

  @override
  _CovenantDetailsState createState() => _CovenantDetailsState();
}

class _CovenantDetailsState extends State<CovenantDetails> {

  TextEditingController custodyNumber=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController cost=TextEditingController();
  TextEditingController residual=TextEditingController();
  TextEditingController state=TextEditingController();
  TextEditingController processNumber=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: createText('تفاصيل العهد', 17),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children:<Widget>[
                createText('تفاصيل العهد', 20),
                const SizedBox(height: 20,),
                Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children:<Widget>[
                    createText("رقم العهدة:", 15),
                    const SizedBox(width: 3,),
                    customEditText(isEnabled: false,hint: 'رقم العهدة',height: 40,width: 120,controller: custodyNumber),
                    const SizedBox(width: 40,),
                    createText("التاريخ:", 15),
                    const SizedBox(width: 3,),
                    customEditText(isEnabled: false,hint: 'التاريخ',height: 40,width: 120,controller: date)
                  ],
                ),
                const SizedBox(height:25,),
                Padding(
                  padding: const EdgeInsets.only(right: 21),
                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children:<Widget>[
                      createText("المبلغ:", 15),
                      const SizedBox(width: 3,),
                      customEditText(hint: 'المبلغ',height: 40,width: 120,controller:cost),
                      const SizedBox(width: 40,),
                      createText("المتبقي:", 15),
                      const SizedBox(width: 3,),
                      customEditText(hint: 'المتبقي',height: 40,width: 120,controller:residual)
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children:<Widget>[
                      createText("الحاله:", 15),
                      const SizedBox(width: 3,),
                      customEditText(hint: 'الحاله',height: 40,width: 120,controller:state),
                      const SizedBox(width: 17,),
                      createText("عدد العمليات:", 15),
                      const SizedBox(width: 3,),
                      customEditText(hint: 'عدد العمليات',height: 40,width: 120,controller: processNumber)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                customCard1(width:500, height:400, circular:10, color:Colors.grey,elevation: 10),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    Icon(Icons.add,color:Colors.black,size:30),
                    customCard1(borderWidth: 1,height:40, width:100, onTap:_save,widget:createText('إضافة عملية شراء',15), circular:5,color: Colors.white,elevation: 10),
                    const SizedBox(width: 30,),
                    Icon(Icons.add,color:Colors.black,size:30),
                    customCard1(borderWidth: 1,height:40, width:100, onTap:_calculate,widget:createText('رفع للحسابات',15), circular:5,color: Colors.white,elevation: 10),
                    const SizedBox(width: 30,),
                    Icon(Icons.close,color:Colors.black,size:30),
                    customCard1(borderWidth: 1,height:40, width:100, onTap:_close,widget:createText('رفع للحسابات',15), circular:5,color: Colors.white,elevation: 10),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _save() {
    print('save');
  }

  _calculate(){

  }
  _close(){

  }
}
