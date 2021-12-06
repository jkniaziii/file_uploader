import 'package:ffile_uploader/Uploader/youtube_page.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewComponent extends StatefulWidget {
  WebViewComponent({Key? key}) : super(key: key);

  @override
  _WebViewComponentState createState() => _WebViewComponentState();
}

class _WebViewComponentState extends State<WebViewComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Youtube Page"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YOutubePage()));
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.youtube_searched_for,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[900]),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.facebook,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amber[900]),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.transfer_within_a_station_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
