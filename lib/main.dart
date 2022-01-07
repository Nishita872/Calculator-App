
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main (){
  runApp(CalculatorApp());
}
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String eqution="0";
  String result="0";
  String expretion="";
  double equtionFontSize=38.0;
  double resultFontSize=40.0;




  bottonPressed( String bottonText){
    setState(() {
      if (bottonText=="c"){
        eqution="0";
        result="0";

      }else if (bottonText=='^'){
        eqution=eqution.substring(0,eqution.length-1);
        if(eqution==""){
          eqution="0";

        }

      } else if ( bottonText=="="){
        equtionFontSize=38.0;
       resultFontSize=40.0;
       expretion=eqution;
       expretion=expretion.replaceAll("#", "/");
       expretion=expretion.replaceAll("+", "+");
       try{ Parser p= Parser();
         Expression exp =p.parse(expretion);
         ContextModel cm= ContextModel();
         result="${exp.evaluate(EvaluationType.REAL,cm)}";

       }catch(e){
        result="Error";
       }


      }else{
        if(eqution=="0"){
          eqution=bottonText;
        }else{
        eqution=eqution+bottonText;
      }}
    });

  }
  Widget buildBotton(String bottonText,double bottonHight,Color bottonColor){
   return  Container(
                          
                          height: MediaQuery.of(context).size.height*0.1*bottonHight,
                          color: bottonColor,
                          child: FloatingActionButton(
                            child: Text(bottonText,style: TextStyle(fontSize: 38.0),),
                          
                            
                            onPressed: ()=>bottonPressed(bottonText),
                            
                          
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.9),side:BorderSide(color: Colors.red,width: 1,style: BorderStyle.solid)),),
                        ) ;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Calculator"),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Text(eqution,style: TextStyle(fontSize: 38.0),),
            
            
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Text(result,style: TextStyle(fontSize: 38.0),),
            ),
            Expanded(child: Divider(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.75,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          
                          buildBotton("c", 1,Colors.green),
                           buildBotton("^", 1,Colors.green),
                            buildBotton("+", 1,Colors.green),
                             
    
                        ]
                      ),
                      TableRow(
                        children: [
                          
                          buildBotton("1", 1,Colors.green),
                           buildBotton("2", 1,Colors.green),
                            buildBotton("3", 1,Colors.green),
                            
    
                        ]
                      ),
                      TableRow(
                        children: [
                          
                          buildBotton("4", 1,Colors.green),
                           buildBotton("5", 1,Colors.green),
                            buildBotton("6", 1,Colors.green),
                            
    
                        ]
                      ),TableRow(
                        children: [
                          
                          buildBotton("7", 1,Colors.green),
                           buildBotton("8", 1,Colors.green),
                            buildBotton("9", 1,Colors.green),
                             
                        ]
                      ),
                      TableRow(
                        children: [
                          
                          buildBotton("c", 1,Colors.green),
                           buildBotton("*", 1,Colors.green),
                            buildBotton("+", 1,Colors.green),
                             
                        ]
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.25,
                  height: MediaQuery.of(context).size.height*.50,
                  child: Table(
                    children: [
                      TableRow(
                        children:[
                          buildBotton("%", 1,Colors.blue),
                        ]
                      ),
                      TableRow(
                        children:[
                          buildBotton("*", 1,Colors.blue),
                        ]
                      ),
                      TableRow(
                        children:[
                          buildBotton("/", 1,Colors.blue),
                        ]
                      ),
                      TableRow(
                        children:[
                          buildBotton("-", 1,Colors.blue),
                        ]
                      ),TableRow(
                        children:[
                          buildBotton("=", 1,Colors.blue),
                        ]
                      )
                    ],
                  ),
                )
              ],
            )
            
        ],),
        
      ),
    );
  }
}