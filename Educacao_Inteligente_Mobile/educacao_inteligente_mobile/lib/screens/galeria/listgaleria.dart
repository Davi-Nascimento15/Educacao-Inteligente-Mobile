import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListGaleria extends StatefulWidget {
  const ListGaleria({Key key}) : super(key: key);

  @override
  State<ListGaleria> createState() => _ListGaleriaState();
}

class _ListGaleriaState extends State<ListGaleria> {
  bool loading;
  List<String> ids;

  @override
  void initState() {
    loading = true;
    ids = [];

    _loadImageIds();

    super.initState();
  }

  void _loadImageIds() async {
    final response = await http.get(
        'https://drive.google.com/drive/u/0/folders/1P9VxO7xDebiEM9tvXniN7CMlYi0jdPHI');
    final json = jsonDecode(response.body);
    List<String> _ids = [];
    for (var image in json) {
      _ids.add(image['id']);
    }
    setState(() {
      loading = false;
      ids = _ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Image.network('https://picsum.photos/id/${ids[index]}/300/300');
      },
      itemCount: ids.length,
    );
  }
}
