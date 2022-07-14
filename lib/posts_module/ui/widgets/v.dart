// import 'package:video_player/video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:visibility_detector/visibility_detector.dart';
//
//
//
// class VideoApp extends StatefulWidget {
//   late String video;
//   VideoApp({required this.video});
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   VideoPlayerController? _controller;
//
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         ' ${widget.video}')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//         _controller?.setLooping(true);
//
//         _controller?.play();
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//
//
//       FittedBox(
//         alignment: Alignment.center,
//         fit: BoxFit.fill,
//         child: SizedBox(
//           height: 429,
//           width: 339,
//           child: VisibilityDetector(
//             key: ObjectKey(_controller),
//             onVisibilityChanged: (visibility) {
//               if (visibility.visibleBounds == 0 &&
//                   this.mounted &&
//                   _controller!.value.isPlaying) {
//                 setState(() {
//                   _controller?.pause();
//                 });
//               }
//             },
//             child: Container(
//
//               child:
//               _controller!.value.isInitialized ?
//               AspectRatio(
//                   aspectRatio: 120 / 200,
//                   child: VideoPlayer(
//                     _controller!,
//                   )) : Container(),),
//           ),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.only(
//           top: 420,
//         ),
//         child: VideoProgressIndicator(
//           _controller!, //controller
//           allowScrubbing: true,
//
//
//           colors: VideoProgressColors(
//             playedColor: Colors.red,
//             bufferedColor: Colors.grey,
//             backgroundColor: Colors.transparent,
//           ),
//         ),
//       ),
//
//       Center(
//           child: IconButton(
//               onPressed: () {
//                 setState(() {
//                   _controller!.value.isPlaying
//                       ? _controller!.pause()
//                       : _controller!.play();
//                 });
//               },
//               icon: _controller!.value.isPlaying
//                   ? AnimatedOpacity(
//                   duration: Duration(seconds: 2),
//                   opacity: 0,
//                   child: Icon(
//                     Icons.pause,
//                   ))
//                   : AnimatedOpacity(
//                   duration: Duration(seconds: 2),
//                   opacity: 1,
//                   child: Icon(
//                     Icons.play_arrow,
//                   ))))
//
//     ]);
//   }
// }
//
//
