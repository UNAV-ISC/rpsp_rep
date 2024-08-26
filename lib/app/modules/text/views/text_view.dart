import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TextView extends StatefulWidget {
  final String title;
  final String subTitle;
  final int contQuantity;
  final String abbv;
  const TextView({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.contQuantity,
    required this.abbv,
  }) : super(key: key);

  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  late Future<Map<String, dynamic>> _fetchVerse;

  @override
  void initState() {
    super.initState();
    _fetchVerse = _fetchVerseFromApi();
  }

  Future<Map<String, dynamic>> _fetchVerseFromApi() async {
    try {
    final apiUrl =
        'https://www.abibliadigital.com.br/api/verses/rvr/${widget.abbv}/${widget.contQuantity}';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load verse');
    }
      
    } catch (e) {
      print("error $e" );
      throw Exception('Failed to load verse');
    }
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
          child: Column(
            children: [
              _appBarCustom(context),
              const SizedBox(height: 5),
              Text(
                widget.subTitle,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              FutureBuilder<Map<String, dynamic>>(
                  future: _fetchVerse,
                  // future: _fetchVerseFromApi(
                  //     'https://www.abibliadigital.com.br/api/verses/rvr/1rs/2'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final verses = snapshot.data?['verses'] as List<dynamic>;
                      return _text(verses);
                    }
                  }),
            ],
          ),
        ),
        // child: _BibleTab(),
      ),
    );
  }

  Row _appBarCustom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.text_fields_outlined, size: 30),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 30),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  Widget _text(List<dynamic> verses) {
    return Expanded(
        child: ListView.builder(
      itemCount: verses.length,
      itemBuilder: (context, index) {
        final verse = verses[index];
        return ListTile(
          title: Text('${verse['number']}  ${verse['text']}'),
          // subtitle: Text('${verse['text']}'),
        );
      },
    ));
  }
}
