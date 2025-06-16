import 'package:isar/isar.dart';

part 'offline_package.g.dart';

@Collection()
class OfflinePackage {
  Id id = Isar.autoIncrement;

  late int userId;

  late String packageName;

  late String packageDescription;

  List<int> lessonIds = [];

  List<int> topicIds = [];
  List<int> quizIds = [];
  int totalSize = 0; // Size in bytes
  int downloadedSize = 0; // Downloaded size in bytes
  String status =
      'pending'; // 'pending', 'downloading', 'completed', 'failed', 'paused'
  double progress = 0.0; // 0.0 to 1.0

  DateTime? downloadStartedAt;

  DateTime? downloadCompletedAt;

  DateTime? lastSyncedAt;

  bool autoSync = false;
  bool isPremiumContent = false;
  List<String> downloadedAssets = [];
  List<String> failedAssets = [];

  String? errorMessage;

  int retryCount = 0;
  int maxRetries = 3;

  DateTime createdAt = DateTime.now();

  DateTime updatedAt = DateTime.now();

  // Computed properties
  bool get isDownloading => status == 'downloading';

  bool get isCompleted => status == 'completed';

  bool get isFailed => status == 'failed';

  bool get isPending => status == 'pending';

  bool get isPaused => status == 'paused';

  bool get canRetry => isFailed && retryCount < maxRetries;

  double get progressPercentage => progress * 100;

  String get progressText => '${progressPercentage.toInt()}%';

  String get sizeText {
    return _formatBytes(totalSize);
  }

  String get downloadedSizeText {
    return _formatBytes(downloadedSize);
  }

  String get downloadProgressText {
    return '$downloadedSizeText / $sizeText';
  }

  String get statusText {
    switch (status) {
      case 'pending':
        return 'Pending';
      case 'downloading':
        return 'Downloading';
      case 'completed':
        return 'Completed';
      case 'failed':
        return 'Failed';
      case 'paused':
        return 'Paused';
      default:
        return 'Unknown';
    }
  }

  @Ignore()
  Duration? get downloadDuration {
    if (downloadStartedAt == null) return null;
    final endTime = downloadCompletedAt ?? DateTime.now();
    return endTime.difference(downloadStartedAt!);
  }

  String? get downloadDurationText {
    final duration = downloadDuration;
    if (duration == null) return null;

    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds.remainder(60)}s';
    } else {
      return '${duration.inSeconds}s';
    }
  }

  @Ignore()
  Duration? get timeSinceLastSync {
    if (lastSyncedAt == null) return null;
    return DateTime.now().difference(lastSyncedAt!);
  }

  bool get needsSync {
    if (lastSyncedAt == null) return true;
    final timeSince = timeSinceLastSync;
    return timeSince != null && timeSince.inHours > 24;
  }

  // Methods
  void startDownload() {
    status = 'downloading';
    downloadStartedAt = DateTime.now();
    progress = 0.0;
    downloadedSize = 0;
    errorMessage = null;
    updatedAt = DateTime.now();
  }

  void updateProgress(int newDownloadedSize) {
    downloadedSize = newDownloadedSize;
    if (totalSize > 0) {
      progress = (downloadedSize / totalSize).clamp(0.0, 1.0);
    }
    updatedAt = DateTime.now();
  }

  void completeDownload() {
    status = 'completed';
    downloadCompletedAt = DateTime.now();
    progress = 1.0;
    downloadedSize = totalSize;
    errorMessage = null;
    updatedAt = DateTime.now();
  }

  void failDownload(String error) {
    status = 'failed';
    errorMessage = error;
    retryCount++;
    updatedAt = DateTime.now();
  }

  void pauseDownload() {
    status = 'paused';
    updatedAt = DateTime.now();
  }

  void resumeDownload() {
    status = 'downloading';
    updatedAt = DateTime.now();
  }

  void resetDownload() {
    status = 'pending';
    progress = 0.0;
    downloadedSize = 0;
    downloadStartedAt = null;
    downloadCompletedAt = null;
    errorMessage = null;
    retryCount = 0;
    downloadedAssets.clear();
    failedAssets.clear();
    updatedAt = DateTime.now();
  }

  void addDownloadedAsset(String assetUrl) {
    if (!downloadedAssets.contains(assetUrl)) {
      downloadedAssets.add(assetUrl);
      updatedAt = DateTime.now();
    }
  }

  void addFailedAsset(String assetUrl) {
    if (!failedAssets.contains(assetUrl)) {
      failedAssets.add(assetUrl);
      updatedAt = DateTime.now();
    }
  }

  void markSynced() {
    lastSyncedAt = DateTime.now();
    updatedAt = DateTime.now();
  }

  String _formatBytes(int bytes) {
    const suffixes = ['B', 'KB', 'MB', 'GB'];
    var i = 0;
    double size = bytes.toDouble();

    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }

    return '${size.toStringAsFixed(i == 0 ? 0 : 1)} ${suffixes[i]}';
  }
}
