import 'package:flutter/services.dart';

const String BASE_PLATFORM_CHANNEL = "com.example.earth_force.channel";
const String EVENTS_ENDPOINT = "/events";
abstract class PlatformChannelAdapter{
  Future<dynamic> invokeMethod(String method, Map<String, dynamic> params);
  Stream<dynamic> getEventChannel();
}

class ChannelAdapterImpl extends PlatformChannelAdapter {

  final String channelName;
  late EventChannel _eventChannel;
  late MethodChannel _methodsChannel;

  ChannelAdapterImpl({this.channelName = BASE_PLATFORM_CHANNEL}) {
    _eventChannel = EventChannel("$channelName$EVENTS_ENDPOINT");
    _methodsChannel = MethodChannel(channelName);
  }

  @override
  Stream<dynamic> getEventChannel() {
    return _eventChannel.receiveBroadcastStream();
  }

  @override
  Future invokeMethod(String method, Map<String, dynamic> params) {
    return _methodsChannel.invokeMapMethod(method, params);
  }
}