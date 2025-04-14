import 'dart:convert';

class QuizModel {
    final List<QuizData> data;

    QuizModel({
        required this.data,
    });

    QuizModel copyWith({
        List<QuizData>? data,
    }) => 
        QuizModel(
            data: data ?? this.data,
        );

    factory QuizModel.fromJson(String str) => QuizModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuizModel.fromMap(Map<String, dynamic> json) => QuizModel(
        data: List<QuizData>.from(json["data"].map((x) => QuizData.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class QuizData {
    final int id;
    final String question;
    final List<String> options;
    final int correctAnswerIndex;
    final String explaination;

    QuizData({
        required this.id,
        required this.question,
        required this.options,
        required this.correctAnswerIndex,
        required this.explaination,
    });

    QuizData copyWith({
        int? id,
        String? question,
        List<String>? options,
        int? correctAnswerIndex,
        String? explaination,
    }) => 
        QuizData(
            id: id ?? this.id,
            question: question ?? this.question,
            options: options ?? this.options,
            correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
            explaination: explaination ?? this.explaination,
        );

    factory QuizData.fromJson(String str) => QuizData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuizData.fromMap(Map<String, dynamic> json) => QuizData(
        id: json["id"],
        question: json["question"],
        options: List<String>.from(json["options"].map((x) => x)),
        correctAnswerIndex: json["correct_answer_index"],
        explaination: json["explaination"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "correct_answer_index": correctAnswerIndex,
        "explaination": explaination,
    };
}
