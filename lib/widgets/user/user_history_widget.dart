import 'package:flutter/material.dart';
import 'package:frontend/widgets/glass_card_widget.dart';

class UserHistoryWidget extends StatelessWidget {
  final String name;
  final String status;
  final String imagePath;

  const UserHistoryWidget({
    super.key,
    required this.name,
    required this.status,
    required this.imagePath,
  });

  // Fungsi untuk menentukan warna background container
  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'in process':
        return const Color.fromARGB(100, 255, 226, 157);
      case 'completed':
        return const Color.fromARGB(75, 175, 255, 157);
      case 'cancelled':
        return const Color.fromARGB(75, 255, 157, 157);
      default:
        return Colors.grey.withValues(alpha: 0.3);
    }
  }

  IconData _getStatusIcon() {
  switch (status.toLowerCase()) {
    case 'completed':
      return Icons.check_circle_outline;
    case 'cancelled':
      return Icons.highlight_off;
    case 'in process':
    default:
      return Icons.timelapse_outlined;
  }
}

  @override
  Widget build(BuildContext context) {

    final backgroundColor = _getStatusColor();

    return GlassCardWidget(
      dark: true,
      height: 90,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Image.asset(imagePath),
          ),
          const SizedBox(width: 23),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Container(
                width: 115,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: backgroundColor, // WARNA OTOMATIS DI SINI
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        _getStatusIcon(),
                        size: 12,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          const SizedBox(width: 65,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("07 March 2026", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),),
              Text("Rp. 67.000")
            ],
          )
        ],
      ),
      onTap: () {
        
      },
    );
  }
}