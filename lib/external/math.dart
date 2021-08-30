extension Mathf on double {
  double remap(double fromMin, double toMin, double fromMax, double toMax) {
    return (this - fromMin) / (toMin - fromMin) * (toMax - fromMax) + fromMax;
  }
}
