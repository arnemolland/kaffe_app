import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:args/args.dart';
import 'package:image/image.dart';

String imagesPath = '../assets/images/';
String sourcePath = imagesPath + '3.0x/';
String androidResPath = '../android/app/src/main/res/';
String iosResPath = '..ios/Runner/Assets.xcassets/AppIcon.appiconset/';
String androidIcon = 'ic_launcher.png';

bool isValid;

void main(List<String> arguments) {
  final parser = new ArgParser();
  var results = parser.parse(arguments);
  results.rest.forEach((arg) => (arg.endsWith('.png') || arg.endsWith('.jpg'))
      ? isValid = true
      : isValid = false);
  if (isValid) {
    List<String> paths = results.rest;
    paths.forEach((element) => resize(
        decodeImage(new File(sourcePath + element).readAsBytesSync())));
  } else {
    stderr.writeln('Only JPEG og PNG files are supported.');
    exit(2);
  }
}

void resize(Image image) {
  Image xxxhdpi = copyResize(image, 192);
  Image xxhdpi = copyResize(image, 144);
  Image xhdpi = copyResize(image, 96);
  Image hdpi = copyResize(image, 72);
  Image mdpi = copyResize(image, 48);

  // Save Android assets
  saveImage(xxxhdpi, p.join(androidResPath, 'mipmap-xxxhdpi'), androidIcon);
  saveImage(xxhdpi, p.join(androidResPath, 'mipmap-xxhdpi'), androidIcon);
  saveImage(xhdpi, p.join(androidResPath, 'mipmap-xhdpi'), androidIcon);
  saveImage(hdpi, p.join(androidResPath, 'mipmap-hdpi'), androidIcon);
  saveImage(mdpi, p.join(androidResPath, 'mipmap-mdpi'), androidIcon);

  Image ios1024 = copyResize(image, 1024);
  Image ios180 = copyResize(image, 180);
  Image ios167 = copyResize(image, 167);
  Image ios152 = copyResize(image, 152);
  Image ios120 = copyResize(image, 120);
  Image ios87 = copyResize(image, 87);
  Image ios80 = copyResize(image, 80);
  Image ios76 = copyResize(image, 76);
  

}

void saveImage(Image image, String location, String name) async {
  String path = p.join(imagesPath, location);
  bool exists = await Directory(path).exists();
  if (!exists) {
    await new Directory(path).create();
  }
  new File(p.join(path, name))
    ..writeAsBytesSync(
        name.endsWith('.png') ? encodePng(image) : encodeJpg(image));
}
