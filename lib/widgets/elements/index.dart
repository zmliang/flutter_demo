import 'Form/index.dart' as Form;
import 'Frame/index.dart' as Frame;
import 'Media/index.dart' as Media;

List getWidgets() {
  List result = [];
  result.addAll(Form.getWidgets());
  result.addAll(Frame.getWidgets());
  result.addAll(Media.getWidgets());
  return result;
}
