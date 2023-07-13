import 'package:api/servidor.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() {
  final userRouter = UserRouter();
  final server =
      shelf_io.serve(userRouter.handler, "localhost", 8080);
}
