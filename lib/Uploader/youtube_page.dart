import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _url = 'https://www.wikipedia.org/';

class YOutubePage extends StatefulWidget {
  YOutubePage({Key? key}) : super(key: key);

  @override
  _YOutubePageState createState() => _YOutubePageState();
}

class _YOutubePageState extends State<YOutubePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Youtube")),
        body: Expanded(
            child: WebView(
                key: UniqueKey(),
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: _url)));
  }
}
