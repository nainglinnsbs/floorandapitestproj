class Endpoints {
  // Current api version
  static const _apiVersion = "/api";

  // Authentication
  static const _baseUser = "$_apiVersion/Authentication";
  static const doLogin = "$_baseUser/DoLogin";
  static const doSignOut = "$_baseUser/DoSignOut";

  // Location
  static const _baseLocation = "$_apiVersion/Location";
  static const locations = _baseLocation;
  static const getAllLocation = "$_baseLocation/GetAllLocation";

  // Product
  static const _baseProduct = "$_apiVersion/Product";
  static const products = _baseProduct;
  static const getAllProduct = "$_baseProduct/GetAllProduct";
  static const getStockLimit = "$_baseProduct/GetStockLimit";

  // Unit
  static const _baseItemUnit = "$_apiVersion/Unit";
  static const units = _baseItemUnit;
  static const getAllItemUnit = "$_baseItemUnit/GetAllItemUnit";

  // Customer
  static const _baseCustomer = "$_apiVersion/Customer";
  static const customers = _baseCustomer;
  static const getAllCustomer = "$_baseCustomer/GetAllCustomer";
  static const saveCustomer = "$_baseCustomer/SaveCustomer";

  // Invoice
  static const _baseInvoice = "$_apiVersion/Invoice";
  static const invoices = _baseInvoice;
  static const saveInvoice = "$_baseInvoice/SaveInvoice";
  static const saveInvoiceItem = "$_baseInvoice/SaveInvoiceItem";
  static const saveInvoiceExtra = "$_baseInvoice/SaveInvoiceExtra";
}
