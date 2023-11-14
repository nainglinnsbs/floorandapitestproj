// ignore_for_file: library_private_types_in_public_api

class ApiConsts {
  ApiConsts._();

  static const String keyAccept = 'Accept';
  static const String keyContentType = 'Content-type';
  static const String keyAuthorization = 'Authorization';

  static const String tokenTypeBearer = 'Bearer';

  static const String formUrlEncoded = 'application/x-www-form-urlencoded';
  static const String applicationJson = 'application/json';
  static const String textXml = 'text/xml; charset=utf-8';
  static const String acceptAll = '*/*';

  // APIs response keys
  static const String responseInfo = 'ResponseInfo';
  static const String responseData = 'ResponseData';

  static _Endpoints get enpoints => _Endpoints._();
  static _Status get status => _Status._();
  static _ApiError get errors => _ApiError._();
}

class _Endpoints {
  _Endpoints._();

  //auth
  final String login = '/DoLogin';
  final String logout = '/DoSignOut';
  final String forgotPassword = '/ForgotPassword';

  //master_data
  final String getAllProducts = '/GetAll_Items';
  final String getAllItemUnits = '/GetAll_ItemsUnit';
  final String getAllCustomers = '/GetAll_MasterCustomer';
  final String getAllWayCustomers = '/GetAll_Customers';
  final String getAllItemSku = '/GetAll_ItemsSKU';
  final String getAllItemPrice = '/GetAll_ItemsPrice';
  final String getAllLocation = '/GetAll_MasterLocation';
  final String getAllRequestUser = '/GetAll_MasterResquesttoUser';

  //stock_request
  final String saveRequestInvoice = '/Save_MR_Request';
  final String saveRequestItem = '/Save_MR_RequestItem';
  final String getAllRequest = '/GetAllMRRequest';

  final String checkStockBalance = '/check_stock_balance_by_sku';
  final String getPrice = '/GetItemSKUPrice';
  final String getPrice2 = '/GetItemSKUPrice2';
  final String saveInvoice = '/Save_Invoice_Record';
  final String saveInvoiceItem = '/Save_InvoiceItem_Record';
  final String getDoData = '/GetDeliveryOrderOrSaleOrderByOrderNo';
  final String saveExtra = '/Save_Extra';
  final String getAllWellet = '/GetAll_Walllet';
  final String getAllPromotion = '/GetAll_PromotionData';
  final String saveGivePromotion = '/Save_GivePromotionData';
  final String getInvoiceByInvNo = '/GetInvoiceRecordbyInvoiceNo';
  final String getAllCreidtInv = '/GetAllCreditInvoice';
  final String getCreditByCustomer = '/GetCreditInvoiceByCustomer';
  final String checkCreditByCustomer = '/CheckCreditInvoiceByCustomer';

  //stock move
  final String saveStockMove = '/Save_LocationMove';
  final String saveStockMoveItem = '/Save_LocationMoveItem';
  final String saveStockReceive = '/Save_Receipt';
  final String saveStockReceiveItem = '/Save_ReceiptItem';
  final String getStockReceiveItem = '/GetItemData';

  final String saveStockException = '/SaveStockException';
  final String saveStockkExceptionItem = '/SaveStockException_Item';

  final String saveSaleReturn = '/Save_SL_SaleReturn';
  final String savekSaleReturnItem = '/Save_SL_SaleReturnItem';

  final String getAllStockBalance = '/GetStockBalanceList';
  final String getAllLocationStaff = '/GetAll_LocationAccess';

  final String saveCreditReceive = '/UploadCreditReceiveInvoice';

  // App update
  final String checkAppVersion = "/CheckAppVersion";

  // stored issue
  final String getMRDataByMRNo = "/GetMRDataByMRNo";
}

class _Status {
  _Status._();

  final String ok = '0';
  final String error = '107';
}

class _ApiError {
  _ApiError._();

  final String unknown = 'Unknown Error';
  final String noInternet = 'No internet connection';
}
