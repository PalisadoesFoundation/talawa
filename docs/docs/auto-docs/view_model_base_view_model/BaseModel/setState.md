




setState method - BaseModel class - base\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/base\_view\_model.dart](../../view_model_base_view_model/view_model_base_view_model-library.html)
3. [BaseModel](../../view_model_base_view_model/BaseModel-class.html)
4. setState method

setState


dark\_mode

light\_mode




# setState method


void
setState(

1. [ViewState](../../enums_enums/ViewState.html) viewState

)

## Implementation

```
void setState(ViewState viewState) {
  _state = viewState;
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [base\_view\_model](../../view_model_base_view_model/view_model_base_view_model-library.html)
3. [BaseModel](../../view_model_base_view_model/BaseModel-class.html)
4. setState method

##### BaseModel class





talawa
1.0.0+1






