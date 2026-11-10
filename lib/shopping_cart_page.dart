import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void _log(String msg) {
  debugPrint(msg);
}

// --- Student & Store Configuration ---
const String kStudentName = 'Jules Henri A. Reyes';
const String kCampusLocation = 'DPT Bldg, Matina Campus · Davao City';

// --- Warm Academic Editorial Palette ---
const Color kBg = Color(0xFFF6F5F2);
const Color kCard = Colors.white;
const Color kWell = Color(0xFFF0EFEB);
const Color kLine = Color(0xFFE4E1DA);
const Color kInk = Color(0xFF141413);
const Color kMuted = Color(0xFF686660);
const Color kCrimson = Color(0xFF8B1E2F);
const Color kCrimsonSoft = Color(0xFFF8ECF0);
const Color kGreen = Color(0xFF1F6E43);

const List<FontFeature> kTabular = [FontFeature.tabularFigures()];

BoxDecoration kBox({Color color = kCard, double radius = 14}) => BoxDecoration(
  color: color,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: kLine),
);

/// Pure stateless shopping cart page.
/// All elements are presentational containers with zero interactive click reactions.
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Header(),
                  const SizedBox(height: 14),
                  const _DeliveryCard(),
                  const SizedBox(height: 20),
                  _sectionTitle('Order Items', '3 items'),
                  const SizedBox(height: 8),
                  const _CartItemsGroup(),
                  const SizedBox(height: 12),
                  const _VoucherCard(),
                  const SizedBox(height: 20),
                  _sectionTitle('Order Summary', 'AY 2026–2027'),
                  const SizedBox(height: 8),
                  const _SummaryCard(),
                  const SizedBox(height: 18),
                  const _PlaceOrderButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _sectionTitle(String title, String trailing) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: kInk,
        ),
      ),
      Text(trailing, style: const TextStyle(fontSize: 12, color: kMuted)),
    ],
  );
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _log('Back clicked'),
          child: Container(
            width: 36,
            height: 36,
            decoration: kBox(radius: 10),
            child: const Icon(
              CupertinoIcons.chevron_back,
              size: 16,
              color: kInk,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Bag',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                  color: kInk,
                ),
              ),
              Text(
                'UM Bookstore · Order #UM-8492',
                style: TextStyle(fontSize: 11.5, color: kMuted),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _log('Cart clicked'),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: kBox(radius: 20),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(CupertinoIcons.bag_fill, size: 12, color: kCrimson),
                SizedBox(width: 5),
                Text(
                  '3 items',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: kInk,
                    fontFeatures: kTabular,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DeliveryCard extends StatelessWidget {
  const _DeliveryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: kBox(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: kCrimsonSoft,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.building_2_fill,
                      size: 10,
                      color: kCrimson,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'CAMPUS DISPATCH',
                      style: TextStyle(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: kCrimson,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'ID #553299',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: kMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: kBox(color: kWell, radius: 10),
                child: const Icon(
                  CupertinoIcons.location_solid,
                  size: 16,
                  color: kInk,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deliver to $kStudentName',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: kInk,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      kCampusLocation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 11.5, color: kMuted),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _log('Change delivery address clicked'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: kBox(color: kWell, radius: 7),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: kCrimson,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartItemsGroup extends StatelessWidget {
  const _CartItemsGroup();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBox(),
      clipBehavior: Clip.antiAlias,
      child: const Column(
        children: [
          CartItemCard(
            name: 'Wireless Mouse',
            sku: 'Logitech Pebble M350 · Matte Graphite',
            price: 'PHP 450.00',
            quantity: 1,
            icon: CupertinoIcons.desktopcomputer,
          ),
          Divider(height: 1, indent: 68, color: kLine),
          CartItemCard(
            name: 'USB-C Hub',
            sku: '7-in-1 Aluminum Multiport · 4K HDMI',
            price: 'PHP 850.00',
            quantity: 1,
            icon: CupertinoIcons.bolt_horizontal_circle,
          ),
          Divider(height: 1, indent: 68, color: kLine),
          CartItemCard(
            name: 'Laptop Stand',
            sku: 'Foldable Alloy · Ergonomic Riser',
            price: 'PHP 700.00',
            quantity: 1,
            icon: CupertinoIcons.device_laptop,
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final String sku;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    this.sku = '',
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: kBox(color: kWell, radius: 10),
            child: Icon(icon, size: 20, color: kInk),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: kInk,
                            ),
                          ),
                          if (sku.isNotEmpty)
                            Text(
                              sku,
                              style: const TextStyle(
                                fontSize: 11,
                                color: kMuted,
                              ),
                            ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _log('Remove item: $name'),
                      child: const Icon(
                        CupertinoIcons.trash,
                        size: 14,
                        color: kMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: kInk,
                        fontFeatures: kTabular,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: kBox(color: kWell, radius: 7),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => _log('Decrease quantity: $name'),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              child: Icon(
                                CupertinoIcons.minus,
                                size: 11,
                                color: kMuted,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              '$quantity',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: kInk,
                                fontFeatures: kTabular,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _log('Increase quantity: $name'),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              child: Icon(
                                CupertinoIcons.plus,
                                size: 11,
                                color: kMuted,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VoucherCard extends StatelessWidget {
  const _VoucherCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _log('Voucher clicked: STUDENT10 (-10% OFF applied)'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: kBox(),
        child: const Row(
          children: [
            Icon(CupertinoIcons.ticket_fill, size: 18, color: kGreen),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'STUDENT10',
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.3,
                          color: kInk,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '−10% OFF',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: kGreen,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'UM student privilege applied (−PHP 200.00)',
                    style: TextStyle(fontSize: 11, color: kMuted),
                  ),
                ],
              ),
            ),
            Icon(CupertinoIcons.checkmark_seal_fill, size: 18, color: kGreen),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard();

  static Widget _row(
    String label,
    String amount, {
    bool isDiscount = false,
    bool isTotal = false,
  }) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.5),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 14 : 12.5,
              fontWeight: isTotal ? FontWeight.w800 : FontWeight.w500,
              color: isTotal ? kInk : kMuted,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          amount,
          style: TextStyle(
            fontSize: isTotal ? 15.5 : 12.5,
            fontWeight: isTotal ? FontWeight.w800 : FontWeight.w600,
            color: isDiscount ? kGreen : kInk,
            fontFeatures: kTabular,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: kBox(),
      child: Column(
        children: [
          _row('Merchandise Subtotal', 'PHP 2,000.00'),
          _row('Student Privilege (10%)', '− PHP 200.00', isDiscount: true),
          _row('Campus Courier Fee', 'PHP 50.00'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Divider(height: 1, color: kLine),
          ),
          _row('Total Due', 'PHP 1,850.00', isTotal: true),
        ],
      ),
    );
  }
}

class _PlaceOrderButton extends StatelessWidget {
  const _PlaceOrderButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _log('Place order clicked! Total: PHP 1,850.00'),
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: kCrimson,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Place Order',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(CupertinoIcons.arrow_right, size: 14, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
