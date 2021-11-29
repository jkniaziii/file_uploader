import 'dart:convert';
import 'dart:io';
import 'package:ffile_uploader/Uploader/new_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FileUploaded extends StatefulWidget {
  FileUploaded({Key? key}) : super(key: key);

  @override
  _FileUploadedState createState() => _FileUploadedState();
}

class _FileUploadedState extends State<FileUploaded> {
  var csv;
  String bytes = "";

  var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  dynamic postData() async {
    final request = http.MultipartRequest('POST', uri);

    request.fields['title'] = "Bytes";
    request.fields['bytes'] = bytes;
    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final Map<String, dynamic> responseData = json.decode(response.body);
      return print(
          "__________+_+_+_+_+__________________${responseData['title']}");
    } catch (e) {
      print(
          "_____________________error__________+_+_+_+_+__________________${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Uploader"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text("Upload"),
            onPressed: () async {
              var result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.custom,
                  allowedExtensions: ['csv']);
              if (result == null) return;
              final file = result.files.first;
              openFile(file);
              print(file.name);
              // setState(() {
              //   csv = result.files.first;
              // });

              Codec<String, String> stringToBase64 = utf8.fuse(base64);
              String encoded = stringToBase64.encode("file");

              // openFile(file);

              setState(() {
                bytes = file.name;
              });
            },
          ),
          ElevatedButton(
            child: Text('Send Data'),
            onPressed: () {
              postData();
            },
          ),
          Text("File Name: ${bytes}"),
          TextFormField(),
          ElevatedButton(
            child: Text('Change Screen'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");
    return newFile;
  }

  void openFile(PlatformFile file) async {
    // await OpenFile.open(file);
  }
  // void openFiles(List<PlatformFile> files)=>
  // Navigator.of(context).push(MaterialPageRoute(
  //   builder: (files)=>FilesPage(
  //     files: files,
  //     onOpenedile: openFile,
  //     ))
}
