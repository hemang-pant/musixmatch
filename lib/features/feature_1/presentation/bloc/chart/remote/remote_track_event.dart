abstract class RemoteTrackEvent {
  const RemoteTrackEvent();
}

class GetTrack extends RemoteTrackEvent {
  final int? trackId;

  const GetTrack(
    {
    this.trackId
  });
} 