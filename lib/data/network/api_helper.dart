import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:edtech_app/data/model/quiz_model.dart';
import 'package:flutter/services.dart';

class ApiHelper {
  final Dio dio;

  ApiHelper({required this.dio});
  Future<List<QuizModel>> loadQuizQuestions() async {
    final String jsonString = await rootBundle.loadString('assets/quiz_data.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => QuizModel.fromJson(json)).toList();
  }
}
