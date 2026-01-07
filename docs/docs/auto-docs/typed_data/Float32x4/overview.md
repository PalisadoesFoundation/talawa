# Overview for `Float32x4`

## Description

Four 32-bit floating point values.

 Float32x4 stores four 32-bit floating point values in "lanes".
 The lanes are named [x], [y], [z], and [w] respectively.

 Single operations can be performed on the multiple values of one or
 more `Float32x4`s, which will perform the corresponding operation
 for each lane of the operands, and provide a new `Float32x4` (or similar
 multi-value) result with the results from each lane.

 The `Float32x4` class cannot be extended or implemented.

## Members

- **xxxx**: `int`
  Shuffle mask "xxxx".

 Used by [shuffle] and [shuffleMix].

- **xxxy**: `int`
  Shuffle mask "xxxy".

 Used by [shuffle] and [shuffleMix].

- **xxxz**: `int`
  Shuffle mask "xxxz".

 Used by [shuffle] and [shuffleMix].

- **xxxw**: `int`
  Shuffle mask "xxxw".

 Used by [shuffle] and [shuffleMix].

- **xxyx**: `int`
  Shuffle mask "xxyx".

 Used by [shuffle] and [shuffleMix].

- **xxyy**: `int`
  Shuffle mask "xxyy".

 Used by [shuffle] and [shuffleMix].

- **xxyz**: `int`
  Shuffle mask "xxyz".

 Used by [shuffle] and [shuffleMix].

- **xxyw**: `int`
  Shuffle mask "xxyw".

 Used by [shuffle] and [shuffleMix].

- **xxzx**: `int`
  Shuffle mask "xxzx".

 Used by [shuffle] and [shuffleMix].

- **xxzy**: `int`
  Shuffle mask "xxzy".

 Used by [shuffle] and [shuffleMix].

- **xxzz**: `int`
  Shuffle mask "xxzz".

 Used by [shuffle] and [shuffleMix].

- **xxzw**: `int`
  Shuffle mask "xxzw".

 Used by [shuffle] and [shuffleMix].

- **xxwx**: `int`
  Shuffle mask "xxwx".

 Used by [shuffle] and [shuffleMix].

- **xxwy**: `int`
  Shuffle mask "xxwy".

 Used by [shuffle] and [shuffleMix].

- **xxwz**: `int`
  Shuffle mask "xxwz".

 Used by [shuffle] and [shuffleMix].

- **xxww**: `int`
  Shuffle mask "xxww".

 Used by [shuffle] and [shuffleMix].

- **xyxx**: `int`
  Shuffle mask "xyxx".

 Used by [shuffle] and [shuffleMix].

- **xyxy**: `int`
  Shuffle mask "xyxy".

 Used by [shuffle] and [shuffleMix].

- **xyxz**: `int`
  Shuffle mask "xyxz".

 Used by [shuffle] and [shuffleMix].

- **xyxw**: `int`
  Shuffle mask "xyxw".

 Used by [shuffle] and [shuffleMix].

- **xyyx**: `int`
  Shuffle mask "xyyx".

 Used by [shuffle] and [shuffleMix].

- **xyyy**: `int`
  Shuffle mask "xyyy".

 Used by [shuffle] and [shuffleMix].

- **xyyz**: `int`
  Shuffle mask "xyyz".

 Used by [shuffle] and [shuffleMix].

- **xyyw**: `int`
  Shuffle mask "xyyw".

 Used by [shuffle] and [shuffleMix].

- **xyzx**: `int`
  Shuffle mask "xyzx".

 Used by [shuffle] and [shuffleMix].

- **xyzy**: `int`
  Shuffle mask "xyzy".

 Used by [shuffle] and [shuffleMix].

- **xyzz**: `int`
  Shuffle mask "xyzz".

 Used by [shuffle] and [shuffleMix].

- **xyzw**: `int`
  Shuffle mask "xyzw".

 Used by [shuffle] and [shuffleMix].

- **xywx**: `int`
  Shuffle mask "xywx".

 Used by [shuffle] and [shuffleMix].

- **xywy**: `int`
  Shuffle mask "xywy".

 Used by [shuffle] and [shuffleMix].

- **xywz**: `int`
  Shuffle mask "xywz".

 Used by [shuffle] and [shuffleMix].

- **xyww**: `int`
  Shuffle mask "xyww".

 Used by [shuffle] and [shuffleMix].

- **xzxx**: `int`
  Shuffle mask "xzxx".

 Used by [shuffle] and [shuffleMix].

- **xzxy**: `int`
  Shuffle mask "xzxy".

 Used by [shuffle] and [shuffleMix].

- **xzxz**: `int`
  Shuffle mask "xzxz".

 Used by [shuffle] and [shuffleMix].

- **xzxw**: `int`
  Shuffle mask "xzxw".

 Used by [shuffle] and [shuffleMix].

- **xzyx**: `int`
  Shuffle mask "xzyx".

 Used by [shuffle] and [shuffleMix].

- **xzyy**: `int`
  Shuffle mask "xzyy".

 Used by [shuffle] and [shuffleMix].

- **xzyz**: `int`
  Shuffle mask "xzyz".

 Used by [shuffle] and [shuffleMix].

- **xzyw**: `int`
  Shuffle mask "xzyw".

 Used by [shuffle] and [shuffleMix].

- **xzzx**: `int`
  Shuffle mask "xzzx".

 Used by [shuffle] and [shuffleMix].

- **xzzy**: `int`
  Shuffle mask "xzzy".

 Used by [shuffle] and [shuffleMix].

- **xzzz**: `int`
  Shuffle mask "xzzz".

 Used by [shuffle] and [shuffleMix].

- **xzzw**: `int`
  Shuffle mask "xzzw".

 Used by [shuffle] and [shuffleMix].

- **xzwx**: `int`
  Shuffle mask "xzwx".

 Used by [shuffle] and [shuffleMix].

- **xzwy**: `int`
  Shuffle mask "xzwy".

 Used by [shuffle] and [shuffleMix].

- **xzwz**: `int`
  Shuffle mask "xzwz".

 Used by [shuffle] and [shuffleMix].

- **xzww**: `int`
  Shuffle mask "xzww".

 Used by [shuffle] and [shuffleMix].

- **xwxx**: `int`
  Shuffle mask "xwxx".

 Used by [shuffle] and [shuffleMix].

- **xwxy**: `int`
  Shuffle mask "xwxy".

 Used by [shuffle] and [shuffleMix].

- **xwxz**: `int`
  Shuffle mask "xwxz".

 Used by [shuffle] and [shuffleMix].

- **xwxw**: `int`
  Shuffle mask "xwxw".

 Used by [shuffle] and [shuffleMix].

- **xwyx**: `int`
  Shuffle mask "xwyx".

 Used by [shuffle] and [shuffleMix].

- **xwyy**: `int`
  Shuffle mask "xwyy".

 Used by [shuffle] and [shuffleMix].

- **xwyz**: `int`
  Shuffle mask "xwyz".

 Used by [shuffle] and [shuffleMix].

- **xwyw**: `int`
  Shuffle mask "xwyw".

 Used by [shuffle] and [shuffleMix].

- **xwzx**: `int`
  Shuffle mask "xwzx".

 Used by [shuffle] and [shuffleMix].

- **xwzy**: `int`
  Shuffle mask "xwzy".

 Used by [shuffle] and [shuffleMix].

- **xwzz**: `int`
  Shuffle mask "xwzz".

 Used by [shuffle] and [shuffleMix].

- **xwzw**: `int`
  Shuffle mask "xwzw".

 Used by [shuffle] and [shuffleMix].

- **xwwx**: `int`
  Shuffle mask "xwwx".

 Used by [shuffle] and [shuffleMix].

- **xwwy**: `int`
  Shuffle mask "xwwy".

 Used by [shuffle] and [shuffleMix].

- **xwwz**: `int`
  Shuffle mask "xwwz".

 Used by [shuffle] and [shuffleMix].

- **xwww**: `int`
  Shuffle mask "xwww".

 Used by [shuffle] and [shuffleMix].

- **yxxx**: `int`
  Shuffle mask "yxxx".

 Used by [shuffle] and [shuffleMix].

- **yxxy**: `int`
  Shuffle mask "yxxy".

 Used by [shuffle] and [shuffleMix].

- **yxxz**: `int`
  Shuffle mask "yxxz".

 Used by [shuffle] and [shuffleMix].

- **yxxw**: `int`
  Shuffle mask "yxxw".

 Used by [shuffle] and [shuffleMix].

- **yxyx**: `int`
  Shuffle mask "yxyx".

 Used by [shuffle] and [shuffleMix].

- **yxyy**: `int`
  Shuffle mask "yxyy".

 Used by [shuffle] and [shuffleMix].

- **yxyz**: `int`
  Shuffle mask "yxyz".

 Used by [shuffle] and [shuffleMix].

- **yxyw**: `int`
  Shuffle mask "yxyw".

 Used by [shuffle] and [shuffleMix].

- **yxzx**: `int`
  Shuffle mask "yxzx".

 Used by [shuffle] and [shuffleMix].

- **yxzy**: `int`
  Shuffle mask "yxzy".

 Used by [shuffle] and [shuffleMix].

- **yxzz**: `int`
  Shuffle mask "yxzz".

 Used by [shuffle] and [shuffleMix].

- **yxzw**: `int`
  Shuffle mask "yxzw".

 Used by [shuffle] and [shuffleMix].

- **yxwx**: `int`
  Shuffle mask "yxwx".

 Used by [shuffle] and [shuffleMix].

- **yxwy**: `int`
  Shuffle mask "yxwy".

 Used by [shuffle] and [shuffleMix].

- **yxwz**: `int`
  Shuffle mask "yxwz".

 Used by [shuffle] and [shuffleMix].

- **yxww**: `int`
  Shuffle mask "yxww".

 Used by [shuffle] and [shuffleMix].

- **yyxx**: `int`
  Shuffle mask "yyxx".

 Used by [shuffle] and [shuffleMix].

- **yyxy**: `int`
  Shuffle mask "yyxy".

 Used by [shuffle] and [shuffleMix].

- **yyxz**: `int`
  Shuffle mask "yyxz".

 Used by [shuffle] and [shuffleMix].

- **yyxw**: `int`
  Shuffle mask "yyxw".

 Used by [shuffle] and [shuffleMix].

- **yyyx**: `int`
  Shuffle mask "yyyx".

 Used by [shuffle] and [shuffleMix].

- **yyyy**: `int`
  Shuffle mask "yyyy".

 Used by [shuffle] and [shuffleMix].

- **yyyz**: `int`
  Shuffle mask "yyyz".

 Used by [shuffle] and [shuffleMix].

- **yyyw**: `int`
  Shuffle mask "yyyw".

 Used by [shuffle] and [shuffleMix].

- **yyzx**: `int`
  Shuffle mask "yyzx".

 Used by [shuffle] and [shuffleMix].

- **yyzy**: `int`
  Shuffle mask "yyzy".

 Used by [shuffle] and [shuffleMix].

- **yyzz**: `int`
  Shuffle mask "yyzz".

 Used by [shuffle] and [shuffleMix].

- **yyzw**: `int`
  Shuffle mask "yyzw".

 Used by [shuffle] and [shuffleMix].

- **yywx**: `int`
  Shuffle mask "yywx".

 Used by [shuffle] and [shuffleMix].

- **yywy**: `int`
  Shuffle mask "yywy".

 Used by [shuffle] and [shuffleMix].

- **yywz**: `int`
  Shuffle mask "yywz".

 Used by [shuffle] and [shuffleMix].

- **yyww**: `int`
  Shuffle mask "yyww".

 Used by [shuffle] and [shuffleMix].

- **yzxx**: `int`
  Shuffle mask "yzxx".

 Used by [shuffle] and [shuffleMix].

- **yzxy**: `int`
  Shuffle mask "yzxy".

 Used by [shuffle] and [shuffleMix].

- **yzxz**: `int`
  Shuffle mask "yzxz".

 Used by [shuffle] and [shuffleMix].

- **yzxw**: `int`
  Shuffle mask "yzxw".

 Used by [shuffle] and [shuffleMix].

- **yzyx**: `int`
  Shuffle mask "yzyx".

 Used by [shuffle] and [shuffleMix].

- **yzyy**: `int`
  Shuffle mask "yzyy".

 Used by [shuffle] and [shuffleMix].

- **yzyz**: `int`
  Shuffle mask "yzyz".

 Used by [shuffle] and [shuffleMix].

- **yzyw**: `int`
  Shuffle mask "yzyw".

 Used by [shuffle] and [shuffleMix].

- **yzzx**: `int`
  Shuffle mask "yzzx".

 Used by [shuffle] and [shuffleMix].

- **yzzy**: `int`
  Shuffle mask "yzzy".

 Used by [shuffle] and [shuffleMix].

- **yzzz**: `int`
  Shuffle mask "yzzz".

 Used by [shuffle] and [shuffleMix].

- **yzzw**: `int`
  Shuffle mask "yzzw".

 Used by [shuffle] and [shuffleMix].

- **yzwx**: `int`
  Shuffle mask "yzwx".

 Used by [shuffle] and [shuffleMix].

- **yzwy**: `int`
  Shuffle mask "yzwy".

 Used by [shuffle] and [shuffleMix].

- **yzwz**: `int`
  Shuffle mask "yzwz".

 Used by [shuffle] and [shuffleMix].

- **yzww**: `int`
  Shuffle mask "yzww".

 Used by [shuffle] and [shuffleMix].

- **ywxx**: `int`
  Shuffle mask "ywxx".

 Used by [shuffle] and [shuffleMix].

- **ywxy**: `int`
  Shuffle mask "ywxy".

 Used by [shuffle] and [shuffleMix].

- **ywxz**: `int`
  Shuffle mask "ywxz".

 Used by [shuffle] and [shuffleMix].

- **ywxw**: `int`
  Shuffle mask "ywxw".

 Used by [shuffle] and [shuffleMix].

- **ywyx**: `int`
  Shuffle mask "ywyx".

 Used by [shuffle] and [shuffleMix].

- **ywyy**: `int`
  Shuffle mask "ywyy".

 Used by [shuffle] and [shuffleMix].

- **ywyz**: `int`
  Shuffle mask "ywyz".

 Used by [shuffle] and [shuffleMix].

- **ywyw**: `int`
  Shuffle mask "ywyw".

 Used by [shuffle] and [shuffleMix].

- **ywzx**: `int`
  Shuffle mask "ywzx".

 Used by [shuffle] and [shuffleMix].

- **ywzy**: `int`
  Shuffle mask "ywzy".

 Used by [shuffle] and [shuffleMix].

- **ywzz**: `int`
  Shuffle mask "ywzz".

 Used by [shuffle] and [shuffleMix].

- **ywzw**: `int`
  Shuffle mask "ywzw".

 Used by [shuffle] and [shuffleMix].

- **ywwx**: `int`
  Shuffle mask "ywwx".

 Used by [shuffle] and [shuffleMix].

- **ywwy**: `int`
  Shuffle mask "ywwy".

 Used by [shuffle] and [shuffleMix].

- **ywwz**: `int`
  Shuffle mask "ywwz".

 Used by [shuffle] and [shuffleMix].

- **ywww**: `int`
  Shuffle mask "ywww".

 Used by [shuffle] and [shuffleMix].

- **zxxx**: `int`
  Shuffle mask "zxxx".

 Used by [shuffle] and [shuffleMix].

- **zxxy**: `int`
  Shuffle mask "zxxy".

 Used by [shuffle] and [shuffleMix].

- **zxxz**: `int`
  Shuffle mask "zxxz".

 Used by [shuffle] and [shuffleMix].

- **zxxw**: `int`
  Shuffle mask "zxxw".

 Used by [shuffle] and [shuffleMix].

- **zxyx**: `int`
  Shuffle mask "zxyx".

 Used by [shuffle] and [shuffleMix].

- **zxyy**: `int`
  Shuffle mask "zxyy".

 Used by [shuffle] and [shuffleMix].

- **zxyz**: `int`
  Shuffle mask "zxyz".

 Used by [shuffle] and [shuffleMix].

- **zxyw**: `int`
  Shuffle mask "zxyw".

 Used by [shuffle] and [shuffleMix].

- **zxzx**: `int`
  Shuffle mask "zxzx".

 Used by [shuffle] and [shuffleMix].

- **zxzy**: `int`
  Shuffle mask "zxzy".

 Used by [shuffle] and [shuffleMix].

- **zxzz**: `int`
  Shuffle mask "zxzz".

 Used by [shuffle] and [shuffleMix].

- **zxzw**: `int`
  Shuffle mask "zxzw".

 Used by [shuffle] and [shuffleMix].

- **zxwx**: `int`
  Shuffle mask "zxwx".

 Used by [shuffle] and [shuffleMix].

- **zxwy**: `int`
  Shuffle mask "zxwy".

 Used by [shuffle] and [shuffleMix].

- **zxwz**: `int`
  Shuffle mask "zxwz".

 Used by [shuffle] and [shuffleMix].

- **zxww**: `int`
  Shuffle mask "zxww".

 Used by [shuffle] and [shuffleMix].

- **zyxx**: `int`
  Shuffle mask "zyxx".

 Used by [shuffle] and [shuffleMix].

- **zyxy**: `int`
  Shuffle mask "zyxy".

 Used by [shuffle] and [shuffleMix].

- **zyxz**: `int`
  Shuffle mask "zyxz".

 Used by [shuffle] and [shuffleMix].

- **zyxw**: `int`
  Shuffle mask "zyxw".

 Used by [shuffle] and [shuffleMix].

- **zyyx**: `int`
  Shuffle mask "zyyx".

 Used by [shuffle] and [shuffleMix].

- **zyyy**: `int`
  Shuffle mask "zyyy".

 Used by [shuffle] and [shuffleMix].

- **zyyz**: `int`
  Shuffle mask "zyyz".

 Used by [shuffle] and [shuffleMix].

- **zyyw**: `int`
  Shuffle mask "zyyw".

 Used by [shuffle] and [shuffleMix].

- **zyzx**: `int`
  Shuffle mask "zyzx".

 Used by [shuffle] and [shuffleMix].

- **zyzy**: `int`
  Shuffle mask "zyzy".

 Used by [shuffle] and [shuffleMix].

- **zyzz**: `int`
  Shuffle mask "zyzz".

 Used by [shuffle] and [shuffleMix].

- **zyzw**: `int`
  Shuffle mask "zyzw".

 Used by [shuffle] and [shuffleMix].

- **zywx**: `int`
  Shuffle mask "zywx".

 Used by [shuffle] and [shuffleMix].

- **zywy**: `int`
  Shuffle mask "zywy".

 Used by [shuffle] and [shuffleMix].

- **zywz**: `int`
  Shuffle mask "zywz".

 Used by [shuffle] and [shuffleMix].

- **zyww**: `int`
  Shuffle mask "zyww".

 Used by [shuffle] and [shuffleMix].

- **zzxx**: `int`
  Shuffle mask "zzxx".

 Used by [shuffle] and [shuffleMix].

- **zzxy**: `int`
  Shuffle mask "zzxy".

 Used by [shuffle] and [shuffleMix].

- **zzxz**: `int`
  Shuffle mask "zzxz".

 Used by [shuffle] and [shuffleMix].

- **zzxw**: `int`
  Shuffle mask "zzxw".

 Used by [shuffle] and [shuffleMix].

- **zzyx**: `int`
  Shuffle mask "zzyx".

 Used by [shuffle] and [shuffleMix].

- **zzyy**: `int`
  Shuffle mask "zzyy".

 Used by [shuffle] and [shuffleMix].

- **zzyz**: `int`
  Shuffle mask "zzyz".

 Used by [shuffle] and [shuffleMix].

- **zzyw**: `int`
  Shuffle mask "zzyw".

 Used by [shuffle] and [shuffleMix].

- **zzzx**: `int`
  Shuffle mask "zzzx".

 Used by [shuffle] and [shuffleMix].

- **zzzy**: `int`
  Shuffle mask "zzzy".

 Used by [shuffle] and [shuffleMix].

- **zzzz**: `int`
  Shuffle mask "zzzz".

 Used by [shuffle] and [shuffleMix].

- **zzzw**: `int`
  Shuffle mask "zzzw".

 Used by [shuffle] and [shuffleMix].

- **zzwx**: `int`
  Shuffle mask "zzwx".

 Used by [shuffle] and [shuffleMix].

- **zzwy**: `int`
  Shuffle mask "zzwy".

 Used by [shuffle] and [shuffleMix].

- **zzwz**: `int`
  Shuffle mask "zzwz".

 Used by [shuffle] and [shuffleMix].

- **zzww**: `int`
  Shuffle mask "zzww".

 Used by [shuffle] and [shuffleMix].

- **zwxx**: `int`
  Shuffle mask "zwxx".

 Used by [shuffle] and [shuffleMix].

- **zwxy**: `int`
  Shuffle mask "zwxy".

 Used by [shuffle] and [shuffleMix].

- **zwxz**: `int`
  Shuffle mask "zwxz".

 Used by [shuffle] and [shuffleMix].

- **zwxw**: `int`
  Shuffle mask "zwxw".

 Used by [shuffle] and [shuffleMix].

- **zwyx**: `int`
  Shuffle mask "zwyx".

 Used by [shuffle] and [shuffleMix].

- **zwyy**: `int`
  Shuffle mask "zwyy".

 Used by [shuffle] and [shuffleMix].

- **zwyz**: `int`
  Shuffle mask "zwyz".

 Used by [shuffle] and [shuffleMix].

- **zwyw**: `int`
  Shuffle mask "zwyw".

 Used by [shuffle] and [shuffleMix].

- **zwzx**: `int`
  Shuffle mask "zwzx".

 Used by [shuffle] and [shuffleMix].

- **zwzy**: `int`
  Shuffle mask "zwzy".

 Used by [shuffle] and [shuffleMix].

- **zwzz**: `int`
  Shuffle mask "zwzz".

 Used by [shuffle] and [shuffleMix].

- **zwzw**: `int`
  Shuffle mask "zwzw".

 Used by [shuffle] and [shuffleMix].

- **zwwx**: `int`
  Shuffle mask "zwwx".

 Used by [shuffle] and [shuffleMix].

- **zwwy**: `int`
  Shuffle mask "zwwy".

 Used by [shuffle] and [shuffleMix].

- **zwwz**: `int`
  Shuffle mask "zwwz".

 Used by [shuffle] and [shuffleMix].

- **zwww**: `int`
  Shuffle mask "zwww".

 Used by [shuffle] and [shuffleMix].

- **wxxx**: `int`
  Shuffle mask "wxxx".

 Used by [shuffle] and [shuffleMix].

- **wxxy**: `int`
  Shuffle mask "wxxy".

 Used by [shuffle] and [shuffleMix].

- **wxxz**: `int`
  Shuffle mask "wxxz".

 Used by [shuffle] and [shuffleMix].

- **wxxw**: `int`
  Shuffle mask "wxxw".

 Used by [shuffle] and [shuffleMix].

- **wxyx**: `int`
  Shuffle mask "wxyx".

 Used by [shuffle] and [shuffleMix].

- **wxyy**: `int`
  Shuffle mask "wxyy".

 Used by [shuffle] and [shuffleMix].

- **wxyz**: `int`
  Shuffle mask "wxyz".

 Used by [shuffle] and [shuffleMix].

- **wxyw**: `int`
  Shuffle mask "wxyw".

 Used by [shuffle] and [shuffleMix].

- **wxzx**: `int`
  Shuffle mask "wxzx".

 Used by [shuffle] and [shuffleMix].

- **wxzy**: `int`
  Shuffle mask "wxzy".

 Used by [shuffle] and [shuffleMix].

- **wxzz**: `int`
  Shuffle mask "wxzz".

 Used by [shuffle] and [shuffleMix].

- **wxzw**: `int`
  Shuffle mask "wxzw".

 Used by [shuffle] and [shuffleMix].

- **wxwx**: `int`
  Shuffle mask "wxwx".

 Used by [shuffle] and [shuffleMix].

- **wxwy**: `int`
  Shuffle mask "wxwy".

 Used by [shuffle] and [shuffleMix].

- **wxwz**: `int`
  Shuffle mask "wxwz".

 Used by [shuffle] and [shuffleMix].

- **wxww**: `int`
  Shuffle mask "wxww".

 Used by [shuffle] and [shuffleMix].

- **wyxx**: `int`
  Shuffle mask "wyxx".

 Used by [shuffle] and [shuffleMix].

- **wyxy**: `int`
  Shuffle mask "wyxy".

 Used by [shuffle] and [shuffleMix].

- **wyxz**: `int`
  Shuffle mask "wyxz".

 Used by [shuffle] and [shuffleMix].

- **wyxw**: `int`
  Shuffle mask "wyxw".

 Used by [shuffle] and [shuffleMix].

- **wyyx**: `int`
  Shuffle mask "wyyx".

 Used by [shuffle] and [shuffleMix].

- **wyyy**: `int`
  Shuffle mask "wyyy".

 Used by [shuffle] and [shuffleMix].

- **wyyz**: `int`
  Shuffle mask "wyyz".

 Used by [shuffle] and [shuffleMix].

- **wyyw**: `int`
  Shuffle mask "wyyw".

 Used by [shuffle] and [shuffleMix].

- **wyzx**: `int`
  Shuffle mask "wyzx".

 Used by [shuffle] and [shuffleMix].

- **wyzy**: `int`
  Shuffle mask "wyzy".

 Used by [shuffle] and [shuffleMix].

- **wyzz**: `int`
  Shuffle mask "wyzz".

 Used by [shuffle] and [shuffleMix].

- **wyzw**: `int`
  Shuffle mask "wyzw".

 Used by [shuffle] and [shuffleMix].

- **wywx**: `int`
  Shuffle mask "wywx".

 Used by [shuffle] and [shuffleMix].

- **wywy**: `int`
  Shuffle mask "wywy".

 Used by [shuffle] and [shuffleMix].

- **wywz**: `int`
  Shuffle mask "wywz".

 Used by [shuffle] and [shuffleMix].

- **wyww**: `int`
  Shuffle mask "wyww".

 Used by [shuffle] and [shuffleMix].

- **wzxx**: `int`
  Shuffle mask "wzxx".

 Used by [shuffle] and [shuffleMix].

- **wzxy**: `int`
  Shuffle mask "wzxy".

 Used by [shuffle] and [shuffleMix].

- **wzxz**: `int`
  Shuffle mask "wzxz".

 Used by [shuffle] and [shuffleMix].

- **wzxw**: `int`
  Shuffle mask "wzxw".

 Used by [shuffle] and [shuffleMix].

- **wzyx**: `int`
  Shuffle mask "wzyx".

 Used by [shuffle] and [shuffleMix].

- **wzyy**: `int`
  Shuffle mask "wzyy".

 Used by [shuffle] and [shuffleMix].

- **wzyz**: `int`
  Shuffle mask "wzyz".

 Used by [shuffle] and [shuffleMix].

- **wzyw**: `int`
  Shuffle mask "wzyw".

 Used by [shuffle] and [shuffleMix].

- **wzzx**: `int`
  Shuffle mask "wzzx".

 Used by [shuffle] and [shuffleMix].

- **wzzy**: `int`
  Shuffle mask "wzzy".

 Used by [shuffle] and [shuffleMix].

- **wzzz**: `int`
  Shuffle mask "wzzz".

 Used by [shuffle] and [shuffleMix].

- **wzzw**: `int`
  Shuffle mask "wzzw".

 Used by [shuffle] and [shuffleMix].

- **wzwx**: `int`
  Shuffle mask "wzwx".

 Used by [shuffle] and [shuffleMix].

- **wzwy**: `int`
  Shuffle mask "wzwy".

 Used by [shuffle] and [shuffleMix].

- **wzwz**: `int`
  Shuffle mask "wzwz".

 Used by [shuffle] and [shuffleMix].

- **wzww**: `int`
  Shuffle mask "wzww".

 Used by [shuffle] and [shuffleMix].

- **wwxx**: `int`
  Shuffle mask "wwxx".

 Used by [shuffle] and [shuffleMix].

- **wwxy**: `int`
  Shuffle mask "wwxy".

 Used by [shuffle] and [shuffleMix].

- **wwxz**: `int`
  Shuffle mask "wwxz".

 Used by [shuffle] and [shuffleMix].

- **wwxw**: `int`
  Shuffle mask "wwxw".

 Used by [shuffle] and [shuffleMix].

- **wwyx**: `int`
  Shuffle mask "wwyx".

 Used by [shuffle] and [shuffleMix].

- **wwyy**: `int`
  Shuffle mask "wwyy".

 Used by [shuffle] and [shuffleMix].

- **wwyz**: `int`
  Shuffle mask "wwyz".

 Used by [shuffle] and [shuffleMix].

- **wwyw**: `int`
  Shuffle mask "wwyw".

 Used by [shuffle] and [shuffleMix].

- **wwzx**: `int`
  Shuffle mask "wwzx".

 Used by [shuffle] and [shuffleMix].

- **wwzy**: `int`
  Shuffle mask "wwzy".

 Used by [shuffle] and [shuffleMix].

- **wwzz**: `int`
  Shuffle mask "wwzz".

 Used by [shuffle] and [shuffleMix].

- **wwzw**: `int`
  Shuffle mask "wwzw".

 Used by [shuffle] and [shuffleMix].

- **wwwx**: `int`
  Shuffle mask "wwwx".

 Used by [shuffle] and [shuffleMix].

- **wwwy**: `int`
  Shuffle mask "wwwy".

 Used by [shuffle] and [shuffleMix].

- **wwwz**: `int`
  Shuffle mask "wwwz".

 Used by [shuffle] and [shuffleMix].

- **wwww**: `int`
  Shuffle mask "wwww".

 Used by [shuffle] and [shuffleMix].

## Constructors

### Unnamed Constructor
Creates a `Float32x4` containing the 32-bit float values of the arguments.

 The created value has [Float32x4.x], [Float32x4.y], [Float32x4.z]
 and [Float32x4.w] values that are the 32-bit floating point values
 created from the [x], [y], [z] and [w] arguments by conversion
 from 64-bit floating point to 32-bit floating point values.

 The conversion from 64-bit float to 32-bit float loses significant
 precision, and may become zero or infinite even if the original 64-bit
 floating point value was non-zero and finite.

### splat
Creates a `Float32x4` with the same 32-bit float value four times.

 The created value has the same [Float32x4.x], [Float32x4.y], [Float32x4.z]
 and [Float32x4.w] value, which is the 32-bit floating point value
 created by converting the 64-bit floating point [value] to a
 32-bit floating point value.

 The conversion from 64-bit float to 32-bit float loses significant
 precision, and may become zero or infinite even if the original 64-bit
 floating point value was non-zero and finite.

#### Parameters

- `value`: `double`
### zero
Creates a `Float32x4` with all values being zero.

 The created value has the same [Float32x4.x], [Float32x4.y], [Float32x4.z]
 and [Float32x4.w] value, which is the 32-bit floating point zero value.

### fromInt32x4Bits
Creates a `Float32x4` with 32-bit float values from the provided bits.

 The created value has [Float32x4.x], [Float32x4.y], [Float32x4.z]
 and [Float32x4.w] values, which are the 32-bit floating point values
 of the bit-representations of the corresponding lanes of [bits].

 The conversion is performed using the *platform endianness* for both
 32-bit integers and 32-bit floating point numbers.

#### Parameters

- `bits`: `Int32x4`
### fromFloat64x2
Creates a `Float32x4` with its [x] and [y] lanes set to values from [xy].

 The created value has [Float32x4.x] and [Float32x4.y] values
 which are the conversions of the [Float64x2.x] and [Float64x2.y] lanes
 of [xy] to 32-bit floating point values.
 The [Float32x4.z] and [Float32x4.w] lanes are set to the zero value.

#### Parameters

- `xy`: `Float64x2`
