abstract class RemoteChartEvent {
  const RemoteChartEvent();
}

class GetChart extends RemoteChartEvent {
  final int page;
  final String? customCountry;

  const GetChart(
    this.page, {
    this.customCountry,
  });
} 