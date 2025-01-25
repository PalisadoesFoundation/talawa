




Address.fromJson constructor - Address - org\_info\_address library - Dart API







menu

1. [talawa](../../index.html)
2. [models/organization/org\_info\_address.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info_address/)
3. [Address](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info_address/Address-class.html)
4. Address.fromJson factory constructor

Address.fromJson


dark\_mode

light\_mode




# Address.fromJson constructor


Address.fromJson(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json

)

Factory method to construct an Address from a JSON object.


## Implementation

```
factory Address.fromJson(Map<String, dynamic> json) {
  return Address(
    city: json['city'] as String?,
    countryCode: json['countryCode'] as String?,
    dependentLocality: json['dependentLocality'] as String?,
    line1: json['line1'] as String?,
    line2: json['line2'] as String?,
    postalCode: json['postalCode'] as String?,
    sortingCode: json['sortingCode'] as String?,
    state: json['state'] as String?,
  );
}
```

 


1. [talawa](../../index.html)
2. [org\_info\_address](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info_address/)
3. [Address](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info_address/Address-class.html)
4. Address.fromJson factory constructor

##### Address class





talawa
1.0.0+1






