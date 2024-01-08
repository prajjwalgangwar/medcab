import 'package:equatable/equatable.dart';
import 'package:medcab_assignment/models/faq_model.dart';

enum FAQResponseStatus { initial, fetching, fetched, error }

class ManpowerState extends Equatable {
  final FAQResponse faqResponse;
  final FAQResponseStatus faqResponseStatus;
  const ManpowerState(
      {this.faqResponse = const FAQResponse(),
      this.faqResponseStatus = FAQResponseStatus.initial});

  ManpowerState copyWith(
      {FAQResponse? faqResponse, FAQResponseStatus? faqResponseStatus}) {
    return ManpowerState(
        faqResponse: faqResponse ?? this.faqResponse,
        faqResponseStatus: faqResponseStatus ?? this.faqResponseStatus);
  }

  @override
  List<Object?> get props => [faqResponse, faqResponseStatus];
}
