class Tenant {
  final int tenantId;
  final String tenantName;
  final String tenantDescription;
  final String tenantLogo;
  final String tenantOpenTime;
  final String tenantCloseTime;
  final String status;

  const Tenant({
    required this.tenantId,
    required this.tenantName,
    required this.tenantDescription,
    required this.tenantLogo,
    required this.tenantOpenTime,
    required this.tenantCloseTime,
    required this.status,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'tenantId': int tenantId,
        'tenantName': String tenantName,
        'tenantDescription': String tenantDescription,
        'tenantLogo': String tenantLogo,
        'tenantOpenTime': String tenantOpenTime,
        'tenantCloseTime': String tenantCloseTime,
        'status': String status,
      } =>
        Tenant(
          tenantId: tenantId,
          tenantName: tenantName,
          tenantDescription: tenantDescription,
          tenantLogo: tenantLogo,
          tenantOpenTime: tenantOpenTime,
          tenantCloseTime: tenantCloseTime,
          status: status,
        ),
      _ => throw const FormatException('Failed to load tenant.'),
    };
  }
}
