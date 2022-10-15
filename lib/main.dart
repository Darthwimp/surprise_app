import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: splashPage(buttonPage(), 3)),
);

class splashPage extends  StatelessWidget{
  int duration=0;
  Widget goToPage;

  splashPage(this.goToPage ,this.duration);


@override
Widget build(BuildContext context){
  Future.delayed(Duration(seconds: this.duration), (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => this.goToPage)
      );
    }
  );


      return Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(child: Image(image: AssetImage("assets/images/surprise.jpeg")),)  
        )
    );
  }
}


class buttonPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Center(child: SizedBox(  
        width: 300,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            elevation: 25,
            shadowColor: Colors.black,
            textStyle: TextStyle(fontSize: 25),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
              )
            ),
          child: Text("Click here for a surprise <3",
            style: GoogleFonts.lobster(),), 
          onPressed: (){

            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>surprisepage()));
          }) 
        )
      )
    );
  }
}

class surprisepage extends StatelessWidget{
  
  @override

  Widget build(BuildContext context){
    
    AudioPlayer().play(AssetSource('surprise.mp3'), volume: 100);
    return Scaffold(
      appBar: AppBar(
        title: Text("SURPRISE MF! <3",
        style: GoogleFonts.lobster(),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(75),
        child: Center(
          child: Image(image: AssetImage('assets/images/rickroll-rick.gif')
          ),
        ),
      )
    );
  }
}
