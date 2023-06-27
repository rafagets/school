import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shcool/providers/afazer_provider.dart';
import 'package:shcool/providers/config_provider.dart';

class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => AfazerProvider()),
      ChangeNotifierProvider(create: (_) => ConfigProvider()),
    ];
  }
}
