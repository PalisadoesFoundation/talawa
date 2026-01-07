# Overview for `ZirconFFIBindings`

## Description

Bindings for `dart:zircon_ffi`.

## Members

- **_lookup**: `ffi.Pointer&lt;T&gt; Function<T extends ffi.NativeType>(String symbolName)`
  Holds the symbol lookup function.

- **_zircon_dart_byte_array_create_ptr**: `dynamic`
- **_zircon_dart_byte_array_create**: `_dart_zircon_dart_byte_array_create`
- **_zircon_dart_byte_array_set_value_ptr**: `dynamic`
- **_zircon_dart_byte_array_set_value**: `_dart_zircon_dart_byte_array_set_value`
- **_zircon_dart_byte_array_free_ptr**: `dynamic`
- **_zircon_dart_byte_array_free**: `_dart_zircon_dart_byte_array_free`
- **_zircon_dart_handle_list_create_ptr**: `dynamic`
- **_zircon_dart_handle_list_create**: `_dart_zircon_dart_handle_list_create`
- **_zircon_dart_handle_list_append_ptr**: `dynamic`
- **_zircon_dart_handle_list_append**: `_dart_zircon_dart_handle_list_append`
- **_zircon_dart_handle_list_free_ptr**: `dynamic`
- **_zircon_dart_handle_list_free**: `_dart_zircon_dart_handle_list_free`
- **_zircon_dart_handle_is_valid_ptr**: `dynamic`
- **_zircon_dart_handle_is_valid**: `_dart_zircon_dart_handle_is_valid`
- **_zircon_dart_handle_close_ptr**: `dynamic`
- **_zircon_dart_handle_close**: `_dart_zircon_dart_handle_close`
- **_zircon_dart_handle_free_ptr**: `dynamic`
- **_zircon_dart_handle_free**: `_dart_zircon_dart_handle_free`
- **_zircon_dart_handle_pair_attach_finalizer_ptr**: `dynamic`
- **_zircon_dart_handle_pair_attach_finalizer**: `_dart_zircon_dart_handle_pair_attach_finalizer`
- **_zircon_dart_handle_attach_finalizer_ptr**: `dynamic`
- **_zircon_dart_handle_attach_finalizer**: `_dart_zircon_dart_handle_attach_finalizer`
- **_zircon_dart_channel_create_ptr**: `dynamic`
- **_zircon_dart_channel_create**: `_dart_zircon_dart_channel_create`
- **_zircon_dart_channel_write_ptr**: `dynamic`
- **_zircon_dart_channel_write**: `_dart_zircon_dart_channel_write`
- **_zircon_dart_clock_get_monotonic_ptr**: `dynamic`
- **_zircon_dart_clock_get_monotonic**: `_dart_zircon_dart_clock_get_monotonic`
- **_zircon_dart_dl_initialize_ptr**: `dynamic`
- **_zircon_dart_dl_initialize**: `_dart_zircon_dart_dl_initialize`
## Constructors

### Unnamed Constructor
The symbols are looked up in [dynamicLibrary].

### fromLookup
The symbols are looked up with [lookup].

#### Parameters

- `lookup`: `ffi.Pointer&lt;T&gt; Function<T extends ffi.NativeType>(String symbolName)`
