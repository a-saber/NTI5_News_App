abstract class EndPoints {
  static const String baseURL = 'https://api.transcirox.com/api/';

  // end points
  static const String driverRegister = 'customer/driver-register';
  static const String driverLogin = 'customer/login';
  static const String driverData = 'customer/get-profile';
  static const String driverUpdateProfile = 'driver/update-profile';
  static const String driverChangePassword = 'customer/change-password';
  static const String driverDeleteAccount = 'customer/delete-account';
  static const String driverLogout = 'customer/logout';
  static const String driverForgetPassword = 'customer/forgot-password';
  static const String driverUpdateToken = 'update_token_user';
  static const String sendOTP = 'customer/verify/otp';

  // vehicles
  static const String driverVehicles = 'driver/vehicles';

  // Invoices
  static const String driverInvoices = 'driver/transports-orders/invoices';

  // orders
  static const String driverRegularOrders =
      'driver/bookings/regular'; // Booking approved / get all regular bookings
  static const String driverFastOrders =
      'driver/bookings/fast'; // Booking approved / get all  fast bookings
  static const String driverFurnitureOrders =
      'driver/transports/furnitures'; // Transport Approved / get all furnitures transports
  static const String driverCarOrders =
      'driver/transports/cars'; // Transport Approved / get all car transports
  static const String driverCalculateProfit =
      '/driver/transports/calculate-profit'; // Transport Approved / get Profit
  static const String bookingsorderscalculatepercentage =
      'driver/bookings-orders/calculate-percentage'; // Transport Approved / calculate percentage
  // pending requests
  static const String driverPendingRegularRequests =
      'driver/bookings-orders/regular/pending';
  static const String driverPendingFurnitureRequests =
      'driver/transports-orders/furniture/pending';
  static const String driverPendingCarRequests =
      'driver/transports-orders/car/pending';

  // accepted requests
  static const String driverAcceptedFastOrders = 'driver/fast-orders/accepted';
  static const String driverAcceptedRegularOrders =
      'driver/bookings-orders/regular/accepted';
  static const String driverAcceptedFurnitureRequests =
      'driver/transports-orders/furniture/accepted';
  static const String driverAcceptedCarRequests =
      'driver/transports-orders/car/accepted';

  // completed requests
  static const String driverCompletedFastOrders =
      'driver/fast-orders/completed';
  static const String driverCompletedRegularOrders =
      'driver/bookings-orders/regular/completed';
  static const String driverCompletedFurnitureRequests =
      'driver/transports-orders/furniture/completed';
  static const String driverCompletedCarRequests =
      'driver/transports-orders/car/completed';

  static const String driverBookRegularOrder =
      'driver/bookings-orders'; // Transport Approved / get all car transports
  static const String driverBookFastOrder =
      'driver/fast-orders'; // Transport Approved / get all car transports
  static const String driverBookFurnitureCarOrder =
      'driver/transports'; // Transport Approved / get all car transports

  // Driver Chat
  static const String getAllDriverChat = '/driver/chats/conversations';
  static const String sendDriverChat = '/driver/chats/send';
  static const String chatMarked = '/driver/chats/mark-as-read';
  // driver/transports/143/orders/54/messages/mark-read
  // driver/transports/143/orders/54/messages
  // driver/transports/554/orders/270/messages

  static String getAllchatOrder(
          {required String tranposrtId, required String orderId}) =>
      "driver/transports/$tranposrtId/orders/$orderId/messages";
  static String sendchatOrder(
          {required String tranposrtId, required String orderId}) =>
      "driver/transports/$tranposrtId/orders/$orderId/messages";
  static String markAllchatOrder(
          {required String tranposrtId, required String orderId}) =>
      "driver/transports/$tranposrtId/orders/$orderId/messages/mark-read";

  static const String deletePendingOrder = "/driver";
  static const String deletePendingOrderNormal = "bookings-orders";
  static const String deletePendingOrderFurnatureAndCars = "transports-orders";

  static String receivedFastOrder({required String orderId}) =>
      'driver/fast-orders/$orderId/receive';
  static String receivedBookingsOrder({required String orderId}) =>
      'driver/bookings-orders/$orderId/receive';

  static String receivedTransportsOrder({required String orderId}) =>
      'driver/transports-orders/$orderId/receive';
  static String delivaryFastOrder({required String orderId}) =>
      'driver/fast-orders/$orderId/complete';
  static String delivaryBookingsOrder({required String orderId}) =>
      'driver/bookings-orders/$orderId/complete';

  static String delivaryTransportsOrder({required String orderId}) =>
      'driver/transports-orders/$orderId/complete';
}
