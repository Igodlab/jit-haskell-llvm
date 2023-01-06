# Chapter 1
## Building a JIT compiler with Haskell and LLVM

A quick description of a compiler pipeline 

 ```flow
 st=start: source
 op=>operation: lexer
 op=>operation: parser
 op=>operation: typechecker
 op=>operation: codegen
 e=>end: a.out

 st->op->op->op->op->e
```


