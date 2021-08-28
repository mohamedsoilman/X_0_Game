import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main()
{
  runApp(XOGame());
}

class XOGame extends StatefulWidget {
  const XOGame({Key? key}) : super(key: key);

  @override
  _XOGameState createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {

  List<String>input=List.filled(9, "");
  int count =0;
  String winner="";
  int xScore=0;
  int oScore=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                  child: Container(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween, // or   Spacer(),
                      children: [
                        Column(
                          children: [
                            Text("player X",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),),
                            Text(xScore.toString(),style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),)
                          ],
                        ),

                        Spacer(),

                        Column(
                          children: [
                            Text("player O",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),),
                            Text(oScore.toString(),style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),)
                          ],
                        )
                      ],
                    ),
              )),
              Expanded(
                flex: 4,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: 9,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3
                          ),
                          itemBuilder: (context,index)
                          {
                            return InkWell(
                              onTap:()
                              {
                                setState(() {
                                  if(count.isEven && input[index].isEmpty)
                                    {
                                      input[index]="X";
                                      count++;
                                    }
                                  else if(count.isOdd && input[index].isEmpty)
                                    {
                                      input[index]="O";
                                      count++;
                                    }
                                });

                                checkWinner();
                                score();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)
                                ),
                                child:
                                Center(
                                    child: Text(input[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20,),)) ,
                              ),
                            );
                          }
                      ),
                    ),

              )),
              Expanded(
                flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: ()
                            {
                              playagain();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              height: 60,
                              width: 300,
                              child: Center(
                                  child: Text("Play Again",style: GoogleFonts.pacifico(fontWeight: FontWeight.w600,fontSize: 30,color: Colors.white),)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: ()
                            {
                              endgame();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              height: 60,
                              width: 300,
                              child: Center(
                                  child: Text("End Game",style: GoogleFonts.pacifico(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),)),
                            ),
                          ),
                        )
                      ],
                    ),

              )),

              
            ],
          ),
        ),
      ),
    );
  }

  checkWinner()
  {
    if(input[0]==input[1] && input[0]==input[2] && input[0]!= "")
      {
        setState(() {
          winner=input[0];
          winner="h";//destroy the winner value after win stage
        });
      }
    if(input[3]==input[4] && input[3]==input[5] && input[3]!= "")
      {
        setState(() {
          winner=input[3];
        //  winner="h";
        });
      }

  }
  score()
  {
    if(winner == "X")
      {
        setState(() {
          xScore++;
          winner="";
        });
      }
    else if(winner == "O")
      {
        setState(() {
          oScore++;
          winner="";
        });
      }
  }
  playagain()
  {
    for(int i=0;i<input.length;i++)
    {
      setState(() {
        input[i]="";
        winner="";
      });
    }
  }
  endgame()
  {
    for(int i=0;i<input.length;i++)
    {
      setState(() {
        input[i]="";
        winner="";
      });
    }
    xScore=0;
    oScore=0;
  }



}
