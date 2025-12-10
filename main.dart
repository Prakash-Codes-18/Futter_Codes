import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatefulWidget {

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  TextEditingController t=TextEditingController();

  List<String> tasklist=[];

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor:Colors.blue,title:Text("To Do List",style:TextStyle(color:Colors.white),),),

        body:Column(children: [
          
          Row(children: [
                Expanded(child:
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(controller:t,decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Enter a Task")),
            ),
          ),
        ),

           MaterialButton(
            color:Colors.white,
            //height: 50,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: (){
              setState(() {
                tasklist.add(t.text);
                t.clear();
              });
              
      },
      child: Text("Add"),
      ),

          ],
          ),

        
        
         Flexible(
           child: ListView.builder(
            itemCount: tasklist.length,
            itemBuilder: (context,index){
           
           return Row(children: [Expanded(
            child:Container(
            padding:EdgeInsets.all(10),
            child:Text(tasklist[index]),
            ),
           
                   ),
           

                   MaterialButton(
            child:Icon(Icons.delete,
            color:Colors.red,
            ),
            onPressed: (){
                     
                     setState(() {
                       
                       tasklist.removeAt(index);

                     });

                   }
                   )
           
                   ],);
            }
         ),

         ),
        
        ],
        
        ),

           ),
      
    

      
    );
  }
}

       

   
