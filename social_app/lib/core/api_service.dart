// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:social_app/core/post_model.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://blog-posts-cd2e31345f2b.herokuapp.com/api/v1'));

  Future<List<Post>> getPosts() async {
    try {
      final response = await _dio.get('/blog/');
      log('RES $response');
      return (response.data as List)
          .map((post) => Post.fromJson(post))
          .toList();
    } catch (e) {
      log('ERROR GET $e');
      throw Exception('Failed to load posts');
    }
  }

  Future<void> createPost(Post post, {File? image}) async {
    try {
      var data = FormData.fromMap({
        if (image != null)
          'image_file': [
            await MultipartFile.fromFile(
              image.path,
            )
          ],
        'title': post.title,
        'content': post.content,
        'author': post.author
      });
      var response = await _dio.post(
        '/blog/',
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      log('ERROR  $e');
      throw Exception('Failed to load posts');
    }
  }
}
