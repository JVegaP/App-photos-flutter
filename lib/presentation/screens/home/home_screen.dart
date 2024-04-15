import 'package:flutter/material.dart';
import 'package:omni_app_flutter/core/constants/app_constants.dart';
import 'package:omni_app_flutter/core/constants/color_constants.dart';
import 'package:omni_app_flutter/core/constants/string_constants.dart';
import 'package:omni_app_flutter/core/constants/style_constants.dart';
import 'package:omni_app_flutter/core/constants/widget_constants.dart';
import 'package:omni_app_flutter/core/di/dependency_injection_config.dart';
import 'package:omni_app_flutter/core/themes/app_theme.dart';
import 'package:omni_app_flutter/core/utils/utils.dart';
import 'package:omni_app_flutter/presentation/providers/home/home_provider.dart';
import 'package:omni_app_flutter/presentation/screens/home/widgets/widget_item_photo.dart';
import 'package:omni_app_flutter/presentation/widgets/widget_background.dart';
import 'package:omni_app_flutter/presentation/widgets/widget_text_label.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key
  }): super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeProvider state = getIt<HomeProvider>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    state = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _setUpView();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: kWhite,
        body: _mainContainer()
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  ///----------------------------- PRIVATE METHODS --------------------------///

  /// Method create structure base of view
  Widget _mainContainer() {
    return SafeArea(
      child: Stack(
        children: [
          const WidgetBackground(key: Key(kWidgetBackground)),
          _createHeader(),
          _createList(),
          _createFooter()
        ],
      ),
    );
  }

  /// Method create structure of view header
  Widget _createHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: kDimens15, horizontal: kDimens20),
      decoration: const BoxDecoration(
          color: kPrimary
      ),
      child:  WidgetTextLabel(
        key: const Key(kWidgetTextLabelTitleHome),
        text: kTitleHeaderPhotos,
        textAlign: TextAlign.center,
        textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
            color: kWhite,
            fontSize: kDimens20,
            fontWeight: FontWeight.w900
        ),
      ),
    );
  }

  /// Method create structure of view footer of loading
  Widget _createFooter() {
    return Visibility(
      visible: state.isLoading && state.photos.isNotEmpty,
      child: Positioned(
        bottom: kDimens0,
        left: kDimens0,
        right: kDimens0,
        child: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: kDimens15),
          decoration: const BoxDecoration(
              color: kWhite
          ),
          child: const CircularProgressIndicator(
            color: kPrimary,
            strokeWidth: kDimens5,
          ),
        ),
      ),
    );
  }

  /// Method create structure of view list of photos
  Widget _createList() {
    return state.isLoading && state.photos.isEmpty ? const Center(
      child: SizedBox(
        height: kDimens50,
        width: kDimens50,
        child: CircularProgressIndicator(
          color: kPrimary,
          strokeWidth: kDimens5,
        ),
      ),
    ) : state.errorMessage.isEmpty ? Padding(
      padding: const EdgeInsets.only(top: kDimens60),
      child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(kDimens20),
          itemCount: state.photos.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return WidgetItemPhoto(
                key: const Key(kWidgetItemPhotoHome),
                item: state.photos.elementAt(index),
                onTap: (value) {}
            );
          }
      ),
    ) :
    Center(
      child:  WidgetTextLabel(
        key: const Key(kWidgetTextLabelErrorHome),
        text: state.errorMessage,
        textAlign: TextAlign.center,
        textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
            color: kSecondary,
            fontSize: kDimens15,
            fontWeight: FontWeight.w900
        ),
      ),
    )
    ;
  }

  /// Method that setup the initial information of the view
  _setUpView() {
    _getPhotos();
    _setObserver();
  }

  /// Method that obtain list of photos
  _getPhotos() {
    state.isLoading = true;
    functionDelay(
        timeDuration: kDurationMs1500,
        function: () async {
          await state.getPhotos().then((value) => {
            state.photos = value
          }).whenComplete(() => state.isLoading = false);
        }
    );
  }

  /// Method that observe change in view
  _setObserver() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (!state.isLoading) {
          _getPhotos();
        }
      }
    });
  }
}