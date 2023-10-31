import 'package:flutter/material.dart';
import 'package:flutter_projeto_dois/model/user_model.dart';
import 'package:flutter_projeto_dois/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('REST API - Mateus'),
        ),
        backgroundColor: Colors.purple,
        body: _userModel == null || _userModel!.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: _userModel!.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                decoration: BoxDecoration(color: Colors.yellow,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                  margin: const EdgeInsets.all(6.0),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    _userModel![index].id.toString(),
                                  style: const TextStyle(fontSize: 24, color: Colors.black),
                                ),
                                Text(
                                    _userModel![index].name,
                                  style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    _userModel![index].email,
                                  style: const TextStyle(fontSize: 18, color: Colors.black),
                                ),
                                Text(
                                    _userModel![index].website,
                                  style: const TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}

