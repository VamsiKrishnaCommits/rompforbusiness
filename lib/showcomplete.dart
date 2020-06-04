import 'package:flutter/material.dart';

class showcomplete extends StatefulWidget {
  List<DataRow> mostsold;
  showcomplete(this.mostsold);

  @override
  _showcompleteState createState() => _showcompleteState();
}

class _showcompleteState extends State<showcomplete> {
  List<DataRow> mostsold;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostsold=widget.mostsold;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Complete List",
      home: Scaffold(
        appBar: AppBar(title: Text("Complete List",style: TextStyle(
          color: Colors.purple
        ),),backgroundColor: Colors.white,)
        ,
        body: Container(
          width: double.infinity,
          child: DataTable(
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
    )
        ),
      ),
    );
  }
}
