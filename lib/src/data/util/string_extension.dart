extension StringExtension on String {
  String format(Map<String, dynamic> params) => interpolate(this, params);
}

String interpolate(String string, Map<String, dynamic> params) {
  String result = string;
  params.forEach(
    (key, value) {
      result = result.replaceAll(':{$key}', value.toString());
    },
  );
  return result;
}
