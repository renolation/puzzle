import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';

import 'models/puzzle.dart';


final photoProvider = StateProvider<String>((ref) => '');

// final listImageProvider = StateProvider<List<Image>>((ref) => []);

final listImageControllerProvider = StateNotifierProvider.autoDispose<ListImageController, List<List<Puzzle>>>((ref){
  return ListImageController();
});

class ListImageController extends StateNotifier<List<List<Puzzle>>> {
  ListImageController(): super([]);

   splitImage(List<int> input)  {
    img.Image?  image =  cropCenterSquare(img.decodeImage(Uint8List.fromList(input)));
    int x = 0, y = 0;
    int width = (image!.width / 3).floor();
    int height = (image.height / 3).floor();

    // split image to parts
    List<img.Image> parts = <img.Image>[];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        parts.add(img.copyCrop(image, x: x, y: y, width: width, height: height));
        x += width;
      }
      x = 0;
      y += height;
    }

    List<Puzzle> output = [];

    for(int i = 0; i< parts.length;i++){
      img.Color color = img.ColorRgba8(Colors.red.red,Colors.red.green,Colors.red.blue,Colors.red.alpha);
      if(i == parts.length -1){
        img.fill(parts[i], color: color);
      }
      Puzzle puzzle = Puzzle(unit8List: img.encodeJpg(parts[i]), index: i);
      output.add(puzzle);
     }
    List<List<Puzzle>> matrix = List.generate(3, (i) => output.sublist(i*3, i*3+3));

    state = matrix;
    // return output;
  }

  img.Image? cropCenterSquare(img.Image? image) {
    int width = image!.width;
    int height = image.height;
    int left = 0;
    int top = 0;
    int right = 0;
    int bottom = 0;

    final shorterSide = width > height ? height : width;
    img.Image cropped = img.copyCrop(image,
        x: width ~/ 2 - shorterSide ~/ 2,
        y: height ~/ 2 - shorterSide ~/ 2,
        width: shorterSide,
        height: shorterSide);
    return cropped;
  }

}