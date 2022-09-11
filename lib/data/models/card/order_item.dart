import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  @JsonKey(defaultValue: 0, name: "product_id")
  int productId;

  @JsonKey(defaultValue: 0, name: "order_id")
  int orderId;

  @JsonKey(defaultValue: 0, name: "count")
  int count;

  @JsonKey(defaultValue: 0.0, name: "total_price")
  double totalPrice;

  @JsonKey(defaultValue: "", name: "order_status")
  String orderStatus;

  @JsonKey(defaultValue: "", name: "currency")
  String currency;

  @JsonKey(defaultValue: "", name: "user_id")
  String userId;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  OrderItem({
    required this.currency,
    required this.createdAt,
    required this.count,
    required this.userId,
    required this.totalPrice,
    required this.productId,
    required this.orderId,
    required this.orderStatus,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
