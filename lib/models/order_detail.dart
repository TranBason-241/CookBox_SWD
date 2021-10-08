class OrderDetail {
  String orderID;
  String orderDetail;
  String dishID;
  int quantity;

  OrderDetail(
      {required this.dishID,
      required this.orderDetail,
      required this.orderID,
      required this.quantity});
}
