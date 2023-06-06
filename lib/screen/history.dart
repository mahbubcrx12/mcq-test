import 'package:flutter/material.dart';
import 'package:mcq_test/service/store_result.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> _resultList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResultData();
  }

  Future<void> _loadResultData() async {
    List<Map<String, dynamic>> results = await StoreResult.getAllResult();
    setState(() {
      _resultList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous History'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(.5),
      ),
      body: ListView.builder(
        shrinkWrap: true,
          itemCount: _resultList.length,
          itemBuilder: (context, index) {
         // Map<String,dynamic> result = _resultList[index];
            Map<String, dynamic> result = _resultList[_resultList.length - 1 - index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: ${result['date']}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Result: ${result['result']}',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),),
                    SizedBox(height: 4),
                    Text('Result in Percentage: ${result['result_in_percentage']}'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
