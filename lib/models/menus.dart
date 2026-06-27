class Menu {
  final int menuId;
  final int tenantId;
  final String menuName;
  final String menuDescription;
  final String menuImage;
  final int menuPrice;
  final int isAvailable;

  const Menu({
    required this.menuId,
    required this.tenantId,
    required this.menuName,
    required this.menuDescription,
    required this.menuImage,
    required this.menuPrice,
    required this.isAvailable,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'menuId': int menuId,
        'tenantId': int tenantId,
        'menuName': String menuName,
        'menuDescription': String menuDescription,
        'menuImage': String menuImage,
        'menuPrice': int menuPrice,
        'isAvailable': int isAvailable,
      } =>
        Menu(
          menuId: menuId,
          tenantId: tenantId,
          menuName: menuName,
          menuDescription: menuDescription,
          menuImage: menuImage,
          menuPrice: menuPrice,
          isAvailable: isAvailable,
        ),
      _ => throw const FormatException('Failed to load menu.'),
    };
  }
}
