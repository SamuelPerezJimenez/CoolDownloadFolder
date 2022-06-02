import 'package:cool_download_folder/cool_download_folder.dart'
    as cool_download_folder;
import 'package:dcli/dcli.dart';

void main(List<String> arguments) {
  var imageExtensions = [
    ".jpg",
    ".jpeg",
    ".jpe",
    ".jif",
    ".jfif",
    ".jfi",
    ".png",
    ".gif",
    ".webp",
    ".tiff",
    ".tif",
    ".psd",
    ".raw",
    ".arw",
    ".cr2",
    ".nrw",
    ".k25",
    ".bmp",
    ".dib",
    ".heif",
    ".heic",
    ".ind",
    ".indd",
    ".indt",
    ".jp2",
    ".j2k",
    ".jpf",
    ".jpf",
    ".jpx",
    ".jpm",
    ".mj2",
    ".svg",
    ".svgz",
    ".ai",
    ".eps",
    ".ico"
  ];

  var videoExtensions = [
    ".webm",
    ".mpg",
    ".mp2",
    ".mpeg",
    ".mpe",
    ".mpv",
    ".ogg",
    ".mp4",
    ".mp4v",
    ".m4v",
    ".avi",
    ".wmv",
    ".mov",
    ".qt",
    ".flv",
    ".swf",
    ".avchd"
  ];

  var audioExtensions = [".m4a", ".flac", "mp3", ".wav", ".wma", ".aac"];

  var documentExtensions = [
    ".doc",
    ".docx",
    ".odt",
    ".pdf",
    ".xls",
    ".xlsx",
    ".ppt",
    ".pptx"
  ];

  var pathToOrganize = ask(
      'Folder to organize: (ex: /Users/yourName/Downloads)',
      required: true);
  '/Users/lesamjames/Downloads';

  var audioPath = '$pathToOrganize/audios';
  var videoPath = '$pathToOrganize/videos';
  var imagePath = '$pathToOrganize/images';
  var documentPath = '$pathToOrganize/documents';

  createDir(audioPath, recursive: false);
  createDir(videoPath, recursive: false);
  createDir(imagePath, recursive: false);
  createDir(documentPath, recursive: false);

  print('Showing all files');

  find('*.*', workingDirectory: pathToOrganize, recursive: false)
      .forEach((file) {
    var extension = '.${file.split('.').last}';

    if (audioExtensions.contains(extension)) {
      print('Moving $file to $audioPath');
      move(file, audioPath);
    } else if (videoExtensions.contains(extension)) {
      print('Moving $file to $videoPath');
      move(file, videoPath);
    } else if (imageExtensions.contains(extension)) {
      print('Moving $file to $imagePath');
      move(file, imagePath);
    } else if (documentExtensions.contains(extension)) {
      print('Moving $file to $documentPath');
      move(file, documentPath);
    } else {
      print('Unknown file type: $file');
    }
  });
}
