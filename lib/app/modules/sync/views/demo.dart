import 'package:flutter/material.dart';
import 'package:rpsp_main/app/shared/conectivityCheck/connService.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncronizacion offline'),
      ),
      body: Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              
              onPressed: () {
                fetchAndSaveData();
                print('Data Guardando');
              },
              child: const Text('Botón 1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
                print(readDataFromFile().toString());
              },
              child: Text('Botón 2'),
            ),
            
          ],
        ),
      ),
    );
  }
}