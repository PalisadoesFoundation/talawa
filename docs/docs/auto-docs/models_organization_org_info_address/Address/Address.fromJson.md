
<div>

# Address.fromJson constructor

</div>


Address.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



Factory method to construct an Address from a JSON object.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [org_info_address](../../models_organization_org_info_address/)
3.  [Address](../../models_organization_org_info_address/Address-class.md)
4.  Address.fromJson factory constructor

##### Address class







