import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String uploadUrl = 'http://185.87.111.206/myespoo/upload';

class NetworkApi {
  static uploadImage(File imageFile, Function cb) async {
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(uploadUrl);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen(
      (value) {
        if (response.statusCode == 200) {
          Map<String, dynamic> res = json.decode(value);
          String fileName = res["file"] as String ?? null;
          print(
              "Image url: http://185.87.111.206/myespoo/image/?fileName=$fileName");
          cb(false, "http://185.87.111.206/myespoo/image/?fileName=$fileName");
        } else {
          print("Invalid request");
          cb(true, null);
        }
      },
    );
  }
}
