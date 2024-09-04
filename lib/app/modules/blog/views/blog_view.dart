import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogView extends StatefulWidget {
  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  final controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('Blog RPSP'),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(Theme.of(context).scaffoldBackgroundColor)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url
                    .startsWith('https://reavivados.adventistasumn.org/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(
            Uri.parse('https://reavivados.adventistasumn.org/'),
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