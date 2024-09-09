import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

  /*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  // Ejemplo: Obtener y guardar datos de la API
  await fetchAndSaveData();

  // Ejemplo: Leer datos del archivo local
  final localData = await readDataFromFile();
  print('Datos leídos del archivo: $localData');
}*/

class Connservice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Offline Storage Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Offline'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Intentar leer datos del archivo JSON local
            final data = await readDataFromFile();
            if (data != null) {
              print('Datos leídos del archivo: $data');
            } else {
              print('No se encontraron datos locales.');
            }
          },
          child: Text('Leer Datos Offline'),
        ),
      ),
    );
  }
}

Future<void> fetchAndSaveData() async {
  
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _saveJsonToFile(data);
      print('Datos guardados correctamente.');
    } else {
      print('Error en la respuesta de la API: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al obtener datos: $e');
  }
}

Future<void> _saveJsonToFile(dynamic data) async {
  // Obtiene la ruta del directorio de almacenamiento
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/data.json';

  final file = File(filePath);
  await file.writeAsString(jsonEncode(data));
  print('Datos guardados en: $filePath');
}

Future<dynamic> readDataFromFile() async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);

    if (await file.exists()) {
      final contents = await file.readAsString();
      return jsonDecode(" Entra aqui $contents"); 
    } else {
      print('El archivo no existe.');
      return null;
    }
  } catch (e) {
    print('Error al leer el archivo: $e');
    return null;
  }
}
