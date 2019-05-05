import './Material/index.dart' as Material;
import './Cupertino/index.dart' as Cupertino;

List getWidgets() {
  List result = [];
  result.addAll(Material.widgetPoints);
  result.addAll(Cupertino.widgetPoints);
  return result;
}
