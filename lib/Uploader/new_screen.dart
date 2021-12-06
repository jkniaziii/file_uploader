import 'package:ffile_uploader/Uploader/web_wiev.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class NewScreen extends StatefulWidget {
  NewScreen({Key? key}) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  late PlatformFile _image;
  void openFile(PlatformFile file) {
    // OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload File"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.green;
                            return Colors.green; // Use the component's default.
                          },
                        ),
                      ),
                      onPressed: () async {
                        var result = await FilePicker.platform.pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: ['png']);
                        final file = result?.files.first;
                        print("fileName______________________${file?.name}");
                        // openFile(file!);
                        setState(() {
                          _image = file!;
                        });
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Upload"),
                            Icon(Icons.upload_file),
                          ]))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewComponent()));
                  },
                  child: const Text("Go TO Social Media")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Card(
                    color: Colors.white70,
                    elevation: 10,
                    // margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(60),
                      child: Text("CARD 1"),
                    ),
                  ),
                  Card(
                    color: Colors.white70,
                    elevation: 10,
                    // margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(60),
                      child: Text("CARD 1"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
