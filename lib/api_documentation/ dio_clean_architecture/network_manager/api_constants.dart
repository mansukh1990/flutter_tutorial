bool isMultiPart = false;

abstract class ApiConstants {
   // static String baseUrl = "https://staging.celcius.in/api/customer/";
   static String baseUrl = "https://testing.celcius.in/api/customer/";

  //api constant
  static const String contentType = "application/json";

  static const String APP_INSTRUCTION = "app-instruction";
  static const String LOGIN = "login";
  static const String LOGOUT = "logout";
  static const String DASHBOARD = "dashboard";
  static const String WAREHOUSE_LIST = "warehouse/get-warehouse-list";
  static const String DASHBOARD_WAREHOUSE = "dashboard/warehouse";
  static const String NEW_INQUIRY = "leads";
  static const String LIVE_TRIPS = "live-trips";
  static const String LOAD_INVOICE_LIST = "load/invoice/list";
  static const String LOAD_INVOICE = "load/invoice";
  static const String LOAD_PICK_UP_DROP_LIST = "load/get-pickup-drop-list";
  static const String LOAD_OVERDUE_INVOICE_LIST = "overdue-invoice";
  static const String LOAD_OVERDUE_INVOICE_DETAIL = "overdue-invoice/detail/";
  static const String POD_LIST = "pod-list";
  static const String NOTIFICATION = "notifications";
  static const String ADDRESS_LISTING = "address";
  static const String ADDRESS_LISTING_GST = "invoice-address-gst";
  static const String COMPLETED_TRIPS = "completed-trips";
  static const String CANCEL_TRIPS = "cancel-trips";
  static const String INQUIRY_DETAIL = "lead/detail/";
  static const String LIVE_DETAIL = "live-trips/detail/";
  static const String COMPLETED_DETAIL = "completed-trips/detail/";
  static const String CANCELED_DETAIL = "cancel-trips/detail/";
  static const String MASTER = "lead/store/master";
  static const String AddBILLINGADDRESS = "invoice-address-gst/store";
  static const String DOWNLOAD_LOG_REPOORT = "live-tracking-pdf";
  static const String CANCEL_TRIP = "live-trips/cancel-trip";
  static const String LR_LIST = "lr-list";
  static const String UPDATE_BILLING_ADDRESS = "invoice-address-gst/update";
  static const String FETCH_GST_DETAILS =
      "invoice-address-gst/checkGSTandGetStateDetail";
  static const String ADD_ADDRESS = "address/store";
  static const String SHARE_LIVE_TRACKING_LINK =
      "live-trips/share-live-tracking-link";
  static const String PAYMENT_BANK_TRANSFER = "payment/bank-transfer";
  static const String TIME_LINE = "timeline";
  static const String DOOR_STATUS_REPORT = "load/door-status-report";
  static const String PROFILE_DETAIL = "detail";
  static const String UPDATE_PROFILE = "profile/update";
  static const String WAREHOUSE_INQUIRY_STATE_AND_CITY = "warehouse/state-city";
  static const String WAREHOUSE_INQUIRY_WAREHOUSE_LIST =
      "inquiry/warehouseList";
  static const String WAREHOUSE_DASHBOARD_META_DATA =
      "warehouse/dashboard/metadata";
  static const String LAST_MILE_MIS_REPORT_LIST = "last-mile-mis-report/list";
  static const String LAST_MILE_LIVE_TRIP_LIST = "last-mile/live-trips/list";
  static const String LAST_MILE_LIVE_TRIPS_LOAD_LIST =
      "last-mile/live-trips/load/list";
  static const String WAREHOUSE_INQUIRY = "warehouse/inquiry/store";
  static final String LAST_MILE_DOWNLOAD_POD = "last-mile/load/pod/download";
  static final String LAST_MILE_LIVE_TRIP_LOAD_CANCEL =
      "last-mile/live-trips/load/cancel";
  static final String LAST_MILE_LOAD_PICK_UP_DROP_LIST =
      "last-mile/load/pickup-drop-list";
  static final String LAST_MILE_LOAD_IMPORT_INTENT_FILE =
      "last-mile-load-import";
  static final String LAST_MILE_SHARE_LIVE_TRACKING_LINK =
      "last-mile/share-live-tracking-link";
  static const String WAREHOUSE_DASHBOARD = "warehouse/dashboard";
  static const String WAREHOUSE_ORDER_LIST = "warehouse/order-list";
  static const String WAREHOUSE_INVENTORY_LIST = "warehouse/inventory/list";
  static const String WAREHOUSE_INVENTORY_REPORT = "warehouse/inventory/report";
  static const String WAREHOUSE_LEDGER_SKU_FETCH = "warehouse/ledger/sku";
  static const String WAREHOUSE_LEDGER_SKU_FETCH_DETAILS =
      "warehouse/ledger/sku/details";
  static const String WAREHOUSE_SKU_FETCH = "warehouse/skus/fetch";
  static const String WAREHOUSE_LEDGER_REPORT = "warehouse/ledger/report";
  static const String WAREHOUSE_INQUIRY_LIST = "warehouse/inquiry/list";
  static final String LAST_MILE_LIVE_TRIPS_PICK_UP_DROP_ADDRESS_UPDATE =
      "last-mile/live-trips/pickup-drop-address-update";
  static final String LAST_MILE_LOAD_DOWNLOAD_SAMPLE_FILE =
      "import-last-mile/load";
  static final String LAST_MILE_LIVE_TRACKING_PDF =
      "last-mile/live-tracking-pdf";
  static final String LAST_MILE_LOAD_PICKUP_DROP_PRODUCT_DELETE =
      "last-mile/load/pickup-drop-product-delete";
  static final String LAST_MILE_LIVE_TRIP_UPDATE_DETAILS =
      "last-mile/live-trips/update-trip-details";
  static final String LAST_MILE_LIVE_TRIP_ADD_DROP_LOCATION =
      "last-mile/live-trips/add-drop-location";
  static final String LAST_MILE_LIVE_TRIPS_PICK_UP_DROP_DELETE =
      "last-mile/live-trips/load/pickup-drop/delete";
  static final String LAST_MILE_LOAD_PICK_UP_DROP_SEQUENCE_UPDATE =
      "last-mile/load/pickup-drop-sequence-update";
  static final String WAREHOUSE_INQUIRY_DETAILS = "warehouse/inquiry/";
  static final String INBOUND_ORDER_VIEW = "warehouse/inbound-order-view";
  static const String INBOUND_ORDER_SKU_LIST =
      "warehouse/inbound-order-sku-list";
  static const String OUTBOUND_ORDER_SKU_LIST =
      "warehouse/outbound-order-sku-list";
  static final String LAST_MILE_ENQUIRY_LIST = "last-mile/inquiry/list";
  static final String LAST_MILE_INQUIRY_LEAD_LIST =
      "last-mile/inquiry/lead/list";
  static final String WAREHOUSE_INBOUND_ORDER_STORE =
      "warehouse/inbound-order-store";
  static final String OUTBOUND_ORDER_BATCH_CODE_LIST =
      "warehouse/outbound-order-batch-code-list";
  static final String OUTBOUND_ORDER_VIEW = "warehouse/outbound-order-view";
  static final String OUTBOUND_ORDER_STORE = "warehouse/outbound-order-store";
  static final String INBOUND_ORDER_UPDATE = "warehouse/inbound-order-update";
  static final String OUTBOUND_ORDER_UPDATE = "warehouse/outbound-order-update";
  static final String WAREHOUSE_CHAMBERS = "warehouse/dashboard/chambers";
  static final String SKU_HEALTH = "warehouse/dashboard/sku";
  static final String OCCUPIED_PALLETS = "warehouse/dashboard/occupied";
  static final String CHAMBER_TEMPERATURE_DOWNLOAD =
      "warehouse/chambers/temperature/{Id}/log/pdf";
  static final String DASHBOARD_UPCOMING = "warehouse/dashboard/upcoming";
  static final String LAST_MILE_MIS_REPORT_DETAILS =
      "last-mile-mis-report/detail/";
  static final String LAST_MILE_PAYMENT = "last-mile/payment/pay";
  static final String LAST_MILE_PAYMENT_HISTORY = "last-mile/payment/history";
  static final String LAST_MILE_MIS_REPORT_APPROVE_REJECT =
      "last-mile-mis-report/approve-reject";
  static final String LAST_MILE_LOAD_EXTRA_CHARGE =
      "last-mile/load/extra-charge";
  static final String LAST_MILE_MIS_REPORT_LOAD_LIST_DOWNLOAD =
      "last-mile-mis-report/load-list/download";
  static final String LEAD_STORE = "lead/store";
  static final String LAST_MILE_INQUIRY_LEAD_CANCEL = "last-mile/inquiry/lead/cancel";

  static const String SEND_OTP = "profile/send-otp-customer";
  static const String CHANGE_PASSWORD = "profile/change-password";
  static final String ALERT_PREFERENCE = "profile/alert-preference";
  static final String CHANGE_2FA = "profile/change-2fa";
  static final String LAST_MILE_MIS_REPORT_LOAD_LIST =
      "last-mile-mis-report/load-list";
  static final String FETCH_ROUTE_MASTER_TRIP_DETAILS =
      "get-route-master-trip-detail";
  static final String LAST_MILE_COMPLETED_TRIP_LIST =
      "last-mile/load/list/complete";
  static final String LAST_MILE_COMPLETED_TRIP_DETAILS =
      "last-mile/load/list/complete/detail";
  static final String LAST_MILE_COMPLETED_RAISE_DISPUTE =
      "last-mile/completed/raise-dispute";
  static final String LAST_MILE_LOAD_GLOBAL_HISTORICAL_REPORT =
      "last-mile/load/global-historical-report";
  static final String LAST_MILE_LOAD_TEMP_LOCATION_FULL_LEAD_CODE_REPORT =
      "last-mile/load/lead-code-temp-location-report";
  static final String LAST_MILE_LOAD_TEMP_LOCATION_SUB_LEAD_CODE_REPORT =
      "last-mile/load/temp-location-report";
  static final String LAST_MILE_LOAD_LEAD_CODE_HISTORICAL_REPORT =
      "last-mile/load/lead-code-historical-report";
  static final String LAST_MILE_LOAD_HISTORICAL_REPORT =
      "last-mile/load/historical-report";
  static final String LAST_MILE_QUICK_STORE_VALIDATION =
      "last-mile/quick/store/validation";

  static final String LAST_MILE_DETAILED_STORE_VALIDATION =
      "last-mile/store/validation";
  static final String LAST_MILE_QUICK_STORE = "last-mile/quick/store";
  static final String LAST_MILE_STORE = "last-mile/store";
  static final String LAST_MILE_LEAD_IMPORT_INTENT_FILE = "last-mile-lead-import";
  static final String LAST_MILE_LEAD_DOWNLOAD_SAMPLE_FILE = "import/last-mile/lead";
  static final String LAST_MILE_LEAD_PICK_UP_DROP_LIST = "last-mile/lead/pickup-drop-list";
  static final String LAST_MILE_INQUIRY_LEAD_PICK_UP_DROP_DELETE = "last-mile/inquiry/lead/pickup-drop/delete";
  static final String LAST_MILE_LEAD_PICKUP_DROP_PRODUCT_DELETE = "last-mile/lead/pickup-drop-product-delete";
  static final String LAST_MILE_INQUIRY_LEAD_DETAILS_UPDATE = "last-mile/inquiry/lead/details/update";
  static final String LAST_MILE_LEAD_PICK_UP_DROP_SEQUENCE_UPDATE = "last-mile/lead/pickup-drop-sequence-update";
  static final String LAST_MILE_INQUIRY_LEAD_ADD_DROP_LOCATION = "last-mile/inquiry/lead/add-drop-location";
  static final String CHANGE_BID_STATUS = "lead/change-bid-status";
  static final String GET_PICKUP_DROP_LIST = "lead/get-pickup-drop-list";
  static final String LAST_MILE_INQUIRY_CHANGE_BID_STATUS = "last-mile/inquiry/change-bid-status";
  static final String ADD_RATING = "rating/store";
  static final String RATING = "rating";
  static final String ASSIGN_PICKUP_DROP_ADDRESS = "load/assing-pickup-drop-address";

  static const String WAREHOUSE_ID = "warehouse_id";
  static const String WAREHOUSE = "warehouse";
  static const String SEARCH_TEXT = "search_text";
  static const String CITY_ID = "city_id";
  static const String LOAD_ID = "load_id";
  static const String DATA = "data";
  static const String LEAD_ID = "lead Id";
  static const String LEAD_ID_ = "lead_id";
  static const String NEW_DATA = "new data";
  static const String REPORT_TYPE = "report_type";
  static const String REASON = "reason";
  static const String CUSTOM_REASON = "custom_reason";
  static const String GST_AND_INVOICE_SHORT_NAME = "gst_and_invoice_short_name";
  static const String OFFICE_ADDRESS_LINE1 = "office_address_line_1";
  static const String OFFICE_ADDRESS_LINE2 = "office_address_line_2";
  static const String CITY = "city";
  static const String GSTN_NUM = "gstn_num";
  static const String USER_GST_ID = "user_gst_id";
  static const String STATE = "state";
  static const String PINCODE = "pincode";
  static const String ID = "id";
  static const String LATITUDE = "latitude";
  static const String LONGITUDE = "longitude";
  static const String ADDRESS_NAME = "address_name";
  static const String Address = "address/";
  static const String UPDATE = "/update";
  static const String MOBILE_NO = "mobile_no";
  static const String EMAIL = "email";
  static const String NAME = "name";
  static const String PAYMENT_DATE = "payment_date";
  static const String AMOUNT = "amount";
  static const String PAYMENT_TYPE = "payment_type";
  static const String CLIENT_BANK_ACCOUNT_NAME = "client_bank_account_name";
  static const String TRANSACTION_ID = "transaction_id";
  static const String TDS_AMOUNT = "tds_amount";
  static const String TDS = "tds";
  static const String REMAINING_AMOUNT = "remaining_amount";
  static const String PHONE_NUMBER = "contact_person_mobile_no";
  static const String COMPANY_NAME = "company_name";
  static const String CONTACT_PERSON = "contact_person";
  static const String FOOD_CERT_NUM = "food_cert_num";
  static const String OTP = "otp";
  static const String DIRECT_CLIENT_OR_AGENT = "direct_client_or_agent";
  static const String PARENT_ID = "parent_id";
  static const String OLD_PASSWORD = "old_password";
  static const String NEW_PASSWORD = "new_password";
  static const String CONFIRM_PASSWORD = "confirm_password";
  static const String NOTIFICATION_TIME_INTERVAL = "notification_time_interval";
  static const String IS_2FA_ENABLED = "is_2fa_enabled";
  static const String IS_WHATSAPP_ALERT = "is_whatsapp_alert";
  static const String IS_EMAIL_ALERT = "is_email_alert";
  static const String IS_SMS_ALERT = "is_sms_alert";
  static const String WAREHOUSE_STATE_NAME = "warehouse_state_name";
  static const String CUSTOMER_ID = "customer_id";
  static const String CUSTOMER_NAME = "customer_name";
  static const String WAREHOUSE_CITY = "warehouse_city";
  static const String WAREHOUSE_CITY_NAME = "warehouse_city_name";
  static const String WAREHOUSE_CODE = "warehouse_code";
  static const String WAREHOUSE_NAME = "warehouse_name";
  static const String WAREHOUSE_TYPE = "warehouse_type";
  static const String FROM_DATE = "from_date";
  static const String TO_DATE = "to_date";
  static const String PALLETS_REQUIRED = "pallets_required";
  static const String ADDITIONAL_COMMENTS = "additional_comments";
  static const String LEAD_CODE = "lead_code";
  static const String LAST_MILE_LOAD_PICKUP_DROP_ID =
      "last_mile_load_pickup_drop_id";
  static const String TYPE = "type";
  static const String LAST_MILE_LOAD_PICK_UP_DROP_ID =
      "last_mile_load_pickup_drop_id";
  static const String LAST_MILE_LOCATION = "location";
  static const String LOAD = "load";
  static const String LEAD = "lead";
  static const String LAST_MILE_LOAD_ID = "last_mile_load_id";
  static const String IS_PICK_UP_DROP = "is_pick_up_drop";
  static final String IS_MAIN_LOCATION = "is_main_location";
  static final String LAST_MILE_LIVE_LEAD_CODE = "lead_code";
  static final String LAST_MILE_LEAD_INTENT_FILE = "temp_trip_file";
  static final String MOBILE_NUMBER = "mobile_no";
  static const String USER_ADDRESS_ID = "user_address_id";
  static const String PICK_UP_DROP_GOODS_INFO_ID = "pickup_drop_goods_info_id";
  static const String LAST_MILE_PICK_UP_OR_DROP = "pickup_or_drop";
  static const String LAST_MILE_USER_ADDRESS_ID = "user_address_id";
  static const String LAST_MILE_CONTACT_PERSON_NAME = "contact_person_name";
  static const String Last_MILE_CONTACT_PERSON_MOBILE_NO =
      "contact_person_mobile_number";
  static const String LAST_MILE_START_DELIVERY_TIME = "start_delivery_time";
  static const String LAST_MILE_END_DELIVERY_TIME = "end_delivery_time";
  static final String PICKUP_DROP = "pickup_or_drop";
  static final String SEQUENCE = "sequence";
  static final String WAREHOUSEID = "warehouseId";
  static final String ENC_ID = "encId";
  static final String EXCLUDE_SKU_IDS = "exclude_sku_ids";
  static final String LAST_MILE_ENQUIRY_ID = "last_mile_inquiry_id";
  static final String MONTH = "month";
  static final String LAST_MILE_MIS_REPORT_ID = "last_mile_mis_report_id";
  static final String FULL_LEAD_CODE = "full_lead_code";
  static final String SYSTEM_TYPE = "system_type";
  static final String LAST_MILE_DISPUTE_REMARK = "dispute_remark";
  static final String LOAD_END_TIME = "load_end_datetime";
  static final String VEHICLE_NO = "vehicle_no";
  static final String PDF_TYPE = "pdf_type";
  static final String LAST_MILE_LEAD_ID = "last_mile_lead_id";
  static final String LAST_MILE_LEAD_PICKUP_DROP_ID = "last_mile_lead_pickup_drop_id";
  static final String SEARCH_ROUTE_MASTER_LIST = "search-route-master-list";
  static final String LAST_MILE_LEAD_PICK_UP_DROP_ID = "last_mile_lead_pickup_drop_id";
  static final String BID_OFFER = "bid_or_offer";
  static final String LEAD_BID_ID = "lead_bid_id";
  static final String RATING_TO_TRANSPORTER = "rating_to_transporter";
  static final String VEHICLE_TEMPERATURE_RATING = "vehicle_temperature_rating";

  static const String SORT_KEY = "sort_key";
  static const String SORT_ORDER = "sort_order";
  static const String SUCCESS_CODE = "200";
  static const String ERROR_CODE = "400";
  static const String TOKEN_EXPIRED_CODE = "401";
  static const String APP_UPDATE_CODE = "801";
  static const String ANY_CODE = "-1";
  static const String STATUS = "status";
  static const String ORDER_TYPE = "order_type";
  static const String CREATED_BY = "created_by";
  static const String SEARCH = "search";
  static const String CHAMBER_ID = "chamber_id";
  static const String RACK_ID = "rack_id";
  static const String LOCATION_ID = "location_id";
  static const String ADDED_QTY = "added_quantity";
  static const String SKU_ID = "sku_id";
  static const String DATE_RANGE = "date_range";
  static const String CRITERIA = "criteria";
  static const String EXPECTED_DELIVERY_DATE = "expected_delivery_date";
  static const String EXTERNAL_ORDER_NO = "external_order_no";
  static const String QUANTITY = "quantity";
  static const String REMARKS = "remarks";
  static const String BATCH_CODE = "batch_code";
  static const String IS_STO_ORDER = "is_sto_order";
  static final String YEAR = "year";
  static final String TRIP_CITY = "trip_city";
  static final String REJECT_REASON = "reject_reason";
  static final String START_DATE = "start_date";
  static final String END_DATE = "end_date";
  static final String CONTRACT_TYPE = "contract_type";
  static final String PAYMENT_TERM = "payment_term";
  static final String PAY_BY_TYPE = "pay_by_type";
  static final String PER_KM_PRICE = "per_km_price";
  static final String APPROX_KM = "approx_km";
  static final String ADVANCE_AMOUNT = "advance_amount";
  static final String USER_INVOICE_GST_ID = "user_invoice_gst_id";
  static final String IS_ROUND_TRIP = "is_round_trip";
  static final String LAST_MILE_LEAD_BID_ID = "last_mile_lead_bid_id";
  static final String BID_STATUS = "status";

}
//JoinCommunity()
// https://localhost:44386/community.asmx/JoinCommunity?CommunityId=4&UserId=SRZAK7zkkJNZO8nmV2rHqrBoghg2
//
// LeaveCommunity()
// https://localhost:44386/community.asmx/LeaveCommunity?CommunityId=4&UserId=SRZAK7zkkJNZO8nmV2rHqrBoghg2
