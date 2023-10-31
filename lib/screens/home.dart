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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.white, width: 2.0),
              ),
              child: Container(
                color: Colors.blue,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(_userModel![index].id.toString()),
                                Text(_userModel![index].name),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(_userModel![index].email),
                                Text(_userModel![index].website),
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

