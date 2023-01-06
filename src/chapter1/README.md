# Chapter 1
## Building a JIT compiler with Haskell and LLVM

A quick description of a compiler pipeline 

 --------
| source | -> | lexer | -> | parser | -> | typechecker | -> | codegen | -> ( a.out )
 --------

 ```mermaid
%% Example of sequence diagram
  sequenceDiagram
    Alice->>Bob: Hello Bob, how are you?
    alt is sick
    Bob->>Alice: Not so good :(
    else is well
    Bob->>Alice: Feeling fresh like a daisy
    end
    opt Extra response
    Bob->>Alice: Thanks for asking
    end
```
