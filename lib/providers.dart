import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final photoProvider = StateProvider<String>((ref) => '');

final listImageProvider = StateProvider<List<Image>>((ref) => []);