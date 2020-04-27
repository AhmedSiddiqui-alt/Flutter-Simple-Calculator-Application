import 'package:flutter/material.dart';
TextEditingController number1=TextEditingController();
TextEditingController number2=TextEditingController();
String text="";
main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Calculator_Application(),
    theme: ThemeData(
      brightness:Brightness.dark,
      primaryColor: Colors.purpleAccent,
    ),
    )
  );
}

class Calculator_Application extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
  return _Calculator_Application();
  }
}
class _Calculator_Application extends State<Calculator_Application>
{
   var _formkey=GlobalKey<FormState>(); 
  @override
  Widget build(BuildContext context)
  {
  return 
  Scaffold(
    resizeToAvoidBottomPadding: false,
      appBar:AppBar(title: Text("Simple Calculator",
      ),
      leading: Icon(Icons.keyboard),
      ),
      body: Form(
         key:_formkey,
        child:
        Column(
          children:
          [
          Padding(padding: EdgeInsets.only(left:15.0,top:90.0),
          child:
          ImagesInserts(),
          ),

        
          Padding(
            padding:EdgeInsets.only(left:5.0,right:5.0,top:10.0),
            child:
            Row(
            children:
            [
            Expanded(child:
            Padding(padding: EdgeInsets.only(right:10.0),
            child:
            TextFormField(
            controller:number1 ,
            keyboardType:TextInputType.number,
            validator: (String num1)
            {
              if(num1.isEmpty)
              {
              return "Please Enter Any Number";
              }
              else if(double.tryParse(num1)==null)
              {
              return "Please Enter Valid Number";
              }
             
            },
            decoration:InputDecoration(
            labelText: "Enter Any Digit",
            labelStyle: TextStyle(color:Colors.white,
            fontSize: 20.0),
            border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(5.0),
           ),
            ),
          ),
            )
            ),
            
            Expanded(child:
            Padding(padding: 
            EdgeInsets.only(left:15.0),
            child:
            TextFormField(
            controller:number2,
            keyboardType:TextInputType.number,
            validator: (String num2)
            {
              if(num2.isEmpty)
              {
              return "Please Enter Any Number";
              }
              else if(double.tryParse(num2)==null)
              {
              return "Please Enter Valid Number";
              }
             
            },
            decoration:InputDecoration(
            labelText: "Enter Any Digit",
            labelStyle: TextStyle(color:Colors.white,
            fontSize: 20.0),
            border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(5.0)
      )
            ),
          ),
             )
              ),
            ]
          ),
          ),
          Padding(
            padding:EdgeInsets.only(left:5.0,right:5.0,top:20.0),
            child:
          Row(
            children:
            [
              Expanded(child: 
              Padding(padding: EdgeInsets.only(right:10.0),
              child:
               RaisedButton(
             child:Text("+",style: TextStyle(color: Colors.white,fontSize: 60.0
             ),
             ),
             color: Colors.black26,
            onPressed:()
            {
            setState(() {
              if(_formkey.currentState.validate())
              {
              text=Sum();
              }
            });
             },
             )
              )
              ),
              Expanded(child: 
              Padding(padding: EdgeInsets.only(left:15.0),
              child:
              RaisedButton(
              child:Text("-",style: TextStyle(color: Colors.white,fontSize: 60.0
              ),
              ),
             color: Colors.black26,
             onPressed:()
             {
             setState(() {
               if(_formkey.currentState.validate())
                { 
              text=Subtract();
                }
             });
             },
             )
             )
             ),
            ]
          )
          ),
               Padding(
            padding:EdgeInsets.only(left:5.0,right:5.0,top:20.0),
            child:
          Row(
            children:
            [
              Expanded(child: 
              Padding(padding: EdgeInsets.only(right:10.0),
              child:
               RaisedButton(
             child:Text("x",style: TextStyle(color: Colors.white,fontSize: 60.0
             ),
             ),
             color: Colors.black26,
            onPressed:()
            {
            setState(() {
            if(_formkey.currentState.validate())
            {
            text=Multiply();
            }
            });
             },
             )
              )
              ),
              Expanded(child: 
              Padding(padding: EdgeInsets.only(left:15.0),
              child:
              RaisedButton(
              child:Text("÷",style: TextStyle(color: Colors.white,fontSize: 60.0
              ),
              ),
             color: Colors.black26,
             onPressed:()
             {
             setState(() {
            if(_formkey.currentState.validate())
            {
            text=Divide();
            }
             });
             },
             )
             )
             ),
            ]
          )
          ),
          Expanded(child: 
              Padding(padding: EdgeInsets.only(left:15.0,right:15.0,top:15.0),
              child:
              RaisedButton(
              child:Text("Reset",style: TextStyle(color: Colors.white,fontSize: 40.0
              ),
              ),
             color: Colors.black26,
             onPressed:()
             {
             setState(() {
            Reset();
             });
             },
             )
             )
             ),
          Expanded(
          child:
          Padding(padding: EdgeInsets.only(top:20.0),
          child:
          Text(text,
          style: TextStyle(fontSize:20.0,
          color:Colors.white,),),
          )
          ),
          ],
        )
      ),
    );
  }
}
class ImagesInserts extends StatelessWidget
  {
    @override
   Widget build(BuildContext context)
   {
     AssetImage assetimg=AssetImage("images/Capture.PNG",);
     Image img=Image(image: assetimg,width: 130.0,);
     return img;            
} 
}
String Sum()
{
double num1,num2,res;
num1=double.parse(number1.text);  
num2=double.parse(number2.text);
res=num1+num2;
return "The Addition of $num1 and $num2 is $res";
}

String Subtract()
{
double num1,num2,res;
num1=double.parse(number1.text);  
num2=double.parse(number2.text);
res=num1-num2;
return "The Subtraction of $num1 and $num2 is $res";
}

String Multiply()
{
double num1,num2,res;
num1=double.parse(number1.text);  
num2=double.parse(number2.text);
res=num1*num2;
return "The Multiplication of $num1 and $num2 is $res";
}

String Divide()
{
double num1,num2,res;
num1=double.parse(number1.text);  
num2=double.parse(number2.text);
res=num1/num2;
return "The Division of $num1 and $num2 is $res";
}
void Reset()
{
number1.text="";
number2.text="";  
}