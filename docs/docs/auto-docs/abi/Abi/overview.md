# Overview for `Abi`

## Description

An application binary interface (ABI).

 An ABI defines the memory layout of data
 and the function call protocol for native code.
 It is usually defined by the an operating system for each
 architecture that operating system runs on.

 The Dart VM can run on a variety of operating systems and architectures.
 Supported ABIs are represented by `Abi` objects.
 See [values] for all the supported ABIs.

## Members

- **androidArm**: `dynamic`
  The application binary interface for Android on the Arm architecture.

- **androidArm64**: `dynamic`
  The application binary interface for Android on the Arm64 architecture.

- **androidIA32**: `dynamic`
  The application binary interface for Android on the IA32 architecture.

- **androidX64**: `dynamic`
  The application binary interface for Android on the X64 architecture.

- **androidRiscv64**: `dynamic`
  The application binary interface for Android on 64-bit RISC-V.

- **fuchsiaArm64**: `dynamic`
  The application binary interface for Fuchsia on the Arm64 architecture.

- **fuchsiaX64**: `dynamic`
  The application binary interface for Fuchsia on the X64 architecture.

- **fuchsiaRiscv64**: `dynamic`
  The application binary interface for Fuchsia on the Riscv64 architecture.

- **iosArm**: `dynamic`
  The application binary interface for iOS on the Arm architecture.

- **iosArm64**: `dynamic`
  The application binary interface for iOS on the Arm64 architecture.

- **iosX64**: `dynamic`
  The application binary interface for iOS on the X64 architecture.

- **linuxArm**: `dynamic`
  The application binary interface for Linux on the Arm architecture.

 Does not distinguish between hard and soft fp. Currently, no uses of Abi
 require this distinction.

- **linuxArm64**: `dynamic`
  The application binary interface for linux on the Arm64 architecture.

- **linuxIA32**: `dynamic`
  The application binary interface for linux on the IA32 architecture.

- **linuxX64**: `dynamic`
  The application binary interface for linux on the X64 architecture.

- **linuxRiscv32**: `dynamic`
  The application binary interface for linux on 32-bit RISC-V.

- **linuxRiscv64**: `dynamic`
  The application binary interface for linux on 64-bit RISC-V.

- **macosArm64**: `dynamic`
  The application binary interface for MacOS on the Arm64 architecture.

- **macosX64**: `dynamic`
  The application binary interface for MacOS on the X64 architecture.

- **windowsArm64**: `dynamic`
  The application binary interface for Windows on the Arm64 architecture.

- **windowsIA32**: `dynamic`
  The application binary interface for Windows on the IA32 architecture.

- **windowsX64**: `dynamic`
  The application binary interface for Windows on the X64 architecture.

- **values**: `dynamic`
  The ABIs that the DartVM can run on.

 Does not contain a `macosIA32`. We have stopped supporting 32-bit MacOS.

- **_os**: `_OS`
  The operating system of this [Abi].

- **_architecture**: `_Architecture`
  The architecture of this [Abi].

- **_androidArm**: `dynamic`
- **_androidArm64**: `dynamic`
- **_androidIA32**: `dynamic`
- **_androidX64**: `dynamic`
- **_androidRiscv64**: `dynamic`
- **_fuchsiaArm64**: `dynamic`
- **_fuchsiaX64**: `dynamic`
- **_fuchsiaRiscv64**: `dynamic`
- **_iosArm**: `dynamic`
- **_iosArm64**: `dynamic`
- **_iosX64**: `dynamic`
- **_linuxArm**: `dynamic`
- **_linuxArm64**: `dynamic`
- **_linuxIA32**: `dynamic`
- **_linuxX64**: `dynamic`
- **_linuxRiscv32**: `dynamic`
- **_linuxRiscv64**: `dynamic`
- **_macosArm64**: `dynamic`
- **_macosX64**: `dynamic`
- **_windowsArm64**: `dynamic`
- **_windowsIA32**: `dynamic`
- **_windowsX64**: `dynamic`
## Constructors

### current
The ABI the Dart VM is currently running on.

### _
The constructor is private so that we can use [Abi.values] as opaque
 tokens.

#### Parameters

- `_architecture`: `dynamic`
- `_os`: `dynamic`
