import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

abstract class ServerService {
  Future<void> start();
  Future<void> stop();
}


@injectable
class LocalServerService implements ServerService {
  HttpServer? _server;

  @override
  Future<void> start() async {
    final router = Router();

    router.post('/pois', (Request req) async {
      final body = await req.readAsString();
      print("Received POIs JSON: $body");
      return Response.ok("OK");
    });

    _server = await io.serve(router, 'localhost', 8080);
    print("Local server running on http://localhost:8080/");
  }

  @override
  Future<void> stop() async {
    await _server?.close();
    _server = null;
  }
}
