class MapUtil {
  static String getStaticMapUrl(double lat, double lng,
      {int zoom = 12, int width = 600, int height = 400, String? apiKey}) {
    String baseUrl = "https://maps.googleapis.com/maps/api/staticmap";
    String marker = "markers=color:red%7Clabel:P%7C$lat,$lng";
    String size = "size=${width}x$height";
    String center = "center=$lat,$lng";
    String zoomLevel = "zoom=$zoom";

    String keyParam = apiKey != null ? "&key=$apiKey" : "";

    return "$baseUrl?$center&$zoomLevel&$size&$marker$keyParam";
  }
}
