# Chapter 3
## Code Generation

### Haskell LLVM Bindings

This chapter will deal with transforming AST into LLVM IR.

The LLVM bindings for Haskell are split in two packages: 

- **llvm-hs-pure** is a pure Haskell representation of the LLVM IR.
- **llvm-hs** is the FFI bindings required for constructing the C representation of the LLVM IR and performing compiler optimization & compilation.

Lets create the code generation module (`Codegen.hs`) that, as mentioned above helps identify tokens.

