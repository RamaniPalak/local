class ServerConfigs {
  //static String domain = 'gurukulparivar.softcube.co.in';
  static String baseURL =
      'http://loclpms-api-dev.ap-south-1.elasticbeanstalk.com/Mobile/api/v1/';

  //static String imageBaseURL = 'http://$domain/';
  static String userLogin = 'Login/checklogindetails';
  static String userReservation = 'Login/GetMemberResvationList';
  static String houseKeeping = 'Member/HouseKeepingSchedule';
  static String getBankDetail = 'Member/GetMemBankDetailByID';
  static String updateBankDetail = 'Member/BankDetailEdit';
  static String updateUserProfile = 'Member/MemberUpdateProfile';
  static String getDocument = 'Member/GetMemberDocumentByID';
  static String getUserDetail = 'Login/GetMemberDetail';
  static String getUnbilledTransaction = 'Login/GetTransactionUnbilledList';
  static String getTransactionInvoice = 'Login/GetTransactionInvoice';
  static String getNoticeList = 'Login/MobileGetNoticeList';
  static String insertNotice = 'Login/InsertNotice';

  static String userLogout = 'userLogout';
}
