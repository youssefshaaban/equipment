import 'package:equipment/features/home/custody_page_list.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageCustody extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final list=[
    S.of(context)!.equipmentPageNew,
    S.of(context)!.equipmentPageOpened,
    S.of(context)!.equipmentPageClosed,
    S.of(context)!.equipmentPageDeleted,
    S.of(context)!.equipmentPageFinished,
    S.of(context)!.equipmentPageRejected
    ];
   return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, index) {
          final title = list[index];
          return buildItemCustody(context, title,index);
        },
        itemCount: list.length,
      ),
    );

  }

  void selectCustody(BuildContext ctx,int index,String title) {
    Navigator.of(ctx).pushNamed(CustodyPageList.routeName,
        arguments: {'title': title
        ,'status':index
    });
  }
  Widget buildItemCustody(BuildContext context,String title, index){
    return InkWell(
      onTap: (){
        selectCustody(context, index, title);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 120,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}