import 'package:earth_force_assignment/core/channels/platform_channel_adapter.dart';
import 'package:injectable/injectable.dart';

abstract class DeviceInfoDatasource {
  Stream<Map<String, dynamic>> deviceProperties();
}

@injectable
class PlatformDeviceInfoDatasource implements DeviceInfoDatasource {
  final PlatformChannelAdapter _channelAdapter;

  PlatformDeviceInfoDatasource(this._channelAdapter);

  @override
  Stream<Map<String, dynamic>> deviceProperties() {
   return _channelAdapter.getEventChannel().map(
         (event) => Map<String, dynamic>.from(event),
   );
  }
}