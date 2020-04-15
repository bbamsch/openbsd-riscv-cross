# LLVM Build Notes

## LLVM Cross-Tool Configuration

### Environment

```
export  CC=/usr/local/riscv/bin/clang \
        CXX=/usr/local/riscv/bin/clang++ \
        LD=/usr/local/riscv/bin/ld.lld
```

### CMake Configuration

```
cmake \
  -DLLVM_ENABLE_FFI:Bool=False \
  -DLLVM_ENABLE_TERMINFO:Bool=False \
  -DLLVM_ENABLE_RTTI:Bool=False \
  -DCMAKE_DISABLE_FIND_PACKAGE_LibXml2:Bool=True \
  -DCMAKE_DISABLE_FIND_PACKAGE_Z3:Bool=True \
  -DLLVM_TOOL_LLDB_BUILD:Bool=True \
  -DLLVM_BUILD_LLVM_DYLIB:Bool=True \
  -DLLVM_LINK_LLVM_DYLIB:Bool=True \
  -DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
  -DCMAKE_DISABLE_FIND_PACKAGE_Backtrace:Bool=True \
  -DLLVM_TARGETS_TO_BUILD:String="X86;RISCV" \
  -DLLVM_ENABLE_PROJECTS:String="clang;lld;lldb" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr/local/riscv \
  -DCMAKE_CXX_FLAGS="-mno-retpoline" \
  -G Ninja \
  ../llvm
```
