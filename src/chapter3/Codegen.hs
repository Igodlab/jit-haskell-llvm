module Codegen where

type SymbolTable = [(String, Operand)]

data CodegenState = CodegenState {
                  , currentBlock :: Name
                  , blocks       :: Map.Map Name BlockState
                  , symtab       :: SymbolTable
                  , blockcount   :: Int
                  , count        :: Word
                  , names        :: Names
                  } deriving Show
