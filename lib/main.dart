import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maths Calculator',
      theme: ThemeData(),
      home: Calculator(),
    );
  }
}


class Calculator extends StatefulWidget {


  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';
  String _output ='0';
  double num1 =0.0;
  double num2 = 0.0;
  String operand = '';
  operation(String btntext){
      if(btntext == 'C'){
        _output ='0';
        num2 = 0.0;
        num1 = 0.0;
        operand ='';
      }
      else if(btntext == '+' || btntext == '-' || btntext == 'x' || btntext == '/'){
        num1 = double.parse(output);
        operand = btntext;
        _output = '0';
      }
      else if(btntext == '='){
        num2 = double.parse(output);

        if(operand == '+'){
          _output =(num1 + num2).toString();
        }
        if(operand == '-'){
          _output =(num1 - num2).toString();
        }
        if(operand == '/'){
          _output =(num1 / num2).toString();
        }
        if(operand == 'x'){
          _output =(num1 * num2).toString();
        }

        num1 =0.0;
        num2 =0.0;
        operand = '';
      }
      else{
        _output = _output + btntext;
      }
      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });
  }

  Widget button(String btntext, Color btncolor){
    return Padding(
      padding: const EdgeInsets.all(1),
      child: RawMaterialButton(
        splashColor: Colors.deepPurple,
        padding: EdgeInsets.all(20),
        fillColor: Colors.black12,
        shape: Border.all(color:btncolor,width: 2),
        child: Text(btntext,style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w600),),
        onPressed: (){
           operation(btntext);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mathematical Calculator'),
        backgroundColor: Colors.black45,
      ),
      body: Container(
          margin: EdgeInsets.only(bottom: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1),
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text('$output',style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              Row(

                children: [
                  button('9', Colors.black),
                  button('8', Colors.black),
                  button('7', Colors.black),
                  button('/', Colors.black),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('4', Colors.black),
                  button('5', Colors.black),
                  button('6', Colors.black),
                  button('x', Colors.black),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('3', Colors.black),
                  button('2', Colors.black),
                  button('1', Colors.black),
                  button('-', Colors.black),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('0', Colors.black),
                  button('C', Colors.black),
                  button('=', Colors.black),
                  button('+', Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorButtons extends StatefulWidget {
  CalculatorButtons({
    required this.color,required this.buttonText
  });

  Color color;
  String buttonText;

  @override
  _CalculatorButtonsState createState() => _CalculatorButtonsState();
}

class _CalculatorButtonsState extends State<CalculatorButtons> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: RawMaterialButton(
        splashColor: Colors.deepPurple,
        padding: EdgeInsets.all(15),
        fillColor: Colors.black12,
        shape: Border.all(color: widget.color,width: 2),
        child: Text(widget.buttonText,style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w600),),
        onPressed: (){

        },
      ),
    );
  }



}
