import 'package:flutter/material.dart';
import 'package:polynotepad/local_db/db_helper.dart';
import 'package:polynotepad/views/edit_screen.dart';

class Customlist extends StatefulWidget {
  const Customlist({super.key});

  @override
  State<Customlist> createState() => _CustomlistState();
}

class _CustomlistState extends State<Customlist> {
  List item=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readDatabase();
  }

  void readDatabase()async{
    final Datalist= await DbHelper().readData();
    print(Datalist);
    setState(() {
      item.addAll(Datalist);
    });
  }
  // void readDatabase() async {
  //   try {
  //     final Datalist = await DbHelper().readData();
  //     print("Fetched Data: $Datalist"); // Print the fetched data
  //     setState(() {
  //       item.addAll(Datalist ?? []); // Ensure non-null value
  //     });
  //   } catch (e) {
  //     print("Error reading database: $e"); // Catch any errors
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child:item.isEmpty
          ? Center(child: Text('No data available')) // Display if no data
          :  ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Set rounded corners for the card
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[200],
                    borderRadius: BorderRadius.circular(15), // Set border radius
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      child: Text(
                        "T",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                      title: Text("${item[index]["title"]}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    subtitle: Text("${item[index]["description"]}"),

                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreen()));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
