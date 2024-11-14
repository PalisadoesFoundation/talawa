


# donate method








void donate
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.md) model)








## Implementation

```dart
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
                      'Donating to \n${model.currentOrg.name}',
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
                    )
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
                        'Please Select and amount',
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
                        'Or',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Input custom amount',
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
                                    )
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
                        onPressed: () async {
                          ///required fields for donation transaction
                          late final String userId;
                          late final String orgId;
                          late final String nameOfOrg;
                          late final String nameOfUser;
                          late final String payPalId;
                          late final double amount;
                          orgId = model.currentOrg.id!;
                          userId = model.currentUser.id!;
                          nameOfUser =
                              "${model.currentUser.firstName!} ${model.currentUser.lastName!}";
                          nameOfOrg = model.currentOrg.name!;

                          amount = double.parse(model.donationAmount.text);
                          final request = BraintreeDropInRequest(
                            tokenizationKey:
                                '<YOUR_BRAINTREE_SANDBOX_API_KEY>',
                            collectDeviceData: true,
                            paypalRequest: BraintreePayPalRequest(
                              amount: model.donationAmount.text,
                              displayName: "Talawa",
                            ),
                            cardEnabled: true,
                          );

                          final BraintreeDropInResult? result =
                              await BraintreeDropIn.start(request);
                          if (result != null) {
                            ///saving the donation in server
                            late final GraphQLClient client =
                                graphqlConfig.clientToQuery();

                            ///getting transaction id from `brainTree` API
                            payPalId = result.paymentMethodNonce.nonce;

                            final QueryResult donationResult =
                                await client.mutate(
                              MutationOptions(
                                document: gql(
                                  queries.createDonation(
                                    userId,
                                    orgId,
                                    nameOfOrg,
                                    nameOfUser,
                                    payPalId,
                                    amount,
                                  ),
                                ),
                              ),
                            );
                            if (donationResult.hasException) {
                              model.showSnackBar(
                                "Error occurred while making a donation",
                              );
                            }

                            /// hiding the donation UI once it is successful
                            model.popBottomSheet();
                            model.showSnackBar(
                              'Donation Successful,Thanks for the support !',
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            // if the donation amount entered or selected is empty then renders grey color
                            // else render primary color
                            model.donationAmount.text.isEmpty
                                ? Colors.grey
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: Text(
                          'DONATE',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
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







