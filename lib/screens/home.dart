import 'package:flutter/material.dart';

const Color _purple = Color(0xFF5B3FA6);
const Color _lightGrey = Color(0xFFF5F5F5);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBanner = 0;
  int _navIndex = 0;

  // ── Sample Data ──────────────────────────

  final List<Map<String, dynamic>> _topOfWeek = [
    {
      'title': 'The Kite Runner',
      'price': '\$14.99',
      'color': Color(0xFFD4E8C2),
    },
    {
      'title': 'The Subtle Art of Not Giving a F*ck',
      'price': '\$20.99',
      'color': Color(0xFFE8532A),
    },
    {'title': 'The Art of War', 'price': '\$14.99', 'color': Color(0xFFD42B2B)},
    {'title': 'Sun Tzu', 'price': '\$12.99', 'color': Color(0xFF2B6ED4)},
  ];

  final List<Map<String, String>> _vendors = [
    {'name': 'WE'},
    {'name': 'Alacremy'},
    {'name': 'GooDay'},
    {'name': 'Crane&Co'},
  ];

  final List<Map<String, String>> _authors = [
    {'name': 'John Freeman', 'role': 'Writer'},
    {'name': 'Richard Perston', 'role': 'Writer'},
    {'name': 'Abraham', 'role': 'Novelist'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              _buildBannerSection(),
              const SizedBox(height: 28),
              _buildSectionHeader('Top of Week', onSeeAll: () {}),
              const SizedBox(height: 12),
              _buildTopOfWeek(),
              const SizedBox(height: 28),
              _buildSectionHeader('Best Vendors', onSeeAll: () {}),
              const SizedBox(height: 12),
              _buildVendors(),
              const SizedBox(height: 28),
              _buildSectionHeader('Authors', onSeeAll: () {}),
              const SizedBox(height: 12),
              _buildAuthors(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ── AppBar ───────────────────────────────
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          const Icon(Icons.search, size: 26, color: Colors.black87),
          const Expanded(
            child: Text(
              'Home',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Stack(
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                size: 26,
                color: Colors.black87,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: _purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Banner / Special Offer ───────────────
  Widget _buildBannerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: const Color(0xFFECE8F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Special Offer',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Discount 25%',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _purple,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: const TextStyle(fontSize: 13),
                          ),
                          child: const Text('Order Now'),
                        ),
                      ],
                    ),
                  ),
                ),
                // Book cover image side
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Container(
                    width: 110,
                    color: const Color(0xFFB8A060),
                    child: const Center(
                      child: Icon(
                        Icons.menu_book_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    // Replace with:
                    // Image.asset('assets/images/banner_book.png', fit: BoxFit.cover)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Dot indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: i == _currentBanner ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: i == _currentBanner ? _purple : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // ── Section Header ───────────────────────
  Widget _buildSectionHeader(String title, {required VoidCallback onSeeAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text(
              'See all',
              style: TextStyle(
                fontSize: 13,
                color: _purple,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Top of Week ──────────────────────────
  Widget _buildTopOfWeek() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _topOfWeek.length,
        itemBuilder: (_, i) {
          final book = _topOfWeek[i];
          return Container(
            width: 130,
            margin: const EdgeInsets.only(right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Book cover
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: book['color'] as Color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          book['title'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    // Replace with:
                    // Image.asset('assets/images/book_$i.png', fit: BoxFit.cover)
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  book['title'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  book['price'] as String,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── Best Vendors ─────────────────────────
  Widget _buildVendors() {
    final List<Color> vendorColors = [
      const Color(0xFFF0EDFA),
      const Color(0xFFFFF3E0),
      const Color(0xFFE8F5E9),
      const Color(0xFFFCE4EC),
    ];

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _vendors.length,
        itemBuilder: (_, i) {
          return Container(
            width: 90,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: vendorColors[i % vendorColors.length],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Center(
              child: Text(
                _vendors[i]['name']!,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Authors ──────────────────────────────
  Widget _buildAuthors() {
    final List<Color> avatarColors = [
      const Color(0xFF8B7355),
      const Color(0xFF9E9E9E),
      const Color(0xFF6D8B74),
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _authors.length,
        itemBuilder: (_, i) {
          return Container(
            width: 100,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: avatarColors[i % avatarColors.length],
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _authors[i]['name']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  _authors[i]['role']!,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── Bottom Navigation ────────────────────
  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_rounded, 'label': 'Home'},
      {'icon': Icons.grid_view_rounded, 'label': 'Category'},
      {'icon': Icons.shopping_cart_outlined, 'label': 'Cart'},
      {'icon': Icons.person_outline_rounded, 'label': 'Profile'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (i) {
              final isActive = i == _navIndex;
              return GestureDetector(
                onTap: () => setState(() => _navIndex = i),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        items[i]['icon'] as IconData,
                        color: isActive ? _purple : Colors.grey.shade400,
                        size: 26,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        items[i]['label'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          color: isActive ? _purple : Colors.grey.shade400,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
