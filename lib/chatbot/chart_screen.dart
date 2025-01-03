
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:Nestcare/chatbot/chartmessage.dart';
// import 'package:Nestcare/chatbot/threedots.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ChatMessage> _messages = [];
//   late OpenAI? chatGPT;

//   bool _isTyping = false;

//   bool _isImageSearch = false;

//   @override
//   void initState() {
//     chatGPT = OpenAI.instance.build(
//         token: dotenv.env["API_KEY"],
//         baseOption: HttpSetup(receiveTimeout: Duration(seconds: 6)));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     chatGPT?.close();
//     chatGPT?.genImgClose();
//     super.dispose();
//   }

//   void _sendMessage() async {
//     if (_controller.text.isEmpty) return;
//     ChatMessage message = ChatMessage(
//       text: _controller.text,
//       sender: "user",
//       isImage: false,
//     );

//     setState(() {
//       _messages.insert(0, message);
//       _isTyping = true;
//     });
//     const String kTranslateModelV3 = "text-davinci-003";


//     final request = CompleteText(prompt: message.text, model: kTranslateModelV3);

//     _controller.clear();

//     if (_isImageSearch) {
//       final request = GenerateImage(message.text, 1, size: "256x256");

//       final response = await chatGPT!.generateImage(request);
//       Vx.log(response!.data!.last!.url!);
//       insertNewData(response.data!.last!.url!, isImage: true);
//     } else {
//       final request =
//           CompleteText(prompt: message.text, model: kTranslateModelV3);

//       final response = await chatGPT!.onCompleteText(request: request);
//       Vx.log(response!.choices[0].text);
//       insertNewData(response.choices[0].text, isImage: false);
//     }
//   }

//   void insertNewData(String response, {bool isImage = false}) {

//     ChatMessage botMessage = ChatMessage(
//       text: response,
//       sender: "Aiko",
//       isImage: isImage,
//     );

//     setState(() {
//       _isTyping = false;
//       _messages.insert(0, botMessage);
//     });
//   }

//   Widget _buildTextComposer() {
//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             controller: _controller,
//             onSubmitted: (value) => _sendMessage(),
//             decoration:
//                 InputDecoration.collapsed(hintText: "Ask your doubts..."),
//           ),
//         ),
//         ButtonBar(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.send),
//               onPressed: () {
//                 _isImageSearch = false;
//                 _sendMessage();
//               },
//             ),
//             TextButton(
//                 onPressed: () {
//                   _isImageSearch = true;
//                   _sendMessage();
//                 },
//                 child: const Text("Generate Image"))
//           ],
//         ),
//       ],
//     ).px16();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Aiko"),
//         backgroundColor: Colors.black,),

//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage("images/lg3.png"), fit: BoxFit.cover)
//           ),
//           child: Column(
//             children: [
//               Flexible(
//                   child: ListView.builder(
//                 reverse: true,
//                 padding: Vx.m8,
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   return _messages[index];
//                 },
//               )),
//               if (_isTyping) const ThreeDots(),
//               const Divider(
//                 height: 1.0,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: context.cardColor,
//                 ),
//                 child: _buildTextComposer(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
