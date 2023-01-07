# Chapter 1
## Building a JIT compiler with Haskell and LLVM

A quick description of a compiler pipeline 

 ```mermaid
graph LR
A(source) -->B[lexer] -->C[parser] -->D[typechecker] -->E[codegen] -->F(a.out)
```

where in the middle process we have a ton of code translations between various IRs. More particularly LLVm is a statically typed IR + an associated toolchain for manipulating, optimizing and converting IR -> native code. 

- Command-line tools (CLI): `llvm-dis` & `llvm-as`; can be used to transalte between the two.
- LLVM comes in two flavors: i) binary code format `*.bc` and ii) assembly `*.ll`; also referred to as IR / LLVM IR, differentiating it from native assembly post compilation.
- Binary fromat for LLVM starts with the magic two-byte sequence `0x42 0x43` or BC. 


