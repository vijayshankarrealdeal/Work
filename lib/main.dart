import 'package:Intern/Api/rest_connection.dart';
import 'package:Intern/dateTime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<APi>(
        create: (context) => APi(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int xLimit = 30;
  ScrollController _controller;
  @override
  void initState() {
    Provider.of<APi>(context, listen: false).getDataFrom(30);
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {}

    if (_controller.offset <= _controller.position.maxScrollExtent / 2 &&
        !_controller.position.outOfRange) {
      Provider.of<APi>(context, listen: false).getDataFrom(xLimit);
      setState(() {
        xLimit = xLimit + 5;
      });
    }
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(1213456431);
    final api = Provider.of<APi>(context, listen: false);
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('List Page'),
      ),
      body: RefreshIndicator(
        // ignore: missing_return
        onRefresh: () {
          api.getDataFrom(xLimit);
        },
        child: Container(
          child: Consumer<APi>(
            builder: (context, _, c) {
              return api.isLoading
                  ? ListView.builder(
                      controller: _controller,
                      itemCount: api.dataUser.length,
                      itemBuilder: (context, i) {
                        var st = api.dataUser[i];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.inactiveGray),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    st.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    getdate(st.createOn.toString()),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
