import 'package:flutter/material.dart';

import 'constants/enums.dart';
import 'widgets/loading_widget.dart';
import 'widgets/some_error_widget.dart';

class CommonMethods {
  static Widget checkServiceStatusAndReturnWidget(
      {required BookStatus status,
      required Widget loadedWidget,
      Widget? someErrorWidget,
      Widget? loadingWidget}) {
    switch (status) {
      case BookStatus.loading:
        return loadingWidget ?? const LoadingWidget();

      case BookStatus.error:
        return someErrorWidget ?? SomeErrorWidget();

      case BookStatus.loaded:
        return loadedWidget;

      default:
        return const SizedBox();
    }
  }
}
