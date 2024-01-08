import 'package:medcab_assignment/utils/text_helper.dart';

class FAQResponse {
  final String result;
  final String status;
  final String message;
  final FAQData jsonData;

  const FAQResponse({
    this.result = '',
    this.status = '',
    this.message = '',
    this.jsonData = const FAQData(),
  });

  factory FAQResponse.fromJson(Map<String, dynamic> json) {
    return FAQResponse(
      result: json['result'] ?? "",
      status: json['status'] ?? "",
      message: json['Message'] ?? "",
      jsonData: FAQData.fromJson(json['JSONData'] ?? {}),
    );
  }
}

class FAQData {
  final List<FAQItem> faqList;

  const FAQData({
    this.faqList = const <FAQItem>[],
  });

  factory FAQData.fromJson(Map<String, dynamic> json) {
    List<FAQItem> faqList = [];
    if (json['faqList'] != null) {
      faqList = List<FAQItem>.from(
        (json['faqList'] as List).map((item) => FAQItem.fromJson(item)),
      );
    }

    return FAQData(faqList: faqList);
  }
}

class FAQItem {
  String header;
  String description;

  FAQItem({
    required this.header,
    required this.description,
  });

  factory FAQItem.fromJson(Map<String, dynamic> json) {
    return FAQItem(
      header: TextHelper.htmlToPlainText(json['header'] ?? ""),
      description: TextHelper.htmlToPlainText(json['description'] ?? ""),
    );
  }
}
