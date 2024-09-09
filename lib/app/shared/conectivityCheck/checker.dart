import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rpsp_main/app/shared/share_prefs/storage_prefs.dart';

class Checker extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Checker createState() => _Checker();
}

class _Checker extends State<Checker> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late Stream<ConnectivityResult> _connectivityStream;
  final _prefs = StoragePrefs(); 

  @override
  void initState() {
    super.initState();
    _initConnectivity(); // Verificar la conectividad inicial
    _connectivityStream = _connectivity.onConnectivityChanged;
    _connectivityStream.listen((ConnectivityResult result) {
      // Escucha los cambios en la conectividad
      setState(() {
        _connectionStatus = result;
      });
    });
  }

  // verificador
  Future<void> _initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      result = ConnectivityResult.none;
    }

    // actualiza
    if (!mounted) {
      return Future.value(null);
    }

    setState(() {
      _connectionStatus = result;
    });
  }

  void getConn(){
    if(_connectionStatus!= ConnectivityResult.none){
      _prefs.isConected = true;
    }else{
      _prefs.isConected = false;
    }
  }

  // Mostrar el estado de la conexión en la UI
  @override
  Widget build(BuildContext context) {
    String connectionStatusMessage;
    switch (_connectionStatus) {
      case ConnectivityResult.wifi:
        connectionStatusMessage = 'Conectado a WiFi';
        break;
      case ConnectivityResult.mobile:
        connectionStatusMessage = 'Conectado a Datos Móviles';
        break;
      case ConnectivityResult.ethernet:
        connectionStatusMessage = 'Conectado a Ethernet';
        break;
      case ConnectivityResult.none:
        connectionStatusMessage = 'Sin conexión a Internet';
        break;
      default:
        connectionStatusMessage = 'Estado desconocido';
        break;
    }

  

    return Scaffold(
      appBar: AppBar(
        title: Text('Detección de Conexión a Internet'),
      ),
      body: Center(
        child: Text(
          connectionStatusMessage,
          style: TextStyle(fontSize: 24),
        )
        ),
        
    
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Checker(),
  ));
}
