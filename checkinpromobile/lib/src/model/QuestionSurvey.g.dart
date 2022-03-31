// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionSurvey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionSurvey _$QuestionSurveyFromJson(Map<String, dynamic> json) {
  return QuestionSurvey(
    json['id'] as int,
    json['question'] as String,
    json['answerOption'] as List,
    (json['answer'] as List)?.map((e) => e as String)?.toList(),
    json['type'] as String,
    json['subType'] as String,
    json['isRequired'] as int,
    json['isHidden'] as int,
    json['sort'] as int,
  );
}

Map<String, dynamic> _$QuestionSurveyToJson(QuestionSurvey instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answerOption': instance.answerOption,
      'answer': instance.answer,
      'type': instance.type,
      'subType': instance.subType,
      'isRequired': instance.isRequired,
      'isHidden': instance.isHidden,
      'sort': instance.sort,
    };
