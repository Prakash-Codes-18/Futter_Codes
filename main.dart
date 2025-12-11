import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MainPage()) );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body:Column(children: [
      Container(
        color:Colors.redAccent,
        height:MediaQuery.of(context).size.height/2,
        width: double.infinity,
        child:MaterialButton(
          color:Colors.white,
          shape: CircleBorder(),
          height:25,
          minWidth:25,
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> SecondPage()));
          },
          child:Text("START"))
      ),

      Container(
        color:Colors.blueAccent,
        height:MediaQuery.of(context).size.height/2,
         width: double.infinity,
         child:MaterialButton(
          color:Colors.white,
          shape: CircleBorder(),
          height:25,
          minWidth:25,
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> SecondPage()));
          },
          child:Text("START"))
      )
    ],),


   );

  }
}

class SecondPage extends StatefulWidget{
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double bluecard=0;
  double redcard=0;

  double playerBscore=0;
  double playerAscore=0;

  bool initialized=false;

  @override
  Widget build(BuildContext context) {

  if(initialized == false){
      bluecard=MediaQuery.of(context).size.height/2;
      redcard=MediaQuery.of(context).size.height/2;

      initialized = true;
  }

   return Scaffold(
   body:Column(children: [
    MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: (){
        setState(() {
          bluecard=bluecard+30;
          redcard=redcard-30;
          playerBscore=playerBscore+5;
        });

        double screenheight = MediaQuery.of(context).size.height;
        double winningheight = MediaQuery.of(context).size.height-60;

        if(bluecard>winningheight){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>resultpage(playerBscore,"Player B Won")));
        }


      },
      child: Container(
        child: Row(children: [
          Expanded(child: 
          Text("Player B",
          style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)
          )),
          Text(playerBscore.toString(),
          style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
        ],),
        color:Colors.blueAccent,
        alignment: Alignment.topLeft,
        width:double.infinity,
        height:bluecard,
      ),
    ),


     MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: (){
        setState(() {
          redcard=redcard+30;
          bluecard=bluecard-30;
          playerAscore=playerAscore+5;
        });

        double screenheight = MediaQuery.of(context).size.height;
        double winningheight = MediaQuery.of(context).size.height-60;

        if(redcard>winningheight){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>resultpage(playerAscore,"Player A Won")
          ));
        }


      },
       child: Container(
        child:Row(children: [
          Expanded(child: 
          Text("Player A",
          style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)
          )),
          Text(playerAscore.toString(),
          style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
        ],),
        color:Colors.redAccent,
        alignment: Alignment.bottomLeft,
        width:double.infinity,
        height:redcard,
           ),
     )


   ]));
  }
}

class resultpage extends StatelessWidget{
  double score=0;
  String player="";

  resultpage(this.score,this.player);

  @override
     Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: player=="Player AW"  ? Colors.redAccent:Colors.blue,
        body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(score.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
          Text(player,style: TextStyle(fontSize: 35),),
          MaterialButton(onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
          },
          child: Text("Restart The Game"),
          color: Colors.white,
          )])

          
          
          )

        );

      
     }
    
  
  
}


