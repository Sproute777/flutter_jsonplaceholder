// {@template ads_retry_policy}
/// A retry policy for ads.
/// {@endtemplate}
class NetworkRetryPolicy {
  /// {@macro ads_retry_policy}
  const NetworkRetryPolicy({
    this.maxRetryCount = 3,
    this.retryIntervals = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 4),
    ],
  });

  /// The maximum number of retries to load an ad.
  final int maxRetryCount;

  /// The interval between retries to load an ad.
  final List<Duration> retryIntervals;

  /// Returns the interval for the given retry.
  Duration getIntervalForRetry(int retry) {
    if (retry <= 0 || retry > maxRetryCount) return Duration.zero;
    return retryIntervals[retry - 1];
  }
}
