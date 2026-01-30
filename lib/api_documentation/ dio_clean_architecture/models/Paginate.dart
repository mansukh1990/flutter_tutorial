import '../utils/utils.dart';

class Paginate {
  final String? total;
  final String? perPage;
  final String? currentPage;
  final String? lastPage;
  final String? firstPageUrl;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? prevPageUrl;

  Paginate({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Paginate.fromJson(Map<String, dynamic> json) {
    return Paginate(
      total: Utils().parseToString(json['total']),
      perPage: Utils().parseToString(json['per_page']),
      currentPage: Utils().parseToString(json['current_page']),
      lastPage: Utils().parseToString(json['last_page']),
      firstPageUrl: json['first_page_url'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      prevPageUrl: json['prev_page_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'per_page': perPage,
      'current_page': currentPage,
      'last_page': lastPage,
      'first_page_url': firstPageUrl,
      'last_page_url': lastPageUrl,
      'next_page_url': nextPageUrl,
      'prev_page_url': prevPageUrl,
    };
  }
}
