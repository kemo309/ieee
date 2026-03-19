import 'package:flutter/material.dart';

const Color _purple = Color(0xFF5B3FA6);

enum OrderStatus { onTheWay, delivered, cancelled }

class NotificationItem {
  final String bookTitle;
  final String imagePath;
  final int itemCount;
  final OrderStatus status;

  const NotificationItem({
    required this.bookTitle,
    required this.imagePath,
    required this.itemCount,
    required this.status,
  });
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const String routeName = '/notification';

  static const List<NotificationItem> _current = [
    NotificationItem(
      bookTitle: 'Carrie Fisher',
      imagePath: 'assets/images/carrie_fisher.png',
      itemCount: 1,
      status: OrderStatus.onTheWay,
    ),
  ];

  static const List<NotificationItem> _october = [
    NotificationItem(
      bookTitle: 'The Da Vinci Code',
      imagePath: 'assets/images/davinci.png',
      itemCount: 1,
      status: OrderStatus.delivered,
    ),
    NotificationItem(
      bookTitle: 'Carrie Fisher',
      imagePath: 'assets/images/carrie_fisher.png',
      itemCount: 5,
      status: OrderStatus.delivered,
    ),
    NotificationItem(
      bookTitle: 'The Waiting',
      imagePath: 'assets/images/the_waiting.png',
      itemCount: 2,
      status: OrderStatus.cancelled,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 8),
                  _buildSectionLabel('Current'),
                  const SizedBox(height: 10),
                  ..._current.map((n) => _NotificationCard(item: n)),
                  const SizedBox(height: 20),
                  _buildSectionLabel('October 2021'),
                  const SizedBox(height: 10),
                  ..._october.map((n) => _NotificationCard(item: n)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: Colors.black87,
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
          const Expanded(
            child: Text(
              'Notification',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          // Placeholder to center title
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem item;
  const _NotificationCard({required this.item});

  // Status config
  String get _statusText {
    switch (item.status) {
      case OrderStatus.onTheWay:
        return 'On the way';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get _statusColor {
    switch (item.status) {
      case OrderStatus.onTheWay:
        return const Color(0xFF4CAF50);
      case OrderStatus.delivered:
        return const Color(0xFF4CAF50);
      case OrderStatus.cancelled:
        return const Color(0xFFE53935);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Book thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.imagePath,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: _placeholderColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.bookTitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      _statusText,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: _statusColor,
                      ),
                    ),
                    Text(
                      '  ·  ${item.itemCount} ${item.itemCount == 1 ? 'item' : 'items'}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Arrow
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  Color get _placeholderColor {
    switch (item.status) {
      case OrderStatus.onTheWay:
        return const Color(0xFF8B4513);
      case OrderStatus.delivered:
        return const Color(0xFF5B3FA6);
      case OrderStatus.cancelled:
        return const Color(0xFFE91E8C);
    }
  }
}
