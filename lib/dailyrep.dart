import 'package:flut/showcomplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodaysRepor extends StatefulWidget {
  Map<dynamic,dynamic> info;
  TodaysRepor(this.info);
  @override
  _TodaysReporState createState() => _TodaysReporState();
}
class _TodaysReporState extends State<TodaysRepor> {
  List<DataRow> mostsold=List();
  List<DataRow> itemcount=List();
  var fut;
  var fut2;
  String totalrevenue;
  String totalsales;
  @override
  void initState(){
    totalsales=widget.info["DailyTotal"].toString();
    totalrevenue=widget.info["DailyTotalSales"].toString();
    // TODO: implement initState
    super.initState();
      Map<dynamic,dynamic> aa=widget.info["DailyItemsSpent"];
      aa.forEach((key, value) {
        mostsold.add(new DataRow(
            cells: [
              DataCell(
                  Text(key.toString())
              ),
              DataCell(
                  Text(value.toString())
              )
            ]
        ));
      });


  }

  @override
  Widget build(BuildContext context) {
    print(mostsold);
    return
      MaterialApp(
      title:"DailyReport",
      home: Scaffold(
        appBar: AppBar(title: Text("Report",style:TextStyle(
          color: Colors.purple
        )),backgroundColor: Colors.white,),

      body:
      Container(
        child:SingleChildScrollView(  child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
              SizedBox(height: 30,),
              Center(child:
              Text("Today's Revenue",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              Text(totalrevenue,style: TextStyle(fontSize: 90,color: Colors.purple),),
              SizedBox(height: 30,),
              Center(child:  Text("Today's sales",style: TextStyle(fontSize:20,fontWeight :  FontWeight.bold),)),
              SizedBox(height: 10,),
              Text(totalsales,style: TextStyle(fontSize: 60,color: Colors.purple),),
              SizedBox(height: 30,),
              Center(child:  Text("Today's Profit",style: TextStyle(fontSize:20,fontWeight :  FontWeight.bold),)),
              SizedBox(height: 10,),
              Text("123445",style: TextStyle(fontSize: 60,color: Colors.purple),),
              SizedBox(height: 30,),
              Center(child:  Text("Most Sold Today",style: TextStyle(fontSize:20,fontWeight :  FontWeight.bold),)),
              SizedBox(height: 20,),
              FractionallySizedBox(
                  widthFactor: 5/6,
                  child:
                  DataTable(
                    rows: mostsold,
                    columns: [
                      DataColumn(
                          label: Text("Itemname"),
                          numeric: false
                      ),
                      DataColumn(
                          label: Text("number"),
                          numeric: false
                      )
                    ],
                  )),
              RaisedButton(
                child: Text("See all items"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>showcomplete(mostsold)));
                },
              ),

            ])
    ))));
  }



}

class ItemsSpent {
  String name;
  int count;
  ItemsSpent(dynamic key,dynamic value){
    this.name=key;
    this.count=value;
  }



}
