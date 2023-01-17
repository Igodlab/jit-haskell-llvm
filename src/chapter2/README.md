# Chapter 2
## Parser and AST

### Parser combinations 

After we have our set up ready with Nix, then we start writing the first step in writing a compiler. Lets start with the lexical analysis; which basically scans the stream of characters in the source program and structures characters into tokens that have a meaningful sequence. 

Lets create the Lexer module (`Lexer.hs`) that, as mentioned above helps identify tokens.
