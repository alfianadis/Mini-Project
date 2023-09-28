import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';

class CardPaymentMethod extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool isSelected;
  final Function()? onTap;

  const CardPaymentMethod({
    Key? key,
    required this.paymentMethod,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          isSelected
              ? Image.asset(
                  AssetPath.icCheckbox,
                  width: 24,
                  height: 24,
                )
              : const Icon(
                  Icons.circle_outlined,
                  size: 24,
                ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: isSelected ? ColorPath.white : null,
                border: isSelected ? null : Border.all(width: 1),
              ),
              child: Row(
                children: [
                  Image.asset(
                    paymentMethod.image,
                    height: 24,
                    width: 24,
                    color: isSelected ? ColorPath.black : ColorPath.grey,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          paymentMethod.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                isSelected ? ColorPath.black : ColorPath.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          paymentMethod.description,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
