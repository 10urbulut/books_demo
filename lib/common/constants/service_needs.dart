class ServiceNeeds {
  static const baseUri = "https://fakerapi.it/api/v1/";

  static Map<String, String> apiHeader = {};
}

enum ServicePaths { books }

extension ServicePathExtension on ServicePaths {
  String get path {
    switch (this) {
      case ServicePaths.books:
        return "books?_quantity=100";
    }
  }
}
