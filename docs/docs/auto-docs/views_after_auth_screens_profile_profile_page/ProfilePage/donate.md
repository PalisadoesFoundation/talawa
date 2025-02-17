::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_profile_profile_page/ProfilePage-class-sidebar.html" below-sidebar=""}
<div>

# [donate]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [donate]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}, ]{#donate-param-context .parameter}
2.  [[[ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}]{#donate-param-model .parameter}

)
:::

::: {.section .desc .markdown}
donate widget, this widget is used in donate custom tile.

**params**:

-   `context`: Build context to perform context related operation
-   `model`: Viewmodel

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void donate(BuildContext context, ProfilePageViewModel model) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          model.attachListener(setState);
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: SizedBox(
              height: model.bottomSheetHeight,
              child: Scaffold(
                // background color set to Primary
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                // header
                appBar: AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  toolbarHeight: SizeConfig.screenHeight! * 0.15,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    // display title
                    child: Text(
                      '${AppLocalizations.of(context)!.strictTranslate('Donating to')}\n${model.currentOrg.name}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 24),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8.0,
                        top: SizeConfig.screenHeight! * 0.01,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: model.popBottomSheet,
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  // SingleChildScrollView is a box in which a single widget can be scrolled.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.05,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .strictTranslate('Please select any amount'),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.05,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // looping through and renders button for donation amounts.
                          children: List.generate(
                            3,
                            (index) => model.dominationButton(
                              model.denomination[index],
                              context,
                              setState,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.05,
                      ),
                      Text(
                        AppLocalizations.of(context)!.strictTranslate(
                          'Or',
                        ),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .strictTranslate('Input custom amount'),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.05,
                      ),
                      // containers for custom amount
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth! * 0.05,
                        ),
                        child: TextField(
                          key: const Key('custom_amt'),
                          controller: model.donationAmount,
                          focusNode: model.donationField,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          autofillHints: const <String>[AutofillHints.email],
                          enableSuggestions: true,
                          style: Theme.of(context).textTheme.titleLarge,
                          onChanged: (text) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .translate("Enter donation amount"),
                            labelText: AppLocalizations.of(context)!
                                .translate("Enter custom donation amount"),
                            labelStyle:
                                Theme.of(context).textTheme.titleMedium,
                            prefixIcon: GestureDetector(
                              key: const Key('currency_btn'),
                              onTap: () {
                                model.changeCurrency(context, setState);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      model.donationCurrency,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.secondary,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.05,
                      ),
                      ElevatedButton(
                        key: const Key('DONATE'),
                        onPressed: () async {
                          ///required fields for donation transaction
                          // late final String userId;
                          // late final String orgId;
                          // late final String nameOfOrg;
                          // late final String nameOfUser;
                          // late final String payPalId;
                          // late final double amount;
                          // orgId = model.currentOrg.id!;
                          // userId = model.currentUser.id!;
                          // nameOfUser =
                          //     "${model.currentUser.firstName!} ${model.currentUser.lastName!}";
                          // nameOfOrg = model.currentOrg.name!;

                          // amount = double.parse(model.donationAmount.text);
                          // final request = BraintreeDropInRequest(
                          //   tokenizationKey:
                          //       '<YOUR_BRAINTREE_SANDBOX_API_KEY>',
                          //   collectDeviceData: true,
                          //   paypalRequest: BraintreePayPalRequest(
                          //     amount: model.donationAmount.text,
                          //     displayName: "Talawa",
                          //   ),
                          //   cardEnabled: true,
                          // );

                          // final BraintreeDropInResult? result =
                          //     await BraintreeDropIn.start(request);
                          // if (result != null) {
                          //   ///saving the donation in server
                          //   late final GraphQLClient client =
                          //       graphqlConfig.clientToQuery();

                          //   ///getting transaction id from `brainTree` API
                          //   payPalId = result.paymentMethodNonce.nonce;

                          //   final QueryResult donationResult =
                          //       await client.mutate(
                          //     MutationOptions(
                          //       document: gql(
                          //         queries.createDonation(
                          //           userId,
                          //           orgId,
                          //           nameOfOrg,
                          //           nameOfUser,
                          //           payPalId,
                          //           amount,
                          //         ),
                          //       ),
                          //     ),
                          //   );
                          //   if (donationResult.hasException) {
                          //     model.showSnackBar(
                          //       "Error occurred while making a donation",
                          //     );
                          //   }

                          //   /// hiding the donation UI once it is successful
                          //   model.popBottomSheet();
                          //   model.showSnackBar(
                          //     'Donation Successful,Thanks for the support !',
                          //   );
                          // }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            // if the donation amount entered or selected is empty then renders grey color
                            // else render primary color
                            model.donationAmount.text.isEmpty
                                ? Colors.grey
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.strictTranslate(
                            'DONATE',
                          ),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  ).then((value) => model.updateSheetHeight());
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [profile_page](../../views_after_auth_screens_profile_profile_page/)
3.  [ProfilePage](../../views_after_auth_screens_profile_profile_page/ProfilePage-class.html)
4.  donate method

##### ProfilePage class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
