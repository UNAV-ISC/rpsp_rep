//import 'package:audioplayers/audioplayers_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:rpsp/app/modules/hymn_player/components/player_widget.dart';
import 'package:rpsp_main/app/modules/hymn_player/controllers/hymn_player_controller.dart';
import 'package:rpsp_main/app/shared/helpers/date_2_spanish_date.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class HymnPlayerView extends GetView<HymnPlayerController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HymnPlayerView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'HymnPlayerView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class HymnPlayerView extends GetView<HymnPlayerController> {
  final _shadows = [
    const BoxShadow(
      color: Color(0xff587885),
      blurRadius: 10.0,
      spreadRadius: 1.0,
    )
  ];

  HymnPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _customAppbar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _CustomImage(),
                Text(
                  'Jonas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    shadows: _shadows,
                  ),
                ),
                Text(
                  'Enojo de Jonas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    shadows: _shadows,
                  ),
                ),
                 SizedBox(height: 20),
                _buildWebViewWidget(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  _customAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
      child: Container(
        height: 130,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xffF5C00B),
              const Color(0xffF5C00B).withOpacity(0.9),
              const Color(0xffF5C00B).withOpacity(0.4),
            ],
          ),
          // boxShadow: [
          //   new BoxShadow(
          //     color: Colors.grey.shade500,
          //     blurRadius: 20.0,
          //     spreadRadius: 1.0,
          //   )
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              const SizedBox(width: 30),
              Text(
                todayWithYear(),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close, size: 30, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

 Widget _buildWebViewWidget() {
    // Crear un controlador para WebView
    final controller = WebViewController()
      ..loadHtmlString('''
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
              body { margin: 0; }
              .u-audio-main-layout-wrapper { padding: 20px; }
            </style>
          </head>
          <body>
            <div class="u-audio-main-layout-wrapper">
              <div class="u-audio-cover-layout">
                <div style="background-image: url('images/app_icon_adaptive11.png');" class="u-audio-cover" data-hook="cover"></div>
              </div>
              <div class="u-audio-main-layout">
                <div class="u-audio-upper-layout">
                  <div class="player-track-meta"></div>
                </div>
                <audio id="stream" controls style="width: 300px;">
                  <source src="https://cloudstream2036.conectarhosting.com/8048/stream" type="audio/mpeg">
                </audio>
              </div>
            </div>
          </body>
        </html>
      '''); // Cargar HTML directamente como una cadena

    return Container(
      height: 400, // Ajusta el alto del contenedor según sea necesario
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }




class _CustomImage extends StatelessWidget {
  final _shadows = [
    const BoxShadow(
      color: Color(0xff587885),
      blurRadius: 10.0,
      spreadRadius: 1.0,
    )
  ];




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
          image: const ExactAssetImage('assets/hymn.jpg'),
          colorFilter: ColorFilter.mode(
              const Color(0xffF5C00B).withOpacity(0.5), BlendMode.darken),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '#RPSP\nJonas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: _shadows,
              ),
            ),
            Text(
              '4: 1-20',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: _shadows,
              ),
            ),
            
  ]
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
