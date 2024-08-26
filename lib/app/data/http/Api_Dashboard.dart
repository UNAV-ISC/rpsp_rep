import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:rpsp_main/app/modules/home/views/home_view.dart';

class ApiData {
  late String abbv;
  late int nChapter;
  late int verses;

  ApiData({required this.abbv, required this.nChapter, required this.verses});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      abbv: json['book'],
      nChapter: json['chapter'],
      verses: json['verses'],
    );
  }
}

Future<void> fetchDataAndSendToClasses() async {
  const apiUrl = 'URL_DE_TU_API';
  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final apiData = ApiData.fromJson(jsonData);

      // Enviar datos a clases externas
      CitaDiariaView().setData(apiData);
      _biblieDialog().setData(apiData);
      VideoYoutubeView().setData(apiData);
      _buildCards().setData(apiData);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  }
}

class CitaDiariaView {
  void setData(ApiData data) {
    // Utiliza el dato en la clase externa
    print('CitaDiariaView: ${data.abbv}, ${data.nChapter}, ${data.verses}');
  }
}

class _biblieDialog {
  void setData(ApiData data) {
    // Utiliza el dato en la clase externa
    print('_biblieDialog: ${data.abbv}, ${data.nChapter}, ${data.verses}');
  }
}

class VideoYoutubeView {
  void setData(ApiData data) {
    // Utiliza el dato en la clase externa
    print('VideoYoutubeView: ${data.abbv}, ${data.nChapter}, ${data.verses}');
  }
}

class _buildCards {
  void setData(ApiData data) {
    // Utiliza el dato en la clase externa
    print('_buildCards: ${data.abbv}, ${data.nChapter}, ${data.verses}');
  }
}

void main() {
  fetchDataAndSendToClasses();
}
