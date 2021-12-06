import 'dart:convert';
import 'dart:io';
import 'package:ffile_uploader/Uploader/new_screen.dart';
import 'package:ffile_uploader/Uploader/web_wiev.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FileUploaded extends StatefulWidget {
  FileUploaded({Key? key}) : super(key: key);

  @override
  _FileUploadedState createState() => _FileUploadedState();
}

class _FileUploadedState extends State<FileUploaded> {
  late PlatformFile bytes;

  void postData({required MultipartFile file}) async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var request = http.MultipartRequest('POST', uri);
    request.fields['fields'] = file.field;
    request.files.add(file);
    var response = await request.send();
    print("____________________+__________${response.statusCode}");
    if (response.statusCode == 200) {
      print('Uploaded ...');
    } else {
      print('Something went wrong!');
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
                  allowedExtensions: ['png']);
              if (result == null) return;
              final file = result.files.first;
              final multipartFile = await http.MultipartFile.fromPath(
                  'file', bytes.path.toString());
              // openFile(file);
              print(multipartFile.filename);
              postData(file: multipartFile);
              // final fileCode = result.files.first.toString();
              // Codec<String, String> stringToBase64 = utf8.fuse(base64);
              // String encoded = stringToBase64.encode(fileCode);
              // print("_______________________________${encoded}");
              setState(() {
                bytes = file;
              });
            },
          ),
          // ElevatedButton(
          //   child: Text('Send Data'),
          //   onPressed: () {
          //     postData();
          //   },
          // ),
          // Text("File Name: ${bytes}"),
          TextFormField(),
          ElevatedButton(
            child: const Text('Change Screen'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewScreen()),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewComponent()));
              },
              child: const Text("Go TO Social Media")),
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
    // await OpenFile.open(file.path);
  }
  // void openFiles(List<PlatformFile> files)=>
  // Navigator.of(context).push(MaterialPageRoute(
  //   builder: (files)=>FilesPage(
  //     files: files,
  //     onOpenedile: openFile,
  //     ))
}
