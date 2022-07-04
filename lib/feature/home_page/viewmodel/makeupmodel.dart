import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management_first_project/core/base/baseview_model.dart';
import 'package:flutter_state_management_first_project/feature/home_page/model/makeup_model.dart';
import 'package:flutter_state_management_first_project/feature/home_page/service/makeup_service.dart';
import 'package:mobx/mobx.dart';
part 'makeupmodel.g.dart';

class MakeUpViewModel = _MakeUpViewModelBase with _$MakeUpViewModel;

abstract class _MakeUpViewModelBase with Store, BaseViewModel {
  late INetworkService networkService;

  @override
  void setContext(BuildContext context) => this.myContext = context;

  @override
  void init() {
    networkService = MakeUpService(networkManager);
    getAllProduct();
  }

  @observable
  bool isLoading = true;

  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  List<MakeUpModel>? productList;

  @action
  Future<void> getAllProduct() async {
    changeLoading();
    productList = await networkService.fetchProduct();
    changeLoading();
  }
}
