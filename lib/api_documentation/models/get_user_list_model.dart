class UserListResponse {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<Datum> data;
  final Support? support;
  final Meta? meta;

  UserListResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
    required this.meta,
  });

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    return UserListResponse(
      page: json["page"],
      perPage: json["per_page"],
      total: json["total"],
      totalPages: json["total_pages"],
      data:
          json["data"] == null
              ? []
              : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      support:
          json["support"] == null ? null : Support.fromJson(json["support"]),
      meta: json["_meta"] == null ? null : Meta.fromJson(json["_meta"]),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
    );
  }
}

class Meta {
  Meta({
    required this.poweredBy,
    required this.docsUrl,
    required this.upgradeUrl,
    required this.exampleUrl,
    required this.variant,
    required this.message,
    required this.cta,
    required this.context,
  });

  final String? poweredBy;
  final String? docsUrl;
  final String? upgradeUrl;
  final String? exampleUrl;
  final String? variant;
  final String? message;
  final Cta? cta;
  final String? context;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      poweredBy: json["powered_by"],
      docsUrl: json["docs_url"],
      upgradeUrl: json["upgrade_url"],
      exampleUrl: json["example_url"],
      variant: json["variant"],
      message: json["message"],
      cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
      context: json["context"],
    );
  }
}

class Cta {
  Cta({required this.label, required this.url});

  final String? label;
  final String? url;

  factory Cta.fromJson(Map<String, dynamic> json) {
    return Cta(label: json["label"], url: json["url"]);
  }
}

class Support {
  Support({required this.url, required this.text});

  final String? url;
  final String? text;

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(url: json["url"], text: json["text"]);
  }
}
