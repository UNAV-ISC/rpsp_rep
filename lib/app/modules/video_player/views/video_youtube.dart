// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:youtube_api/youtube_api.dart';

// class YouTubeScreen extends StatefulWidget {
//   @override
//   _YouTubeScreenState createState() => _YouTubeScreenState();
// }

// class _YouTubeScreenState extends State<YouTubeScreen> {
//   List<YouTubeVideo> videosList = [];
//   YoutubeAPI ytApi = YoutubeAPI('TU_API_KEY');
//   String channelId = 'TU_ID_DE_CANAL';
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     fetchVideos();
//   }

//   Future<void> fetchVideos() async {
//     YT_API_SERVICE_API params = YT_API_SERVICE_API(
//       q: '', // Keyword to search
//       type: 'video',
//       maxResults: 20,
//       part: 'snippet,id',
//       channelId: channelId,
//     );
//     List<YouTubeVideo> videos = await ytApi.search(params);
//     setState(() {
//       videosList = videos;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Canal de YouTube'),
//       ),
//       body: ListView.builder(
//         itemCount: videosList.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(videosList[index].title),
//             trailing: Icon(Icons.play_arrow),
//             onTap: () {
//               _controller = YoutubePlayerController(
//                 initialVideoId: videosList[index].id.videoId,
//                 flags: const YoutubePlayerFlags(
//                   autoPlay: true,
//                 ),
//               );
//               showVideo(_controller);
//             },
//           );
//         },
//       ),
//     );
//   }

//   void showVideo(YoutubePlayerController controller) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => YoutubePlayerBuilder(
//           player: YoutubePlayer(
//             controller: controller,
//             showVideoProgressIndicator: true,
//             progressIndicatorColor: Colors.amber,
//           ),
//           builder: (context, player) => Scaffold(
//             appBar: AppBar(
//               title: const Text('Youtube Player'),
//             ),
//             body: player,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YouTubeVideoListScreen extends StatefulWidget {
  @override
  _YouTubeVideoListScreenState createState() => _YouTubeVideoListScreenState();
}

class _YouTubeVideoListScreenState extends State<YouTubeVideoListScreen> {
  final controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reavivados por su Palabra'),
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
            Uri.parse(
                'https://m.youtube.com/@reavivadosporsupalabraoficial/playlist'),
          ),
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'package:googleapis/youtube/v3.dart' as youtube;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YouTubeVideoListScreen extends StatefulWidget {
//   @override
//   _YouTubeVideoListScreenState createState() => _YouTubeVideoListScreenState();
// }

// class _YouTubeVideoListScreenState extends State<YouTubeVideoListScreen> {
//   List<String> videoTitles = [];
//   late youtube.YouTubeApi _youTubeApi;

//   @override
//   void initState() {
//     super.initState();
//     // Inicializar la autenticación con la API key
//     const apiKey = 'AIzaSyDjDX_6U5yst7tRflqdm6N5ZofgJ64uUNg';
//     final client = http.Client();
//     client
//         .get(Uri.parse(
//             'https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest'))
//         .then((response) {
//       // Inicializar el cliente de la API de YouTube
//       _youTubeApi = youtube.YouTubeApi(client);
//       // _youTubeApi = youtube.YouTubeApi(http.Client(), apiKey,
//       //     requestHeaders: {'Content-Type': 'application/json'});
//       // Obtener los datos de YouTube
//       getYouTubeData();
//     });
//   }

//   void getYouTubeData() async {
//     String channelId = "@InterAmericanDivision";
//     var response = await _youTubeApi.search.list(
//       ['snippet'],
//       channelId: channelId,
//       maxResults: 10,
//       type: ['video'],
//     );

//     List<String> titles = [];
//     for (var item in response.items!) {
//       titles.add(item.snippet!.title!);
//     }
//     setState(() {
//       videoTitles = titles;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reavivados por su Palabra'),
//       ),
//       body: ListView.builder(
//         itemCount: videoTitles.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(videoTitles[index]),
//           );
//         },
//       ),
//     );
//   }
// }










//     String url =
//         "https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$channelId&type=video&maxResults=10&key=$apiKey";

//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = json.decode(response.body);
//       List<String> titles = [];
//       for (var item in data['items']) {
//         titles.add(item['snippet']['title']);
//       }
//       setState(() {
//         videoTitles = titles;
//       });
//     } else {
//       print('Failed to load data: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reavivados por su Palabra'),
//       ),
//       body: ListView.builder(
//         itemCount: videoTitles.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(videoTitles[index]),
//           );
//         },
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:youtube_api/youtube_api.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'YouTube Viewer',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChannelListScreen(),
//     );
//   }
// }

// class ChannelListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Channels'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => VideoListScreen()),
//             );
//           },
//           child: Text('View Videos'),
//         ),
//       ),
//     );
//   }
// }

// class VideoListScreen extends StatefulWidget {
//   @override
//   _VideoListScreenState createState() => _VideoListScreenState();
// }

// class _VideoListScreenState extends State<VideoListScreen> {
//   late YoutubeAPI _youtubeAPI;

//   @override
//   void initState() {
//     super.initState();
//     _youtubeAPI = YoutubeAPI(
//       'AIzaSyDWNJUd8eycCtFQyYYCBtyBOtCDZhkXBxo',
//       maxResults: 50, // Number of videos to fetch
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Videos'),
//       ),
//       body: FutureBuilder(
//         future: _youtubeAPI.getChannelById('@InterAmericanDivision'),
//         builder: (context, AsyncSnapshot<Channel?> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             final videos = snapshot.data?.videos;
//             if (videos != null) {
//               return ListView.builder(
//                 itemCount: videos.length,
//                 itemBuilder: (context, index) {
//                   final video = videos[index];
//                   return ListTile(
//                     title: Text(video.title),
//                     onTap: () {
//                       // Navigate to video details screen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => VideoDetailsScreen(video),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             } else {
//               return Text('No videos found');
//             }
//           }
//         },
//       ),
//     );
//   }
// }

// class VideoDetailsScreen extends StatelessWidget {
//   final Video video;

//   VideoDetailsScreen(this.video);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(video.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(video.thumbnail['high']['url']),
//             SizedBox(height: 20),
//             Text(video.description),
//           ],
//         ),
//       ),
//     );
//   }
// }
