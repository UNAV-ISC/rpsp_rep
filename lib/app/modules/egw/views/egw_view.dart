import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EGWView extends StatefulWidget {
  @override
  _EGWViewState createState() => _EGWViewState();
}

class _EGWViewState extends State<EGWView> {
  final controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libreria EGW'),
        
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(
            Uri.parse('https://m.egwwritings.org/es/folders/236'),
          ),
      ),
    );
  }
}






// WebView(
//         initialUrl:
//             'https://reavivados.adventistasumn.org/blog/categories/español',
//         onWebViewCreated: (controller) => controller.loadUrl(
//             'https://reavivados.adventistasumn.org/blog/categories/español'),
//         javascriptMode: JavascriptMode.unrestricted,

//         // onpage: (controller, url) {
//         //   _webViewController?.addJavaScriptHandler(
//         //       handlerName: 'scrollListener',
//         //       callback: (args) {
//         //         double scrollY = args[0];
//         //         if (scrollY <= 0) {
//         //           _webViewController?.reload();
//         //         }
//         //       });
//         //   _webViewController?.evaluateJavascript(source: '''
//         //   window.addEventListener('scroll', function(){
//         //     window.flutter_inappwebview.callHandler('scrollListener', );
//         //   });
//         //   ''');
//         // },
//       ),