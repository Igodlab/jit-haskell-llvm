# Building a JIT Compiled Language with Haskell & LLVM

This is an amateur tour around building JIT compilers. To add some spice to the challenge we are using Haskell! 

This guide is based on [@smdiehl](https://twitter.com/smdiehl)'s guide [link](https://www.stephendiehl.com/llvm/) on how to build Kaleidoscope a JIT compiled language.

This tutorial has the goal of teaching comiler techniques and LLVM specifically, not about teaching moderrn and sane software engineering principles. If you are a pro you will not find hard to fix deficiencies. 

- Chapter #1: Introduction to the Kaleidoscope language, and the definition of its Lexer - This shows where we are going and the basic functionality that we want it to do. LLVM obviously works just fine with such tools, feel free to use one if you prefer.

- Chapter #2: Implementing a Parser and AST - With the lexer in place, we can talk about parsing techniques and basic AST construction. This tutorial describes recursive descent parsing and operator precedence parsing. Nothing in Chapters 1 or 2 is LLVM-specific, the code doesn't even link in LLVM at this point. :)

- Chapter #3: Code generation to LLVM IR - With the AST ready, we can show off how easy generation of LLVM IR really is.

- Chapter #4: Adding JIT and Optimizer Support - Because a lot of people are interested in using LLVM as a JIT, we'll dive right into it and show you the 3 lines it takes to add JIT support. LLVM is also useful in many other ways, but this is one simple and "sexy" way to show off its power. :)

- Chapter #5: Extending the Language: Control Flow - With the language up and running, we show how to extend it with control flow operations (if/then/else and a ‘for' loop). This gives us a chance to talk about simple SSA construction and control flow.

- Chapter #6: Extending the Language: User-defined Operators - This is a silly but fun chapter that talks about extending the language to let the user program define their own arbitrary unary and binary operators (with assignable precedence!). This lets us build a significant piece of the "language" as library routines.

- Chapter #7: Extending the Language: Mutable Variables - This chapter talks about adding user-defined local variables along with an assignment operator. The interesting part about this is how easy and trivial it is to construct SSA form in LLVM: no, LLVM does not require your front-end to construct SSA form!

- Chapter #8: Conclusion and other useful LLVM tidbits - This chapter wraps up the series by talking about potential ways to extend the language.

# Chapter 1

This guide will assume that we are well versed with intermidiate Haskell terms like Monads, Transformers and Applicatives. Also, very important, we are not using the most sophisticated code so sometimes we'll just do the "stupid thing" ie. low hanging fruit code implementations, because it just helps illustrating the main point rather than dwelling on advanced syntax.

### Get LLVM and Haskell

To begin with we need the **LLVM Compiler Insfrastructure**, we can either download it / build it from source from the official [LLVM site](https://releases.llvm.org/). In this guide we will be building everything with Nix thus cd to your root directory in your machine and git clone the `llvm-project` 

```
$ git clone https://github.com/llvm/llvm-project.git
$ cd llvm-project
```

Now, to access its features through Nix we need to create a `shell.nix` script, so you can create your custom branch and then follow the [NixOS - Build LLVM/clang from source](https://nixos.wiki/wiki/LLVM) to wrtie our `shell.nix`. After that open up the shell and cd to the directory of this project and open up another Nix shell. The latter one contains Haskell and GHC.

```
$ nix-shell
[nix-shell]$ cd ~/jit-haskell-llvm
[nix-shell]$ nix-shell
```

We can now check that we have everything needed for the project now:

```
[nix-shell]$ llvm-config --version
13.0.1

[nix-shell]$ llvm-as --version
  LLVM version 13.0.1
  ⠇

[nix-shell]$ llvm-dis --version
  LLVM version 13.0.1
  ⠇

[nix-shell]$ llc --version
LLVM (http://llvm.org/):
  LLVM version 13.0.1
  Optimized build.
  Default target: x86_64-unknown-linux-gnu
  Host CPU: znver1
  ⠇

[nix-shell]$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 9.0.2
```

We have everything to get started! Let's get on to it!
