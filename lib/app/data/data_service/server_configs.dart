class ServerConfigs {

  static String baseURL = "http://loclpms-api-dev.ap-south-1.elasticbeanstalk.com/Mobile/api/v1/";
      //'http://loclpms-api-dev.ap-south-1.elasticbeanstalk.com/Mobile/api/v1/';
  //http://192.168.1.113/Mobile/api/v1/

  //static String imageBaseURL = 'http://$domain/';
  static String userLogin = 'Login/checklogindetails';
  static String userReservation = 'Login/GetMemberResvationList';
  static String houseKeeping = 'Member/HouseKeepingSchedule';
  static String getBankDetail = 'Member/GetMemBankDetailByID';
  static String updateBankDetail = 'Member/BankDetailEdit';
  static String updateUserProfile = 'Login/MemberUpdateProfile';
  static String getUserDetail = 'Login/GetMemberDetail';
  static String getUnbilledTransaction = 'Login/GetTransactionUnbilledList';
  static String getTransactionInvoice = 'Login/GetTransactionInvoice';
  static String getNoticeList = 'Login/MobileGetNoticeList';
  static String insertNotice = 'Login/MobileInsertNotice';
  static String getDocument = 'Login/GetMemberDocumentByID';
  static String getInvoiceId = 'Member/GetInvoiceByID';
  static String documentUpdate = 'Login/MemberUpsertDocument';
  static String docDelete = 'Login/MemberDocumentDelete';
  static String getHistoryList = 'Login/MemberHistoryList';
  static String insertComplain = 'Login/MobileComplaintsListAdd';
  static String getComplain = 'Login/GetMobilecomplaintsList';
  static String eventList = 'Login/GetEventList';
  static String getHousekeeping = 'Member/HouseKeepingSchedule';
  static String cancelHKP = 'Member/hkpCancel';
  static String generateRazorpayOrderid = 'RazorPayTrans/GenerateRazorpayOrderID';
  static String razorpayTransGetbyID = 'RazorPayTrans/RazorpayTransGetbyID';
  static String getMsgToFrontDeskById = 'MsgToFrontDeskMobile/GetMsgToFrontDeskById';
  static String msgInsert ='MsgToFrontDeskMobile/MsgToFrontDesk_Insert';
  static String hkpStates ='Member/hkpStates';
  static String userLogout = 'userLogout';

}
