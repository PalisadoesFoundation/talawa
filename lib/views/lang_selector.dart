import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/lang_controller.dart';
import 'package:talawa/utils/ui_scaling.dart';

class LanguageSelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Language> langList = [
      Language(
        countryCode: 'US',
        langCode: 'en',
        langName: 'English',
        langSample: 'Welcome User',
      ),
      Language(
        countryCode: 'IN',
        langCode: 'hi',
        langName: 'Hindi',
        langSample: 'स्वागत उपयोगकर्ता',
      ),
      Language(
        countryCode: 'CN',
        langCode: 'zh',
        langName: 'Chinese',
        langSample: '欢迎用户',
      ),
      Language(
        countryCode: 'FR',
        langCode: 'fr',
        langName: 'French',
        langSample: 'Bienvenue utilisateur',
      ),
      Language(
        countryCode: 'ES',
        langCode: 'es',
        langName: 'Spanish',
        langSample: 'Bienvenida usuario',
      ),
    ];

    SizeConfig().init(context);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: SizeConfig.safeBlockVertical * 9.2,
                  backgroundColor: Colors.white,
                  floating: true,
                  snap: false,
                  stretch: true,
                  forceElevated: false,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.white,
                      alignment: Alignment.bottomCenter,
                      height: SizeConfig.safeBlockVertical * 9.2,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Platform.isIOS
                                  ? Icons.arrow_back_ios
                                  : Icons.arrow_back,
                              //color: UiColor.darkShades,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                'Select Language',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 22,
                                  //color: UiColor.darkShades,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Text(
                                'Please select language of your choice',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  //color: UiColor.darkShades,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 2.5,
                right: SizeConfig.safeBlockHorizontal * 2.5,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: langList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = langList[index];
                  return _langButton(data, context);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _langButton(Language lang, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffE9EDE5),
        borderRadius: BorderRadius.circular(35),
      ),
      margin: const EdgeInsets.only(
        bottom: 25,
        left: 5,
        right: 5,
      ),
      child: ListTile(
        onTap: () async {
          await Provider.of<AppLanguage>(
            context,
            listen: false,
          ).changeLanguage(Locale(lang.langCode));

          Navigator.of(context).pop();
        },
        leading: CircleAvatar(
          child: Text(lang.countryCode),
        ),
        title: Text(
          lang.langName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            //color: UiColor.darkShades,
            fontFamily: 'OpenSans',
          ),
        ),
        subtitle: Text(
          lang.langSample,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            //color: UiColor.darkShades,
            fontFamily: 'OpenSans',
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
        ),
      ),
    );
  }
}

class Language {
  Language({
    @required this.countryCode,
    @required this.langCode,
    @required this.langName,
    @required this.langSample,
  });

  final String countryCode;
  final String langCode;
  final String langName;
  final String langSample;
}
