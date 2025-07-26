import 'package:flutter/material.dart';

void main () {
  runApp(MainApp());
  }

class MainApp extends StatefulWidget {

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displayText = "No Text Data";

  List<String> tasklist = [];
TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize any data or state here if needed
  }

  @override
  void dispose() {
    textController.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("To-Do List"),
          backgroundColor: Colors.blue
        ),
        body: Column(
          children: [


            Row(
              children: [
           Expanded(
            child:  Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Enter a task"),)
            ),
            ),
           ),

            MaterialButton(
              color:Colors.black ,
              height: 55, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {

                setState(() {
                   tasklist.add(textController.text);
                   textController.clear(); 
                });
                  // This will trigger a rebuild of the widget tree
              },
            child: Text("Add"), textColor:(Colors.white) ,
            ),
              ],
            ),
            
Flexible(
  child: ListView.builder(
    itemCount: tasklist.length,
    itemBuilder: (context, index) {
      return Row(children: [
                 Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                                   child: Text(tasklist[index]),
                    ),
                  ),
                  MaterialButton(
                    child:Icon(
                      Icons.delete,
                    color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        
                      });
                      tasklist.removeAt(index);
                    },
                  ),
                ]);
      
    }, 
    ),
),

          ],
        ),
      ),
    );
  }
}