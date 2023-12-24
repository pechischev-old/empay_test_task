import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class Task with _$Task {
  const Task._();

  factory Task({
    @Default('') id,
    @Required() title,
    @Default('') description,
    @Default(false) completed,
  }) = _Task;
}
