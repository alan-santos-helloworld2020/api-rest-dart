import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserRouter {
  Handler get handler {
    final router = Router();

    router.get("/", (Request req) {
      return Response(200,
          body: jsonEncode(
              {"id": 1, "email": "admin@gmail.com", "password": "admin123"}),
          headers: {"Content-Type": "application/json; charset=utf-8"});
    });

    router.get("/<id>", (Request req, String id) {
      return Response(
        200,
        body:jsonEncode({"id": id}),
        headers: {"Content-Type": "application/json; charset=utf-8"}
      );
    });

    router.post("/", (Request req) async {
      var result = await req.readAsString();
      Map dados = jsonDecode(result);
      return Response.ok(dados["email"]);
    });

    return router;
  }
}
