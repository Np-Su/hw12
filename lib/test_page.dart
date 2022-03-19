import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }

}
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key) {
  }

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Food'),
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: ElevatedButton(
              onPressed: _handleClickButton,
              child: const Text('LOAD FOODS DATA'),
            ),
          ),

        ],
      ),
    );
  }
  _handleClickButton() async {
   /* final url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods?id=1');
    var result = await http.get(url);
    //print(result.body);

    var json = jsonDecode(result.body);
    var apiResult = ApiResult.fromJson(json);*/

    /*String status = json['status'];
    String? message = json['message'];
    List<dynamic> data = json['data'];*/

    //print('Status: $status, Message: $message, Number of food: ${data.length}');

    /*setState(() {
      _foodData = apiResult.data.map<FoodItem>((item) => FoodItem.fromJson(item)).toList();

      /*for (var element in apiResult.data) {
        var foodItem = FoodItem.fromJson(element);
        _foodData.add(foodItem);
      }*/
    });*/
  }
}