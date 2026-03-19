import 'package:flutter/material.dart';

const Color _purple = Color(0xFF5B3FA6);

class BookModel {
  final String title;
  final String price;
  final String imagePath;
  final Color placeholderColor;

  const BookModel({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.placeholderColor,
  });
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static const String routeName = '/category';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _selectedCategory = 0;
  int _navIndex = 1;

  final List<String> _categories = [
    'All',
    'Novels',
    'Self Love',
    'Science',
    'Romance',
    'History',
  ];

  final List<BookModel> _books = [
    BookModel(
      title: 'The Da Vinci Code',
      price: '\$19.99',
      imagePath: 'assets/images/davinci.png',
      placeholderColor: const Color(0xFF8B1A1A),
    ),
    BookModel(
      title: 'Carrie Fisher',
      price: '\$27.12',
      imagePath: 'assets/images/carrie_fisher.png',
      placeholderColor: const Color(0xFF4A90D9),
    ),
    BookModel(
      title: 'The Good Sister',
      price: '\$27.12',
      imagePath: 'assets/images/good_sister.png',
      placeholderColor: const Color(0xFFD4A017),
    ),
    BookModel(
      title: 'The Waiting',
      price: '\$27.12',
      imagePath: 'assets/images/the_waiting.png',
      placeholderColor: const Color(0xFF5B8A5B),
    ),
    BookModel(
      title: 'Where Are You',
      price: '\$14.99',
      imagePath: 'assets/images/where_are_you.png',
      placeholderColor: const Color(0xFF3A7BD5),
    ),
    BookModel(
      title: 'Bright',
      price: '\$22.00',
      imagePath: 'assets/images/bright.png',
      placeholderColor: const Color(0xFFE91E8C),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            _buildCategoryTabs(),
            const SizedBox(height: 16),
            Expanded(child: _buildGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.search, size: 26, color: Colors.black87),
          const Expanded(
            child: Text(
              'Category',
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

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _categories.length,
        itemBuilder: (_, i) {
          final isSelected = i == _selectedCategory;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? _purple : Colors.transparent,
                    width: 2.5,
                  ),
                ),
              ),
              child: Text(
                _categories[i],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? _purple : Colors.grey.shade500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: _books.length,
      itemBuilder: (_, i) => _BookCard(book: _books[i]),
    );
  }

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

class _BookCard extends StatelessWidget {
  final BookModel book;
  const _BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                book.imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: book.placeholderColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.menu_book_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Title
          Text(
            book.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 3),

          // Price
          Text(
            book.price,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
