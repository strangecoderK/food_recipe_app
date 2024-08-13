import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_category_event.freezed.dart';

@freezed
sealed class SelectCategoryEvent<T> with _$SelectCategoryEvent<T> {
  const factory SelectCategoryEvent.showCategory(T data) = ShowCategory;
}