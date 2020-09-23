import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class Tiles extends StatefulWidget {
  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  List response;
  Future<List> _result;

  Future<List<dynamic>> getData() async {
    var dio = Dio();
    Response response = await dio.get('https://type.fit/api/quotes');
    // print(response.data);
    this.response = jsonDecode(response.data);
    return jsonDecode(response.data);
  }
  // getHttpData() async {
  //   var response = await get('https://jsonplaceholder.typicode.com/users');
  // if (response.statusCode == 200) {
  //   var jsonResponse = jsonDecode(response.body);
  //   var itemCount = jsonResponse[0]["name"];
  //   print('Number of books about http: $itemCount.');
  // } else {
  //   print('Request failed with status: ${response.statusCode}.');
  // }
  // }

  @override
  void initState() {
    super.initState();
    _result = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.search),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Motivational Quotes",
            style: TextStyle(fontFamily: "Lobster")),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _result,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
                itemCount: response.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("${response[index]['text']}",
                              style: TextStyle(fontFamily: "Arizonia")),
                          subtitle: Text("${response[index]['author']}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        // FlatButton.icon(
                        //   onPressed: () {
                        //     setState(() {
                        //       response.removeAt(index);
                        //     });
                        //   },
                        //   icon: Icon(Icons.delete),
                        //   label: Text("Delete"),
                        // )
                      ],
                    ),
                  );
                });
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
