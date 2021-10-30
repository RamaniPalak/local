import 'package:local/app/data/datasource/auth_data.dart';
import 'package:local/app/data/datasource/noticelist_dart.dart';
import 'package:local/app/data/datasource/profile.data.dart';
import 'package:local/app/data/datasource/transaction_data.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/providers/notice_provider.dart';
import 'package:local/app/providers/profile_provider.dart';
import 'package:local/app/providers/transaction_provider.dart';
import 'package:local/app/repository/auth_repository.dart';
import 'package:local/app/repository/notice_repository.dart';
import 'package:local/app/repository/profile_repository.dart';
import 'package:local/app/repository/transaction_repository.dart';

AuthProviderImpl get authProvider => AuthProviderImpl(AuthRepository(dataSource: AuthDataImpl()));
ProfileProviderImpl get profileProvider => ProfileProviderImpl(ProfileRepository(dataSource: ProfileDataImpl()));
TransactionProviderImpl get transactionProvider => TransactionProviderImpl(TransactionRepository(dataSource: TransactionDataImpl()));
NoticeProviderImpl get noticeProvider => NoticeProviderImpl(NoticeRepository(dataSource: NoticeListDataImpl()));