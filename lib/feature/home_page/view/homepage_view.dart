import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_state_management_first_project/core/base/base_view.dart';
import '../viewmodel/makeupmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MakeUpViewModel>(
      viewModel: MakeUpViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MakeUpViewModel viewModel) {
        return Scaffold(
          body: Observer(builder: (_) {
            return viewModel.isLoading
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 10,
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 10),
                    itemCount: viewModel.productList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.network(
                                    viewModel.productList?[index].imageLink ??
                                        '')),
                            Text(viewModel.productList?[index].name ?? '')
                          ],
                        ),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        );
      },
    );
  }
}
