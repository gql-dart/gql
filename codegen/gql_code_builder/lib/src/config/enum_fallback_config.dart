class EnumFallbackConfig {
  final bool generateFallbackValuesGlobally;
  final String? globalEnumFallbackName;
  final Map<String, String> fallbackValueMap;

  const EnumFallbackConfig({
    required this.generateFallbackValuesGlobally,
    this.globalEnumFallbackName,
    required this.fallbackValueMap,
  }) : assert(
            !generateFallbackValuesGlobally || globalEnumFallbackName != null);
}
