import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hw12/api_result.dart';
import 'test_page.dart';
void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),*/
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  late TestPage _testPage;
  late HomePage _homePage;
  HomePage({Key? key}) : super(key: key) {
  }

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  var _num = 0; var _numMinus = 6; String _input ='';
  var _status =false;
  List<ApiResult> _ApiResult =[];


  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var showSeven = true;

    return Scaffold(
      /*appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
      ),*/
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.https,         // รูปไอคอน
                          size: 60.0,           // ขนาดไอคอน
                          color: Colors.indigoAccent,   // สีไอคอน
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.purple.shade600,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Enter PIN to login',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.purple.shade600,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*  Padding(
                padding: const EdgeInsets.all(16.0),
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  if(_num <=6)
                    for (var i = 0 ; i <_num ; i++)
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                  if(_num >6)
                    for (var i = 0 ; i <6 ; i++)
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),

                  for(var j = 0 ;  _numMinus>j ;j++)
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 3; i++) _buildButton4(num :i),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) _buildButton4(num: i),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) _buildButton4(num: i),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 70,height: 70,),
                  Container(width: 70,height: 70,child: _buildButton4(num:0),),
                  InkWell(
                      onTap: (){
                        setState(() {
                          var length = _input.length;
                          _input = _input.substring(0,length-1);
                          _num --;
                          _numMinus++;
                        });
                      },

                      child:Container(width: 70,height: 70,child: Icon(
                        Icons.backspace,         // รูปไอคอน
                        size: 30.0,           // ขนาดไอคอน
                        color: Colors.indigoAccent,   // สีไอคอน
                      )
                      )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
          onPressed: () {
            print('You pressed $num');
          },
          child: Text('$num')),
    );
  }

  Widget _buildButton4({int? num}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 60.0,
        height: 60.0,
        //color: Colors.green, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 60,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(width: 1.0,color: Colors.grey),
                shape: CircleBorder(),
                primary: Colors.white, // color background button
                onPrimary: Colors.black, // color text button
              ),
              child:Text('$num'),
              onPressed: () {
                _input='$_input$num';

                if(_input.length == 6){
                  print("Value before Send : $_status");
                 // var checkPassword = await postLogin(_input);
                  postLogin(_input);
                  Future.delayed(Duration(milliseconds: 1500),(){
                  print("279 : $_status");
                    if(_status){
                        print('correct');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestPage()
                          ),
                        );
                    }else{
                      _showOkDialog(context, 'Incorrect PIN', 'Please try again');
                      _status =false;
                    }
                  _num=0; _numMinus=6; _input='';
                  setState(() {
                    _num++;
                  _numMinus--;
                    print('$_num,$num');
                          });
                     });
                }else{
                  setState(() {
                    _num++;
                    _numMinus--;
                    print('$_num,$num');
                  });
                }
              },
              /*   textAlign: TextAlign.center,
                style:TextStyle(fontSize: 20)*/
            ),
          ),
        ),
      ),
    );
  }
    void postLogin(String input) async {
      final url = Uri.parse('https://cpsu-test-api.herokuapp.com/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'pin': input})
      );

        _status = jsonDecode(response.body)["data"];
        print("323 : $_status");
        print(_status.runtimeType);


    //  print(jsonDecode(response.body)["data"]);
     /* if(response.statusCode == 200){
        //return Password.fromJson(jsonDecode(response.body));
        return ApiResult.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed');
      }*/

    }

}
