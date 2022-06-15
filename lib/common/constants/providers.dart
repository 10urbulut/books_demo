import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../mvvm/view_models/book_view_model.dart';
import '../../mvvm/view_models/theme_view_model.dart';

class Providers {
  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider(create: (_) => BookViewModel()),
      ChangeNotifierProvider(create: (_) => ThemeViewModel()),
    ];
  }
}
