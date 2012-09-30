
{-# LANGUAGE DisambiguateRecordFields, TypeFamilies,
    StandaloneDeriving, DeriveFunctor, DeriveFoldable, GeneralizedNewtypeDeriving #-}

-------------------------------------------------------------------------------------
-- |
-- Copyright   : (c) Hans Hoglund 2012
--
-- License     : BSD-style
--
-- Maintainer  : hans@hanshoglund.se
-- Stability   : experimental
-- Portability : GHC
--     
-- A module is a set of top-level bindings described in a single header file.
-- Each module can depend on a set of other modules (translated as include directives).
-- Recursive dependencies are not allowed.
--
-------------------------------------------------------------------------------------

module Language.Modulo (
        Module(..),
        ModuleName(..),
        Decl(..),
        
        Name,
        Value(..),
        
        Type(..),
        PrimType(..),        
        RefType(..),        
        FunType(..),        
        CompType(..),        
  ) where

import Data.Ord
import Numeric.Natural
import Foreign.C.Types      

import Data.List.NonEmpty ( NonEmpty(..) )

import qualified Data.List as List
import qualified Data.List.NonEmpty as NonEmpty


-- | 
-- A module is a named container of imports and declarations.
data Module 
    = Module { 
               modName         :: ModuleName, 
               modImports      :: [ModuleName], 
               modDecls :: [Decl] 
             }
    deriving (Eq, Show)

instance Ord Module where
    compare = comparing modName
        
-- | 
-- A module name is a non-empty list of strings.
newtype ModuleName 
    = ModuleName { 
                   moduleName :: (NonEmpty String) 
                 }
    deriving (Eq, Ord)

instance Show ModuleName where
    show (ModuleName (x :| xs)) = concat . List.intersperse "." $ x : xs



-- | 
-- A name is a string.
type Name = String

-- | 
-- An declaration maps a name to type and (optionally) a value.
data Decl 
    = TypeDecl Name Type                 -- ^ Declares a type.
    | TagDecl Type                       -- ^ Declares a struct or enum tag.
    | FunctionDecl Name FunType     -- ^ Declares a function.
    | ConstDecl Name (Maybe Value) Type  -- ^ Declares a constant value.
    | GlobalDecl Name (Maybe Value) Type -- ^ Declares a global variable.
    deriving (Eq, Show)


-- | 
-- A value is anything that can be declared as a C constant.
type Value 
    = Int 

-- | 
-- A type is either an alias, a primitive or a compound type.
data Type             
    = Alias         Name            -- ^ An alias, introduced by a former type declaration.
    | PrimType      PrimType        
    | RefType       RefType
    | FunType  FunType
    | CompType  CompType
    deriving (Eq, Show)

-- | A primitive type.
data PrimType
    = Void | Size | Ptrdiff | Intptr | UIntptr 
    | Char  | Short  | Int  | Long  | LongLong
    | UChar | UShort | UInt | ULong | ULongLong
    | Float | Double | LongDouble
    | Int8 | Int16 | Int32 | Int64 | UInt8 | UInt16 | UInt32 | UInt64
    deriving (Eq, Show)

data RefType
    = Pointer Type          -- ^ The C pointer type @t*@.
    | Array   Type Natural  -- ^ The C array type @t[n]@.
    deriving (Eq, Show)

-- | A function type.
data FunType 
    = Function [Type] Type -- ^ The C function type @Tn(T1, ... Tn-1)@.
    deriving (Eq, Show)

data CompType
    = Enum        (NonEmpty Name)                   -- ^ A C enum type.
    | Struct      (NonEmpty (Name, Type))           -- ^ A C struct type.
    | Union       (NonEmpty (Name, Type))           -- ^ A C union type.
    | BitField    (NonEmpty (Name, Type, Natural))  -- ^ A C bitfield type.
    deriving (Eq, Show)
    


-- TODO Decl of struct/union tags

-- TODO use Foreign.C values for Value

-- TODO Decl order by sort and name?

