// import 'dart:async';

// import 'package:audioplayers/audioplayers.dart';
// //import 'package:audioplayers/notifications.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class AudioPlayerWidget extends StatefulWidget {
//   final String url;
//   final PlayerMode mode;

//   const AudioPlayerWidget({
//     Key? key,
//     required this.url,
//     this.mode = PlayerMode.mediaPlayer,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _AudioPlayerWidgetState(url, mode);
//   }
// }

// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   String url;
//   PlayerMode mode;

//   late AudioPlayer _audioPlayer;
//   PlayerState? _audioPlayerState;
//   Duration? _duration;
//   Duration? _position;

//   PlayerState _playerState = PlayerState.paused;
//   PlayingRoute _playingRouteState = PlayingRoute.SPEAKERS;
//   StreamSubscription? _durationSubscription;
//   StreamSubscription? _positionSubscription;
//   StreamSubscription? _playerCompleteSubscription;
//   StreamSubscription? _playerErrorSubscription;
//   StreamSubscription? _playerStateSubscription;
//   StreamSubscription<PlayerControlCommand>? _playerControlCommandSubscription;

//   bool get _isPlaying => _playerState == PlayerState.playing;
//   bool get _isPaused => _playerState == PlayerState.paused;
//   String get _durationText => _duration?.toString().split('.').first ?? '';
//   String get _positionText => _position?.toString().split('.').first ?? '';

//   bool get _isPlayingThroughEarpiece =>
//       _playingRouteState == PlayingRoute.EARPIECE;

//   _AudioPlayerWidgetState(this.url, this.mode);

//   @override
//   void initState() {
//     super.initState();
//     _initAudioPlayer();
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     _durationSubscription?.cancel();
//     _positionSubscription?.cancel();
//     _playerCompleteSubscription?.cancel();
//     _playerErrorSubscription?.cancel();
//     _playerStateSubscription?.cancel();
//     _playerControlCommandSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final kColor = Theme.of(context).primaryColor;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             // mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 key: const Key('play_button'),
//                 onPressed: _isPlaying ? null : _play,
//                 iconSize: 30.0,
//                 icon: const Icon(Icons.play_arrow),
//                 color: kColor,
//               ),
//               IconButton(
//                 key: const Key('pause_button'),
//                 onPressed: _isPlaying ? _pause : null,
//                 iconSize: 30.0,
//                 icon: const Icon(Icons.pause),
//                 color: kColor,
//               ),
//               IconButton(
//                 key: const Key('stop_button'),
//                 onPressed: _isPlaying || _isPaused ? _stop : null,
//                 iconSize: 30.0,
//                 icon: const Icon(Icons.stop),
//                 color: kColor,
//               ),
//               IconButton(
//                 onPressed: _earpieceOrSpeakersToggle,
//                 iconSize: 30.0,
//                 icon: _isPlayingThroughEarpiece
//                     ? const Icon(Icons.volume_up)
//                     : const Icon(Icons.headset),
//                 color: kColor,
//               ),
//             ],
//           ),
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Stack(
//                 children: [
//                   Slider(
//                     activeColor: Colors.grey,
//                     inactiveColor: kColor,
//                     onChanged: (v) {
//                       final duration = _duration;
//                       if (duration == null) {
//                         return;
//                       }
//                       final Position = v * duration.inMilliseconds;
//                       _audioPlayer
//                           .seek(Duration(milliseconds: Position.round()));
//                     },
//                     value: (_position != null &&
//                             _duration != null &&
//                             _position!.inMilliseconds > 0 &&
//                             _position!.inMilliseconds <
//                                 _duration!.inMilliseconds)
//                         ? _position!.inMilliseconds / _duration!.inMilliseconds
//                         : 0.0,
//                   ),
//                 ],
//               ),
//             ),
//             Text(
//               _position != null
//                   ? '$_positionText / $_durationText'
//                   : _duration != null
//                       ? _durationText
//                       : '',
//               style: const TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//         // Text('State: $_audioPlayerState'),
//       ],
//     );
//   }

//   void _initAudioPlayer() {
//     _audioPlayer = AudioPlayer(mode: mode);

//     _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
//       setState(() => _duration = duration);

//       if (Theme.of(context).platform == TargetPlatform.iOS) {
//         // optional: listen for notification updates in the background
//         _audioPlayer.notificationService.startHeadlessService();

//         // set at least title to see the notification bar on ios.
//         _audioPlayer.notificationService.setNotification(
//           title: 'App Name',
//           artist: 'Artist or blank',
//           albumTitle: 'Name or blank',
//           imageUrl: 'Image URL or blank',
//           forwardSkipInterval: const Duration(seconds: 30), // default is 30s
//           backwardSkipInterval: const Duration(seconds: 30), // default is 30s
//           duration: duration,
//           enableNextTrackButton: true,
//           enablePreviousTrackButton: true,
//         );
//       }
//     });

//     _positionSubscription =
//         _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
//               _position = p;
//             }));

//     _playerCompleteSubscription =
//         _audioPlayer.onPlayerCompletion.listen((event) {
//       _onComplete();
//       setState(() {
//         _position = _duration;
//       });
//     });

//     _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
//       print('audioPlayer error : $msg');
//       setState(() {
//         _playerState = PlayerState.stopped;
//         _duration = const Duration();
//         _position = const Duration();
//       });
//     });

//     _playerControlCommandSubscription =
//         _audioPlayer.notificationService.onPlayerCommand.listen((command) {
//       print('command: $command');
//     });

//     _audioPlayer.onPlayerStateChanged.listen((state) {
//       if (mounted) {
//         setState(() {
//           _audioPlayerState = state;
//         });
//       }
//     });

//     _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
//       if (mounted) {
//         setState(() => _audioPlayerState = state);
//       }
//     });

//     _playingRouteState = PlayingRoute.SPEAKERS;
//   }

//   Future<int> _play() async {
//     final playPosition = (_position != null &&
//             _duration != null &&
//             _position!.inMilliseconds > 0 &&
//             _position!.inMilliseconds < _duration!.inMilliseconds)
//         ? _position
//         : null;
//     final result = await _audioPlayer.play(url, position: playPosition);
//     if (result == 1) {
//       setState(() => _playerState = PlayerState.playing);
//     }

//     return result;
//   }

//   Future<int> _pause() async {
//     final result = await _audioPlayer.pause();
//     if (result == 1) {
//       setState(() => _playerState = PlayerState.paused);
//     }
//     return result;
//   }

//   Future<int> _earpieceOrSpeakersToggle() async {
//     final result = await _audioPlayer.earpieceOrSpeakersToggle();
//     if (result == 1) {
//       setState(() => _playingRouteState = _playingRouteState.toggle());
//     }
//     return result;
//   }

//   Future<int> _stop() async {
//     final result = await _audioPlayer.stop();
//     if (result == 1) {
//       setState(() {
//         _playerState = PlayerState.stopped;
//         _position = const Duration();
//       });
//     }
//     return result;
//   }

//   void _onComplete() {
//     setState(() => _playerState = PlayerState.stopped);
//   }
// }
