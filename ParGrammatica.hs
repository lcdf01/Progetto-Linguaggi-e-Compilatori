{-# OPTIONS_GHC -w #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE NoStrictData #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE PartialTypeSignatures #-}
#if __GLASGOW_HASKELL__ >= 710
{-# LANGUAGE PartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module ParGrammatica
  ( happyError
  , myLexer
  , pProgram
  , pStmt
  , pRExpr
  , pLExpr
  ) where

import Prelude

import qualified AbsGrammatica
import LexGrammatica
import qualified Data.Function as Happy_Prelude
import qualified Data.Bool as Happy_Prelude
import qualified Data.Function as Happy_Prelude
import qualified Data.Maybe as Happy_Prelude
import qualified Data.Int as Happy_Prelude
import qualified Data.String as Happy_Prelude
import qualified Data.Tuple as Happy_Prelude
import qualified Data.List as Happy_Prelude
import qualified Control.Monad as Happy_Prelude
import qualified Text.Show as Happy_Prelude
import qualified GHC.Num as Happy_Prelude
import qualified GHC.Err as Happy_Prelude
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 2.1.5

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap8 = HappyWrap8 (AbsGrammatica.Ident)
happyIn8 :: (AbsGrammatica.Ident) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap8 x)
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> HappyWrap8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
newtype HappyWrap9 = HappyWrap9 (Char)
happyIn9 :: (Char) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap9 x)
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> HappyWrap9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
newtype HappyWrap10 = HappyWrap10 (Double)
happyIn10 :: (Double) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap10 x)
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> HappyWrap10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
newtype HappyWrap11 = HappyWrap11 (Integer)
happyIn11 :: (Integer) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap11 x)
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> HappyWrap11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
newtype HappyWrap12 = HappyWrap12 (String)
happyIn12 :: (String) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap12 x)
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> HappyWrap12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
newtype HappyWrap13 = HappyWrap13 (AbsGrammatica.Boolean)
happyIn13 :: (AbsGrammatica.Boolean) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap13 x)
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> HappyWrap13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
newtype HappyWrap14 = HappyWrap14 (AbsGrammatica.RExpr)
happyIn14 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap14 x)
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> HappyWrap14
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
newtype HappyWrap15 = HappyWrap15 (AbsGrammatica.RExpr)
happyIn15 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap15 x)
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> HappyWrap15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
newtype HappyWrap16 = HappyWrap16 (AbsGrammatica.RExpr)
happyIn16 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 (AbsGrammatica.RExpr)
happyIn17 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 (AbsGrammatica.RExpr)
happyIn18 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 (AbsGrammatica.RExpr)
happyIn19 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 (AbsGrammatica.RExpr)
happyIn20 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 (AbsGrammatica.RExpr)
happyIn21 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
newtype HappyWrap22 = HappyWrap22 (AbsGrammatica.RExpr)
happyIn22 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap22 x)
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> HappyWrap22
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
newtype HappyWrap23 = HappyWrap23 (AbsGrammatica.RExpr)
happyIn23 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap23 x)
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> HappyWrap23
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
newtype HappyWrap24 = HappyWrap24 (AbsGrammatica.RExpr)
happyIn24 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap24 x)
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> HappyWrap24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
newtype HappyWrap25 = HappyWrap25 (AbsGrammatica.RExpr)
happyIn25 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap25 x)
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> HappyWrap25
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
newtype HappyWrap26 = HappyWrap26 (AbsGrammatica.RExpr)
happyIn26 :: (AbsGrammatica.RExpr) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap26 x)
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> HappyWrap26
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
newtype HappyWrap27 = HappyWrap27 (AbsGrammatica.FunCall)
happyIn27 :: (AbsGrammatica.FunCall) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap27 x)
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> HappyWrap27
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
newtype HappyWrap28 = HappyWrap28 ([AbsGrammatica.RExpr])
happyIn28 :: ([AbsGrammatica.RExpr]) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap28 x)
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> HappyWrap28
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
newtype HappyWrap29 = HappyWrap29 (AbsGrammatica.LExpr)
happyIn29 :: (AbsGrammatica.LExpr) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap29 x)
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> HappyWrap29
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
newtype HappyWrap30 = HappyWrap30 (AbsGrammatica.LExpr)
happyIn30 :: (AbsGrammatica.LExpr) -> (HappyAbsSyn )
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap30 x)
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn ) -> HappyWrap30
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
newtype HappyWrap31 = HappyWrap31 (AbsGrammatica.LExpr)
happyIn31 :: (AbsGrammatica.LExpr) -> (HappyAbsSyn )
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap31 x)
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn ) -> HappyWrap31
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
newtype HappyWrap32 = HappyWrap32 (AbsGrammatica.LExpr)
happyIn32 :: (AbsGrammatica.LExpr) -> (HappyAbsSyn )
happyIn32 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap32 x)
{-# INLINE happyIn32 #-}
happyOut32 :: (HappyAbsSyn ) -> HappyWrap32
happyOut32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut32 #-}
newtype HappyWrap33 = HappyWrap33 (AbsGrammatica.BLExpr)
happyIn33 :: (AbsGrammatica.BLExpr) -> (HappyAbsSyn )
happyIn33 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap33 x)
{-# INLINE happyIn33 #-}
happyOut33 :: (HappyAbsSyn ) -> HappyWrap33
happyOut33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut33 #-}
newtype HappyWrap34 = HappyWrap34 (AbsGrammatica.Program)
happyIn34 :: (AbsGrammatica.Program) -> (HappyAbsSyn )
happyIn34 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap34 x)
{-# INLINE happyIn34 #-}
happyOut34 :: (HappyAbsSyn ) -> HappyWrap34
happyOut34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut34 #-}
newtype HappyWrap35 = HappyWrap35 ([AbsGrammatica.Decl])
happyIn35 :: ([AbsGrammatica.Decl]) -> (HappyAbsSyn )
happyIn35 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap35 x)
{-# INLINE happyIn35 #-}
happyOut35 :: (HappyAbsSyn ) -> HappyWrap35
happyOut35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut35 #-}
newtype HappyWrap36 = HappyWrap36 (AbsGrammatica.Decl)
happyIn36 :: (AbsGrammatica.Decl) -> (HappyAbsSyn )
happyIn36 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap36 x)
{-# INLINE happyIn36 #-}
happyOut36 :: (HappyAbsSyn ) -> HappyWrap36
happyOut36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut36 #-}
newtype HappyWrap37 = HappyWrap37 ([AbsGrammatica.Parameter])
happyIn37 :: ([AbsGrammatica.Parameter]) -> (HappyAbsSyn )
happyIn37 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap37 x)
{-# INLINE happyIn37 #-}
happyOut37 :: (HappyAbsSyn ) -> HappyWrap37
happyOut37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut37 #-}
newtype HappyWrap38 = HappyWrap38 (AbsGrammatica.Parameter)
happyIn38 :: (AbsGrammatica.Parameter) -> (HappyAbsSyn )
happyIn38 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap38 x)
{-# INLINE happyIn38 #-}
happyOut38 :: (HappyAbsSyn ) -> HappyWrap38
happyOut38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut38 #-}
newtype HappyWrap39 = HappyWrap39 (AbsGrammatica.VarSpec)
happyIn39 :: (AbsGrammatica.VarSpec) -> (HappyAbsSyn )
happyIn39 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap39 x)
{-# INLINE happyIn39 #-}
happyOut39 :: (HappyAbsSyn ) -> HappyWrap39
happyOut39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut39 #-}
newtype HappyWrap40 = HappyWrap40 (AbsGrammatica.TypeSpec)
happyIn40 :: (AbsGrammatica.TypeSpec) -> (HappyAbsSyn )
happyIn40 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap40 x)
{-# INLINE happyIn40 #-}
happyOut40 :: (HappyAbsSyn ) -> HappyWrap40
happyOut40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut40 #-}
newtype HappyWrap41 = HappyWrap41 (AbsGrammatica.BasicType)
happyIn41 :: (AbsGrammatica.BasicType) -> (HappyAbsSyn )
happyIn41 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap41 x)
{-# INLINE happyIn41 #-}
happyOut41 :: (HappyAbsSyn ) -> HappyWrap41
happyOut41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut41 #-}
newtype HappyWrap42 = HappyWrap42 (AbsGrammatica.CompoundType)
happyIn42 :: (AbsGrammatica.CompoundType) -> (HappyAbsSyn )
happyIn42 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap42 x)
{-# INLINE happyIn42 #-}
happyOut42 :: (HappyAbsSyn ) -> HappyWrap42
happyOut42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut42 #-}
newtype HappyWrap43 = HappyWrap43 (AbsGrammatica.CompStmt)
happyIn43 :: (AbsGrammatica.CompStmt) -> (HappyAbsSyn )
happyIn43 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap43 x)
{-# INLINE happyIn43 #-}
happyOut43 :: (HappyAbsSyn ) -> HappyWrap43
happyOut43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut43 #-}
newtype HappyWrap44 = HappyWrap44 ([AbsGrammatica.BlockItem])
happyIn44 :: ([AbsGrammatica.BlockItem]) -> (HappyAbsSyn )
happyIn44 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap44 x)
{-# INLINE happyIn44 #-}
happyOut44 :: (HappyAbsSyn ) -> HappyWrap44
happyOut44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut44 #-}
newtype HappyWrap45 = HappyWrap45 (AbsGrammatica.BlockItem)
happyIn45 :: (AbsGrammatica.BlockItem) -> (HappyAbsSyn )
happyIn45 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap45 x)
{-# INLINE happyIn45 #-}
happyOut45 :: (HappyAbsSyn ) -> HappyWrap45
happyOut45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut45 #-}
newtype HappyWrap46 = HappyWrap46 ([AbsGrammatica.Stmt])
happyIn46 :: ([AbsGrammatica.Stmt]) -> (HappyAbsSyn )
happyIn46 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap46 x)
{-# INLINE happyIn46 #-}
happyOut46 :: (HappyAbsSyn ) -> HappyWrap46
happyOut46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut46 #-}
newtype HappyWrap47 = HappyWrap47 (AbsGrammatica.Stmt)
happyIn47 :: (AbsGrammatica.Stmt) -> (HappyAbsSyn )
happyIn47 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap47 x)
{-# INLINE happyIn47 #-}
happyOut47 :: (HappyAbsSyn ) -> HappyWrap47
happyOut47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut47 #-}
newtype HappyWrap48 = HappyWrap48 (AbsGrammatica.Assignment_op)
happyIn48 :: (AbsGrammatica.Assignment_op) -> (HappyAbsSyn )
happyIn48 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap48 x)
{-# INLINE happyIn48 #-}
happyOut48 :: (HappyAbsSyn ) -> HappyWrap48
happyOut48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut48 #-}
newtype HappyWrap49 = HappyWrap49 (AbsGrammatica.JumpStmt)
happyIn49 :: (AbsGrammatica.JumpStmt) -> (HappyAbsSyn )
happyIn49 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap49 x)
{-# INLINE happyIn49 #-}
happyOut49 :: (HappyAbsSyn ) -> HappyWrap49
happyOut49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut49 #-}
newtype HappyWrap50 = HappyWrap50 (AbsGrammatica.SelectionStmt)
happyIn50 :: (AbsGrammatica.SelectionStmt) -> (HappyAbsSyn )
happyIn50 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap50 x)
{-# INLINE happyIn50 #-}
happyOut50 :: (HappyAbsSyn ) -> HappyWrap50
happyOut50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut50 #-}
newtype HappyWrap51 = HappyWrap51 (AbsGrammatica.IterStmt)
happyIn51 :: (AbsGrammatica.IterStmt) -> (HappyAbsSyn )
happyIn51 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap51 x)
{-# INLINE happyIn51 #-}
happyOut51 :: (HappyAbsSyn ) -> HappyWrap51
happyOut51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut51 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


{-# NOINLINE happyTokenStrings #-}
happyTokenStrings = ["'!'","'!='","'%'","'&'","'&&'","'&='","'('","')'","'*'","'*='","'+'","'++'","'+='","','","'-'","'--'","'-='","'/'","'/='","';'","'<'","'<='","'='","'=='","'>'","'>='","'['","']'","'^'","'^='","'bool'","'break'","'char'","'continue'","'do'","'else'","'false'","'float'","'func'","'if'","'int'","'string'","'true'","'var'","'while'","'{'","'|='","'||'","'}'","L_Ident","L_charac","L_doubl","L_integ","L_quoted","%eof"]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x15\x00\x00\x00\xc0\x00\x00\x00\xff\xff\xff\xff\x0c\x00\x00\x00\xd0\xff\xff\xff\x00\x00\x00\x00\xea\xff\xff\xff\xd6\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x00\x00\x2f\x00\x00\x00\xfa\xff\xff\xff\xfa\xff\xff\xff\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x1a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5a\x04\x00\x00\x76\x00\x00\x00\x00\x00\x00\x00\x25\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x12\x00\x00\x00\x0c\x00\x00\x00\xff\xff\xff\xff\x2f\x00\x00\x00\xe2\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x00\x00\x00\x1c\x00\x00\x00\x41\x01\x00\x00\x00\x00\x00\x00\xf7\xff\xff\xff\x3b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x4a\x00\x00\x00\x2a\x00\x00\x00\x67\x00\x00\x00\x98\x00\x00\x00\x3e\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x49\x00\x00\x00\x49\x00\x00\x00\x3c\x01\x00\x00\x6d\x00\x00\x00\x99\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x78\x00\x00\x00\x98\x00\x00\x00\x00\x00\x00\x00\x70\x00\x00\x00\xff\xff\xff\xff\x93\x00\x00\x00\xff\xff\xff\xff\x85\x00\x00\x00\x00\x00\x00\x00\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\xff\xff\xff\x9f\x00\x00\x00\xa9\x00\x00\x00\xff\xff\xff\xff\xac\x00\x00\x00\x00\x00\x00\x00\x09\x00\x00\x00\xb6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\x12\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc8\x00\x00\x00\x00\x00\x00\x00\x7c\x00\x00\x00\x7c\x00\x00\x00\x7c\x00\x00\x00\x7c\x00\x00\x00\x7c\x00\x00\x00\x76\x00\x00\x00\x76\x00\x00\x00\x7c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x56\x04\x00\x00\xf8\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf6\xff\xff\xff\xc6\x00\x00\x00\x13\x00\x00\x00\xcb\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x1b\x00\x00\x00\xc3\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb3\x00\x00\x00\x00\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb0\x00\x00\x00\xff\xff\xff\xff\xeb\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd3\x00\x00\x00\xb0\x00\x00\x00\xb1\x00\x00\x00\x00\x00\x00\x00\xff\xff\xff\xff\xf0\x00\x00\x00\xe2\x00\x00\x00\xc7\x00\x00\x00\x83\x00\x00\x00\xc0\x00\x00\x00\xc0\x00\x00\x00\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xff\xff\xff\xff\x00\x00\x00\x00\xcd\x00\x00\x00\xff\xff\xff\xff\x00\x00\x00\x00\x1d\x00\x00\x00\xe0\x00\x00\x00\x00\x00\x00\x00\xb0\x00\x00\x00\xd7\x00\x00\x00\xd8\x00\x00\x00\xdc\x00\x00\x00\x00\x00\x00\x00\xb0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\xf9\x00\x00\x00\xde\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x80\x00\x00\x00\xdf\x00\x00\x00\xc0\x01\x00\x00\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5c\x00\x00\x00\x4a\x04\x00\x00\x96\x00\x00\x00\xbd\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xde\x02\x00\x00\x57\x01\x00\x00\xda\x01\x00\x00\x30\x04\x00\x00\x11\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xed\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe8\x00\x00\x00\x00\x00\x00\x00\x0b\x00\x00\x00\x00\x00\x00\x00\x54\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x44\x00\x00\x00\x17\x01\x00\x00\x0d\x00\x00\x00\x7d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x11\x00\x00\x00\xf4\x01\x00\x00\x00\x00\x00\x00\x0e\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x28\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x72\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc8\x03\x00\x00\xe2\x03\x00\x00\xfc\x03\x00\x00\x16\x04\x00\x00\xf8\x02\x00\x00\x94\x03\x00\x00\xae\x03\x00\x00\x12\x03\x00\x00\x2c\x03\x00\x00\x46\x03\x00\x00\x60\x03\x00\x00\x7a\x03\x00\x00\xc4\x02\x00\x00\xaa\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x71\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa2\x00\x00\x00\x5c\x02\x00\x00\x1b\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbc\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x76\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x01\x00\x00\x00\x00\x00\x00\x03\x01\x00\x00\x0c\x01\x00\x00\x90\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa6\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc5\x00\x00\x00\x9a\x00\x00\x00\x05\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xca\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x27\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xbd\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfb\xff\xff\xff\xbf\xff\xff\xff\x00\x00\x00\x00\xca\xff\xff\xff\xc8\xff\xff\xff\xc5\xff\xff\xff\xc2\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbf\xff\xff\xff\xd7\xff\xff\xff\xd5\xff\xff\xff\xd8\xff\xff\xff\xd6\xff\xff\xff\xd4\xff\xff\xff\x00\x00\x00\x00\xf4\xff\xff\xff\xf2\xff\xff\xff\xf0\xff\xff\xff\xee\xff\xff\xff\xe7\xff\xff\xff\xe4\xff\xff\xff\xe0\xff\xff\xff\xde\xff\xff\xff\xdb\xff\xff\xff\xd9\xff\xff\xff\xd2\xff\xff\xff\xd1\xff\xff\xff\xda\xff\xff\xff\xcf\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf5\xff\xff\xff\xf6\xff\xff\xff\xfa\xff\xff\xff\xf9\xff\xff\xff\xf8\xff\xff\xff\xf7\xff\xff\xff\xbf\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xa1\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x9d\xff\xff\xff\x9e\xff\xff\xff\x8f\xff\xff\xff\x8e\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa7\xff\xff\xff\x00\x00\x00\x00\xbe\xff\xff\xff\xbd\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbc\xff\xff\xff\xa5\xff\xff\xff\x00\x00\x00\x00\xa7\xff\xff\xff\xa4\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9f\xff\xff\xff\x00\x00\x00\x00\x91\xff\xff\xff\x96\xff\xff\xff\x95\xff\xff\xff\x93\xff\xff\xff\x94\xff\xff\xff\x9b\xff\xff\xff\x97\xff\xff\xff\x92\xff\xff\xff\x90\xff\xff\xff\xa0\xff\xff\xff\xcd\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdd\xff\xff\xff\x00\x00\x00\x00\xcf\xff\xff\xff\xdc\xff\xff\xff\xef\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc6\xff\xff\xff\xc7\xff\xff\xff\xc9\xff\xff\xff\x00\x00\x00\x00\xc4\xff\xff\xff\xc3\xff\xff\xff\xc1\xff\xff\xff\xf3\xff\xff\xff\xf1\xff\xff\xff\xe8\xff\xff\xff\xe9\xff\xff\xff\xed\xff\xff\xff\xea\xff\xff\xff\xeb\xff\xff\xff\xe5\xff\xff\xff\xe6\xff\xff\xff\xec\xff\xff\xff\xe2\xff\xff\xff\xe3\xff\xff\xff\xe1\xff\xff\xff\xdf\xff\xff\xff\xd0\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x98\xff\xff\xff\x99\xff\xff\xff\xcc\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9a\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xa6\xff\xff\xff\xa8\xff\xff\xff\xb9\xff\xff\xff\xba\xff\xff\xff\xb3\xff\xff\xff\xb2\xff\xff\xff\xb1\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb0\xff\xff\xff\xaf\xff\xff\xff\xae\xff\xff\xff\xad\xff\xff\xff\xac\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xb4\xff\xff\xff\xa9\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xb8\xff\xff\xff\x00\x00\x00\x00\x9a\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9c\xff\xff\xff\xce\xff\xff\xff\xcd\xff\xff\xff\xc0\xff\xff\xff\x00\x00\x00\x00\xcd\xff\xff\xff\xcb\xff\xff\xff\x00\x00\x00\x00\x8d\xff\xff\xff\x8b\xff\xff\xff\x00\x00\x00\x00\xb9\xff\xff\xff\x00\x00\x00\x00\xb5\xff\xff\xff\xaa\xff\xff\xff\x00\x00\x00\x00\xab\xff\xff\xff\xbb\xff\xff\xff\xb7\xff\xff\xff\xb6\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd3\xff\xff\xff\x8a\xff\xff\xff\x8c\xff\xff\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\xff\xff\x02\x00\x00\x00\x08\x00\x00\x00\x33\x00\x00\x00\x05\x00\x00\x00\x0f\x00\x00\x00\x1c\x00\x00\x00\x08\x00\x00\x00\x1d\x00\x00\x00\x0a\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x0d\x00\x00\x00\x00\x00\x00\x00\x38\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\x09\x00\x00\x00\x09\x00\x00\x00\x08\x00\x00\x00\x1d\x00\x00\x00\x0a\x00\x00\x00\x05\x00\x00\x00\x36\x00\x00\x00\x0d\x00\x00\x00\x08\x00\x00\x00\x1c\x00\x00\x00\x0a\x00\x00\x00\x11\x00\x00\x00\x1c\x00\x00\x00\x0d\x00\x00\x00\x06\x00\x00\x00\x36\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x09\x00\x00\x00\x26\x00\x00\x00\x09\x00\x00\x00\x31\x00\x00\x00\x15\x00\x00\x00\x31\x00\x00\x00\x1f\x00\x00\x00\x2c\x00\x00\x00\x1f\x00\x00\x00\x33\x00\x00\x00\x1c\x00\x00\x00\x38\x00\x00\x00\x1f\x00\x00\x00\x15\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x08\x00\x00\x00\x26\x00\x00\x00\x0a\x00\x00\x00\x31\x00\x00\x00\x31\x00\x00\x00\x0d\x00\x00\x00\x28\x00\x00\x00\x2c\x00\x00\x00\x33\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\x2d\x00\x00\x00\x1e\x00\x00\x00\x31\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x08\x00\x00\x00\x1c\x00\x00\x00\x31\x00\x00\x00\x0d\x00\x00\x00\x31\x00\x00\x00\x0d\x00\x00\x00\x15\x00\x00\x00\x11\x00\x00\x00\x08\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\x26\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x2c\x00\x00\x00\x00\x00\x00\x00\x33\x00\x00\x00\x1c\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x31\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x13\x00\x00\x00\x38\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x1c\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x38\x00\x00\x00\x23\x00\x00\x00\x24\x00\x00\x00\x25\x00\x00\x00\x04\x00\x00\x00\x27\x00\x00\x00\x33\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x00\x00\x2b\x00\x00\x00\x0a\x00\x00\x00\x13\x00\x00\x00\x15\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x0c\x00\x00\x00\x13\x00\x00\x00\x1c\x00\x00\x00\x08\x00\x00\x00\x10\x00\x00\x00\x0a\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x0d\x00\x00\x00\x23\x00\x00\x00\x24\x00\x00\x00\x25\x00\x00\x00\x11\x00\x00\x00\x27\x00\x00\x00\x00\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x00\x00\x2b\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x08\x00\x00\x00\x08\x00\x00\x00\x0a\x00\x00\x00\x33\x00\x00\x00\x21\x00\x00\x00\x0d\x00\x00\x00\x23\x00\x00\x00\x24\x00\x00\x00\x15\x00\x00\x00\x11\x00\x00\x00\x32\x00\x00\x00\x28\x00\x00\x00\x29\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x2e\x00\x00\x00\x15\x00\x00\x00\x32\x00\x00\x00\x33\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x21\x00\x00\x00\x0a\x00\x00\x00\x23\x00\x00\x00\x24\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x09\x00\x00\x00\x28\x00\x00\x00\x29\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x08\x00\x00\x00\x1d\x00\x00\x00\x0a\x00\x00\x00\x33\x00\x00\x00\x1c\x00\x00\x00\x0d\x00\x00\x00\x06\x00\x00\x00\x09\x00\x00\x00\x20\x00\x00\x00\x11\x00\x00\x00\x22\x00\x00\x00\x08\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x27\x00\x00\x00\x15\x00\x00\x00\x18\x00\x00\x00\x2a\x00\x00\x00\x2b\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x00\x00\x00\x00\x2d\x00\x00\x00\x21\x00\x00\x00\x31\x00\x00\x00\x23\x00\x00\x00\x24\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x00\x00\x00\x00\x29\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x1d\x00\x00\x00\x0f\x00\x00\x00\x13\x00\x00\x00\x33\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x09\x00\x00\x00\x33\x00\x00\x00\x13\x00\x00\x00\x2f\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x2d\x00\x00\x00\x25\x00\x00\x00\x27\x00\x00\x00\x2f\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x00\x00\x2b\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x31\x00\x00\x00\x15\x00\x00\x00\x27\x00\x00\x00\x32\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x00\x00\x2b\x00\x00\x00\x03\x00\x00\x00\x28\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x21\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x23\x00\x00\x00\xff\xff\xff\xff\x27\x00\x00\x00\xff\xff\xff\xff\x29\x00\x00\x00\x2a\x00\x00\x00\x2b\x00\x00\x00\x23\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x27\x00\x00\x00\xff\xff\xff\xff\x29\x00\x00\x00\x2a\x00\x00\x00\x2b\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x00\x00\xff\xff\xff\xff\x07\x00\x00\x00\xff\xff\xff\xff\x23\x00\x00\x00\xff\xff\xff\xff\x0b\x00\x00\x00\xff\xff\xff\xff\x27\x00\x00\x00\x0e\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x00\x00\x2b\x00\x00\x00\x12\x00\x00\x00\x18\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x1c\x00\x00\x00\x18\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x00\x00\xff\xff\xff\xff\x22\x00\x00\x00\xff\xff\xff\xff\x1f\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x27\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x2a\x00\x00\x00\x2b\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x03\x00\x00\x00\xff\xff\xff\xff\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x10\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x16\x00\x00\x00\x17\x00\x00\x00\xff\xff\xff\xff\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x20\x00\x00\x00\xff\xff\xff\xff\x22\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x27\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x2a\x00\x00\x00\x2b\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x00\x00\x26\x00\x00\x00\x0d\x00\x00\x00\x06\x00\x00\x00\x27\x00\x00\x00\xb5\x00\x00\x00\x61\x00\x00\x00\x28\x00\x00\x00\xa8\x00\x00\x00\x0e\x00\x00\x00\x5e\x00\x00\x00\x44\x00\x00\x00\x0f\x00\x00\x00\x44\x00\x00\x00\xff\xff\xff\xff\x29\x00\x00\x00\x10\x00\x00\x00\x44\x00\x00\x00\x8b\x00\x00\x00\xb1\x00\x00\x00\x0d\x00\x00\x00\xb6\x00\x00\x00\x0e\x00\x00\x00\x27\x00\x00\x00\x2f\x00\x00\x00\x0f\x00\x00\x00\x28\x00\x00\x00\x2a\x00\x00\x00\x0e\x00\x00\x00\x10\x00\x00\x00\x61\x00\x00\x00\x0f\x00\x00\x00\x74\x00\x00\x00\x2f\x00\x00\x00\x29\x00\x00\x00\x10\x00\x00\x00\xb0\x00\x00\x00\x2b\x00\x00\x00\xc8\x00\x00\x00\x75\x00\x00\x00\xb3\x00\x00\x00\x75\x00\x00\x00\x4e\x00\x00\x00\x2c\x00\x00\x00\x45\x00\x00\x00\x06\x00\x00\x00\x2a\x00\x00\x00\xff\xff\xff\xff\x96\x00\x00\x00\x5d\x00\x00\x00\x06\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x28\x00\x00\x00\x2b\x00\x00\x00\x0e\x00\x00\x00\x75\x00\x00\x00\x75\x00\x00\x00\x0f\x00\x00\x00\x43\x00\x00\x00\x2c\x00\x00\x00\x06\x00\x00\x00\x10\x00\x00\x00\x06\x00\x00\x00\x44\x00\x00\x00\x68\x00\x00\x00\x75\x00\x00\x00\x06\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x5e\x00\x00\x00\x2a\x00\x00\x00\x75\x00\x00\x00\x7a\x00\x00\x00\x75\x00\x00\x00\x5f\x00\x00\x00\x52\x00\x00\x00\x7b\x00\x00\x00\x50\x00\x00\x00\x60\x00\x00\x00\x30\x00\x00\x00\x2b\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x2c\x00\x00\x00\x06\x00\x00\x00\x06\x00\x00\x00\x61\x00\x00\x00\x47\x00\x00\x00\x41\x00\x00\x00\x75\x00\x00\x00\x06\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\xff\xff\xff\xff\x32\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x30\x00\x00\x00\x4e\x00\x00\x00\x48\x00\x00\x00\x78\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\xff\xff\xff\xff\x33\x00\x00\x00\x49\x00\x00\x00\x4a\x00\x00\x00\x69\x00\x00\x00\x4b\x00\x00\x00\x06\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x6a\x00\x00\x00\x31\x00\x00\x00\x9b\x00\x00\x00\x32\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x6d\x00\x00\x00\x6b\x00\x00\x00\x48\x00\x00\x00\x9a\xff\xff\xff\x6e\x00\x00\x00\x9a\xff\xff\xff\xab\x00\x00\x00\xac\x00\x00\x00\x9a\xff\xff\xff\x33\x00\x00\x00\x97\x00\x00\x00\x4a\x00\x00\x00\x9a\xff\xff\xff\x4b\x00\x00\x00\x06\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x3f\x00\x00\x00\x40\x00\x00\x00\x41\x00\x00\x00\x9b\x00\x00\x00\x9c\x00\x00\x00\x9d\x00\x00\x00\x0d\x00\x00\x00\x9a\x00\x00\x00\x0e\x00\x00\x00\x06\x00\x00\x00\x9a\xff\xff\xff\x0f\x00\x00\x00\x9a\xff\xff\xff\x9a\xff\xff\xff\x95\x00\x00\x00\x10\x00\x00\x00\x99\x00\x00\x00\x9a\xff\xff\xff\x9a\xff\xff\xff\x76\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x9a\xff\xff\xff\x9a\xff\xff\xff\x9a\xff\xff\xff\x93\x00\x00\x00\x8f\x00\x00\x00\x9a\xff\xff\xff\x9a\xff\xff\xff\xc4\x00\x00\x00\xac\x00\x00\x00\x39\x00\x00\x00\x9f\x00\x00\x00\x3a\x00\x00\x00\x3b\x00\x00\x00\x06\x00\x00\x00\x8e\x00\x00\x00\x7c\x00\x00\x00\x43\x00\x00\x00\x3c\x00\x00\x00\xa9\x00\x00\x00\x9c\x00\x00\x00\x9d\x00\x00\x00\x4d\x00\x00\x00\x3e\x00\x00\x00\x3f\x00\x00\x00\x0d\x00\x00\x00\x8c\x00\x00\x00\x0e\x00\x00\x00\x06\x00\x00\x00\xa1\x00\x00\x00\x0f\x00\x00\x00\x74\x00\x00\x00\xb4\x00\x00\x00\xa2\x00\x00\x00\x10\x00\x00\x00\xa3\x00\x00\x00\xb2\x00\x00\x00\x75\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\xa4\x00\x00\x00\xaf\x00\x00\x00\xab\x00\x00\x00\xa5\x00\x00\x00\xa6\x00\x00\x00\xc0\x00\x00\x00\x9c\x00\x00\x00\x9d\x00\x00\x00\x30\x00\x00\x00\xae\x00\x00\x00\x39\x00\x00\x00\x75\x00\x00\x00\x3a\x00\x00\x00\x3b\x00\x00\x00\xc5\x00\x00\x00\x9c\x00\x00\x00\x9d\x00\x00\x00\x30\x00\x00\x00\x3c\x00\x00\x00\xc2\x00\x00\x00\x9c\x00\x00\x00\x9d\x00\x00\x00\x3d\x00\x00\x00\x3e\x00\x00\x00\x3f\x00\x00\x00\xc2\x00\x00\x00\xbe\x00\x00\x00\x31\x00\x00\x00\x06\x00\x00\x00\x32\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\xbf\x00\x00\x00\x06\x00\x00\x00\x31\x00\x00\x00\xb8\x00\x00\x00\x32\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x33\x00\x00\x00\x30\x00\x00\x00\xae\x00\x00\x00\xc7\x00\x00\x00\x34\x00\x00\x00\x3f\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x33\x00\x00\x00\x30\x00\x00\x00\x75\x00\x00\x00\xcb\x00\x00\x00\x50\x00\x00\x00\xca\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x61\x00\x00\x00\x52\x00\x00\x00\x31\x00\x00\x00\x46\x00\x00\x00\x32\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\xb6\x00\x00\x00\xa6\x00\x00\x00\x31\x00\x00\x00\xbc\x00\x00\x00\x32\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x33\x00\x00\x00\x30\x00\x00\x00\xc3\x00\x00\x00\x00\x00\x00\x00\xbb\x00\x00\x00\x00\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x33\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xba\x00\x00\x00\x00\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x31\x00\x00\x00\x00\x00\x00\x00\x32\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9f\x00\x00\x00\x00\x00\x00\x00\x54\x00\x00\x00\x00\x00\x00\x00\x33\x00\x00\x00\x00\x00\x00\x00\x55\x00\x00\x00\x00\x00\x00\x00\xcb\x00\x00\x00\x56\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x57\x00\x00\x00\xa0\x00\x00\x00\x58\x00\x00\x00\x59\x00\x00\x00\x06\x00\x00\x00\xa1\x00\x00\x00\x5a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa2\x00\x00\x00\x00\x00\x00\x00\xa3\x00\x00\x00\x00\x00\x00\x00\x5b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa4\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa5\x00\x00\x00\xa6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x65\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x5c\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x8f\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x90\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x8f\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\xb8\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x8f\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\xc8\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x63\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x64\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x95\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x93\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x91\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x8c\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\xa8\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\xbf\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\xb9\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x7c\x00\x00\x00\x18\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7d\x00\x00\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x66\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x85\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x82\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x81\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7f\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7e\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x84\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x83\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x89\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x88\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x87\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x86\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x62\x00\x00\x00\x1f\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x23\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x06\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x77\x00\x00\x00\x20\x00\x00\x00\x21\x00\x00\x00\x22\x00\x00\x00\x6c\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6f\x00\x00\x00\x70\x00\x00\x00\x00\x00\x00\x00\x71\x00\x00\x00\x72\x00\x00\x00\x73\x00\x00\x00\xa2\x00\x00\x00\x00\x00\x00\x00\xa3\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa4\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa5\x00\x00\x00\xa6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (4, 117) [
        (4 , happyReduce_4),
        (5 , happyReduce_5),
        (6 , happyReduce_6),
        (7 , happyReduce_7),
        (8 , happyReduce_8),
        (9 , happyReduce_9),
        (10 , happyReduce_10),
        (11 , happyReduce_11),
        (12 , happyReduce_12),
        (13 , happyReduce_13),
        (14 , happyReduce_14),
        (15 , happyReduce_15),
        (16 , happyReduce_16),
        (17 , happyReduce_17),
        (18 , happyReduce_18),
        (19 , happyReduce_19),
        (20 , happyReduce_20),
        (21 , happyReduce_21),
        (22 , happyReduce_22),
        (23 , happyReduce_23),
        (24 , happyReduce_24),
        (25 , happyReduce_25),
        (26 , happyReduce_26),
        (27 , happyReduce_27),
        (28 , happyReduce_28),
        (29 , happyReduce_29),
        (30 , happyReduce_30),
        (31 , happyReduce_31),
        (32 , happyReduce_32),
        (33 , happyReduce_33),
        (34 , happyReduce_34),
        (35 , happyReduce_35),
        (36 , happyReduce_36),
        (37 , happyReduce_37),
        (38 , happyReduce_38),
        (39 , happyReduce_39),
        (40 , happyReduce_40),
        (41 , happyReduce_41),
        (42 , happyReduce_42),
        (43 , happyReduce_43),
        (44 , happyReduce_44),
        (45 , happyReduce_45),
        (46 , happyReduce_46),
        (47 , happyReduce_47),
        (48 , happyReduce_48),
        (49 , happyReduce_49),
        (50 , happyReduce_50),
        (51 , happyReduce_51),
        (52 , happyReduce_52),
        (53 , happyReduce_53),
        (54 , happyReduce_54),
        (55 , happyReduce_55),
        (56 , happyReduce_56),
        (57 , happyReduce_57),
        (58 , happyReduce_58),
        (59 , happyReduce_59),
        (60 , happyReduce_60),
        (61 , happyReduce_61),
        (62 , happyReduce_62),
        (63 , happyReduce_63),
        (64 , happyReduce_64),
        (65 , happyReduce_65),
        (66 , happyReduce_66),
        (67 , happyReduce_67),
        (68 , happyReduce_68),
        (69 , happyReduce_69),
        (70 , happyReduce_70),
        (71 , happyReduce_71),
        (72 , happyReduce_72),
        (73 , happyReduce_73),
        (74 , happyReduce_74),
        (75 , happyReduce_75),
        (76 , happyReduce_76),
        (77 , happyReduce_77),
        (78 , happyReduce_78),
        (79 , happyReduce_79),
        (80 , happyReduce_80),
        (81 , happyReduce_81),
        (82 , happyReduce_82),
        (83 , happyReduce_83),
        (84 , happyReduce_84),
        (85 , happyReduce_85),
        (86 , happyReduce_86),
        (87 , happyReduce_87),
        (88 , happyReduce_88),
        (89 , happyReduce_89),
        (90 , happyReduce_90),
        (91 , happyReduce_91),
        (92 , happyReduce_92),
        (93 , happyReduce_93),
        (94 , happyReduce_94),
        (95 , happyReduce_95),
        (96 , happyReduce_96),
        (97 , happyReduce_97),
        (98 , happyReduce_98),
        (99 , happyReduce_99),
        (100 , happyReduce_100),
        (101 , happyReduce_101),
        (102 , happyReduce_102),
        (103 , happyReduce_103),
        (104 , happyReduce_104),
        (105 , happyReduce_105),
        (106 , happyReduce_106),
        (107 , happyReduce_107),
        (108 , happyReduce_108),
        (109 , happyReduce_109),
        (110 , happyReduce_110),
        (111 , happyReduce_111),
        (112 , happyReduce_112),
        (113 , happyReduce_113),
        (114 , happyReduce_114),
        (115 , happyReduce_115),
        (116 , happyReduce_116),
        (117 , happyReduce_117)
        ]

happyRuleArr :: HappyAddr
happyRuleArr = HappyA# "\x00\x00\x00\x00\x01\x00\x00\x00\x01\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x03\x00\x00\x00\x01\x00\x00\x00\x04\x00\x00\x00\x01\x00\x00\x00\x05\x00\x00\x00\x01\x00\x00\x00\x05\x00\x00\x00\x01\x00\x00\x00\x06\x00\x00\x00\x01\x00\x00\x00\x06\x00\x00\x00\x03\x00\x00\x00\x07\x00\x00\x00\x01\x00\x00\x00\x07\x00\x00\x00\x03\x00\x00\x00\x08\x00\x00\x00\x01\x00\x00\x00\x08\x00\x00\x00\x02\x00\x00\x00\x09\x00\x00\x00\x01\x00\x00\x00\x09\x00\x00\x00\x03\x00\x00\x00\x09\x00\x00\x00\x03\x00\x00\x00\x09\x00\x00\x00\x03\x00\x00\x00\x09\x00\x00\x00\x03\x00\x00\x00\x09\x00\x00\x00\x03\x00\x00\x00\x09\x00\x00\x00\x03\x00\x00\x00\x0a\x00\x00\x00\x01\x00\x00\x00\x0a\x00\x00\x00\x03\x00\x00\x00\x0a\x00\x00\x00\x03\x00\x00\x00\x0b\x00\x00\x00\x01\x00\x00\x00\x0b\x00\x00\x00\x03\x00\x00\x00\x0b\x00\x00\x00\x03\x00\x00\x00\x0b\x00\x00\x00\x03\x00\x00\x00\x0c\x00\x00\x00\x01\x00\x00\x00\x0c\x00\x00\x00\x03\x00\x00\x00\x0d\x00\x00\x00\x01\x00\x00\x00\x0d\x00\x00\x00\x02\x00\x00\x00\x0d\x00\x00\x00\x02\x00\x00\x00\x0e\x00\x00\x00\x01\x00\x00\x00\x0e\x00\x00\x00\x01\x00\x00\x00\x0f\x00\x00\x00\x01\x00\x00\x00\x0f\x00\x00\x00\x01\x00\x00\x00\x0f\x00\x00\x00\x01\x00\x00\x00\x0f\x00\x00\x00\x01\x00\x00\x00\x0f\x00\x00\x00\x01\x00\x00\x00\x0f\x00\x00\x00\x01\x00\x00\x00\x0f\x00\x00\x00\x07\x00\x00\x00\x10\x00\x00\x00\x01\x00\x00\x00\x11\x00\x00\x00\x01\x00\x00\x00\x12\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x01\x00\x00\x00\x13\x00\x00\x00\x04\x00\x00\x00\x14\x00\x00\x00\x00\x00\x00\x00\x14\x00\x00\x00\x01\x00\x00\x00\x14\x00\x00\x00\x03\x00\x00\x00\x15\x00\x00\x00\x01\x00\x00\x00\x15\x00\x00\x00\x02\x00\x00\x00\x16\x00\x00\x00\x01\x00\x00\x00\x16\x00\x00\x00\x02\x00\x00\x00\x16\x00\x00\x00\x02\x00\x00\x00\x17\x00\x00\x00\x01\x00\x00\x00\x17\x00\x00\x00\x02\x00\x00\x00\x17\x00\x00\x00\x02\x00\x00\x00\x17\x00\x00\x00\x01\x00\x00\x00\x18\x00\x00\x00\x03\x00\x00\x00\x19\x00\x00\x00\x04\x00\x00\x00\x19\x00\x00\x00\x01\x00\x00\x00\x1a\x00\x00\x00\x01\x00\x00\x00\x1b\x00\x00\x00\x00\x00\x00\x00\x1b\x00\x00\x00\x02\x00\x00\x00\x1c\x00\x00\x00\x06\x00\x00\x00\x1c\x00\x00\x00\x03\x00\x00\x00\x1d\x00\x00\x00\x00\x00\x00\x00\x1d\x00\x00\x00\x01\x00\x00\x00\x1d\x00\x00\x00\x03\x00\x00\x00\x1e\x00\x00\x00\x03\x00\x00\x00\x1f\x00\x00\x00\x04\x00\x00\x00\x1f\x00\x00\x00\x03\x00\x00\x00\x1f\x00\x00\x00\x02\x00\x00\x00\x20\x00\x00\x00\x01\x00\x00\x00\x20\x00\x00\x00\x01\x00\x00\x00\x21\x00\x00\x00\x01\x00\x00\x00\x21\x00\x00\x00\x01\x00\x00\x00\x21\x00\x00\x00\x01\x00\x00\x00\x21\x00\x00\x00\x01\x00\x00\x00\x21\x00\x00\x00\x01\x00\x00\x00\x22\x00\x00\x00\x04\x00\x00\x00\x22\x00\x00\x00\x03\x00\x00\x00\x22\x00\x00\x00\x02\x00\x00\x00\x23\x00\x00\x00\x03\x00\x00\x00\x24\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x02\x00\x00\x00\x25\x00\x00\x00\x01\x00\x00\x00\x25\x00\x00\x00\x01\x00\x00\x00\x26\x00\x00\x00\x00\x00\x00\x00\x26\x00\x00\x00\x02\x00\x00\x00\x27\x00\x00\x00\x01\x00\x00\x00\x27\x00\x00\x00\x02\x00\x00\x00\x27\x00\x00\x00\x02\x00\x00\x00\x27\x00\x00\x00\x01\x00\x00\x00\x27\x00\x00\x00\x01\x00\x00\x00\x27\x00\x00\x00\x04\x00\x00\x00\x27\x00\x00\x00\x02\x00\x00\x00\x27\x00\x00\x00\x03\x00\x00\x00\x27\x00\x00\x00\x03\x00\x00\x00\x27\x00\x00\x00\x03\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x28\x00\x00\x00\x01\x00\x00\x00\x29\x00\x00\x00\x01\x00\x00\x00\x29\x00\x00\x00\x01\x00\x00\x00\x2a\x00\x00\x00\x05\x00\x00\x00\x2a\x00\x00\x00\x07\x00\x00\x00\x2b\x00\x00\x00\x05\x00\x00\x00\x2b\x00\x00\x00\x07\x00\x00\x00"#

happyCatchStates :: [Happy_Prelude.Int]
happyCatchStates = []

happy_n_terms = 57 :: Happy_Prelude.Int
happy_n_nonterms = 44 :: Happy_Prelude.Int

happy_n_starts = 4 :: Happy_Prelude.Int

happyReduce_4 = happySpecReduce_1  0# happyReduction_4
happyReduction_4 happy_x_1
         =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
        happyIn8
                 (AbsGrammatica.Ident happy_var_1
        )}

happyReduce_5 = happySpecReduce_1  1# happyReduction_5
happyReduction_5 happy_x_1
         =  case happyOutTok happy_x_1 of { (PT _ (TC happy_var_1)) -> 
        happyIn9
                 ((read happy_var_1) :: Char
        )}

happyReduce_6 = happySpecReduce_1  2# happyReduction_6
happyReduction_6 happy_x_1
         =  case happyOutTok happy_x_1 of { (PT _ (TD happy_var_1)) -> 
        happyIn10
                 ((read happy_var_1) :: Double
        )}

happyReduce_7 = happySpecReduce_1  3# happyReduction_7
happyReduction_7 happy_x_1
         =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
        happyIn11
                 ((read happy_var_1) :: Integer
        )}

happyReduce_8 = happySpecReduce_1  4# happyReduction_8
happyReduction_8 happy_x_1
         =  case happyOutTok happy_x_1 of { (PT _ (TL happy_var_1)) -> 
        happyIn12
                 (happy_var_1
        )}

happyReduce_9 = happySpecReduce_1  5# happyReduction_9
happyReduction_9 happy_x_1
         =  happyIn13
                 (AbsGrammatica.Boolean_true
        )

happyReduce_10 = happySpecReduce_1  5# happyReduction_10
happyReduction_10 happy_x_1
         =  happyIn13
                 (AbsGrammatica.Boolean_false
        )

happyReduce_11 = happySpecReduce_1  6# happyReduction_11
happyReduction_11 happy_x_1
         =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
        happyIn14
                 (happy_var_1
        )}

happyReduce_12 = happySpecReduce_3  6# happyReduction_12
happyReduction_12 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
        case happyOut15 happy_x_3 of { (HappyWrap15 happy_var_3) -> 
        happyIn14
                 (AbsGrammatica.Or happy_var_1 happy_var_3
        )}}

happyReduce_13 = happySpecReduce_1  7# happyReduction_13
happyReduction_13 happy_x_1
         =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
        happyIn15
                 (happy_var_1
        )}

happyReduce_14 = happySpecReduce_3  7# happyReduction_14
happyReduction_14 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
        case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
        happyIn15
                 (AbsGrammatica.And happy_var_1 happy_var_3
        )}}

happyReduce_15 = happySpecReduce_1  8# happyReduction_15
happyReduction_15 happy_x_1
         =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
        happyIn16
                 (happy_var_1
        )}

happyReduce_16 = happySpecReduce_2  8# happyReduction_16
happyReduction_16 happy_x_2
        happy_x_1
         =  case happyOut17 happy_x_2 of { (HappyWrap17 happy_var_2) -> 
        happyIn16
                 (AbsGrammatica.Not happy_var_2
        )}

happyReduce_17 = happySpecReduce_1  9# happyReduction_17
happyReduction_17 happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        happyIn17
                 (happy_var_1
        )}

happyReduce_18 = happySpecReduce_3  9# happyReduction_18
happyReduction_18 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
        happyIn17
                 (AbsGrammatica.Eq happy_var_1 happy_var_3
        )}}

happyReduce_19 = happySpecReduce_3  9# happyReduction_19
happyReduction_19 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
        happyIn17
                 (AbsGrammatica.Neq happy_var_1 happy_var_3
        )}}

happyReduce_20 = happySpecReduce_3  9# happyReduction_20
happyReduction_20 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
        happyIn17
                 (AbsGrammatica.Lt happy_var_1 happy_var_3
        )}}

happyReduce_21 = happySpecReduce_3  9# happyReduction_21
happyReduction_21 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
        happyIn17
                 (AbsGrammatica.LtE happy_var_1 happy_var_3
        )}}

happyReduce_22 = happySpecReduce_3  9# happyReduction_22
happyReduction_22 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
        happyIn17
                 (AbsGrammatica.Gt happy_var_1 happy_var_3
        )}}

happyReduce_23 = happySpecReduce_3  9# happyReduction_23
happyReduction_23 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
        happyIn17
                 (AbsGrammatica.GtE happy_var_1 happy_var_3
        )}}

happyReduce_24 = happySpecReduce_1  10# happyReduction_24
happyReduction_24 happy_x_1
         =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
        happyIn18
                 (happy_var_1
        )}

happyReduce_25 = happySpecReduce_3  10# happyReduction_25
happyReduction_25 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
        happyIn18
                 (AbsGrammatica.Add happy_var_1 happy_var_3
        )}}

happyReduce_26 = happySpecReduce_3  10# happyReduction_26
happyReduction_26 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
        case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
        happyIn18
                 (AbsGrammatica.Sub happy_var_1 happy_var_3
        )}}

happyReduce_27 = happySpecReduce_1  11# happyReduction_27
happyReduction_27 happy_x_1
         =  case happyOut20 happy_x_1 of { (HappyWrap20 happy_var_1) -> 
        happyIn19
                 (happy_var_1
        )}

happyReduce_28 = happySpecReduce_3  11# happyReduction_28
happyReduction_28 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
        case happyOut20 happy_x_3 of { (HappyWrap20 happy_var_3) -> 
        happyIn19
                 (AbsGrammatica.Mul happy_var_1 happy_var_3
        )}}

happyReduce_29 = happySpecReduce_3  11# happyReduction_29
happyReduction_29 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
        case happyOut20 happy_x_3 of { (HappyWrap20 happy_var_3) -> 
        happyIn19
                 (AbsGrammatica.Div happy_var_1 happy_var_3
        )}}

happyReduce_30 = happySpecReduce_3  11# happyReduction_30
happyReduction_30 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
        case happyOut20 happy_x_3 of { (HappyWrap20 happy_var_3) -> 
        happyIn19
                 (AbsGrammatica.Mod happy_var_1 happy_var_3
        )}}

happyReduce_31 = happySpecReduce_1  12# happyReduction_31
happyReduction_31 happy_x_1
         =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
        happyIn20
                 (happy_var_1
        )}

happyReduce_32 = happySpecReduce_3  12# happyReduction_32
happyReduction_32 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
        case happyOut20 happy_x_3 of { (HappyWrap20 happy_var_3) -> 
        happyIn20
                 (AbsGrammatica.Pow happy_var_1 happy_var_3
        )}}

happyReduce_33 = happySpecReduce_1  13# happyReduction_33
happyReduction_33 happy_x_1
         =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
        happyIn21
                 (happy_var_1
        )}

happyReduce_34 = happySpecReduce_2  13# happyReduction_34
happyReduction_34 happy_x_2
        happy_x_1
         =  case happyOut22 happy_x_2 of { (HappyWrap22 happy_var_2) -> 
        happyIn21
                 (AbsGrammatica.Neg happy_var_2
        )}

happyReduce_35 = happySpecReduce_2  13# happyReduction_35
happyReduction_35 happy_x_2
        happy_x_1
         =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
        happyIn21
                 (AbsGrammatica.Ref happy_var_2
        )}

happyReduce_36 = happySpecReduce_1  14# happyReduction_36
happyReduction_36 happy_x_1
         =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
        happyIn22
                 (happy_var_1
        )}

happyReduce_37 = happySpecReduce_1  14# happyReduction_37
happyReduction_37 happy_x_1
         =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
        happyIn22
                 (AbsGrammatica.FCall happy_var_1
        )}

happyReduce_38 = happySpecReduce_1  15# happyReduction_38
happyReduction_38 happy_x_1
         =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
        happyIn23
                 (happy_var_1
        )}

happyReduce_39 = happySpecReduce_1  15# happyReduction_39
happyReduction_39 happy_x_1
         =  case happyOut11 happy_x_1 of { (HappyWrap11 happy_var_1) -> 
        happyIn23
                 (AbsGrammatica.Int happy_var_1
        )}

happyReduce_40 = happySpecReduce_1  15# happyReduction_40
happyReduction_40 happy_x_1
         =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
        happyIn23
                 (AbsGrammatica.Char happy_var_1
        )}

happyReduce_41 = happySpecReduce_1  15# happyReduction_41
happyReduction_41 happy_x_1
         =  case happyOut12 happy_x_1 of { (HappyWrap12 happy_var_1) -> 
        happyIn23
                 (AbsGrammatica.String happy_var_1
        )}

happyReduce_42 = happySpecReduce_1  15# happyReduction_42
happyReduction_42 happy_x_1
         =  case happyOut10 happy_x_1 of { (HappyWrap10 happy_var_1) -> 
        happyIn23
                 (AbsGrammatica.Float happy_var_1
        )}

happyReduce_43 = happySpecReduce_1  15# happyReduction_43
happyReduction_43 happy_x_1
         =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
        happyIn23
                 (AbsGrammatica.Bool happy_var_1
        )}

happyReduce_44 = happyReduce 7# 15# happyReduction_44
happyReduction_44 (happy_x_7 `HappyStk`
        happy_x_6 `HappyStk`
        happy_x_5 `HappyStk`
        happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut11 happy_x_2 of { (HappyWrap11 happy_var_2) -> 
        case happyOut41 happy_x_4 of { (HappyWrap41 happy_var_4) -> 
        case happyOut28 happy_x_6 of { (HappyWrap28 happy_var_6) -> 
        happyIn23
                 (AbsGrammatica.GoArrayLit happy_var_2 happy_var_4 happy_var_6
        ) `HappyStk` happyRest}}}

happyReduce_45 = happySpecReduce_1  16# happyReduction_45
happyReduction_45 happy_x_1
         =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
        happyIn24
                 (happy_var_1
        )}

happyReduce_46 = happySpecReduce_1  17# happyReduction_46
happyReduction_46 happy_x_1
         =  case happyOut26 happy_x_1 of { (HappyWrap26 happy_var_1) -> 
        happyIn25
                 (happy_var_1
        )}

happyReduce_47 = happySpecReduce_3  18# happyReduction_47
happyReduction_47 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut14 happy_x_2 of { (HappyWrap14 happy_var_2) -> 
        happyIn26
                 (happy_var_2
        )}

happyReduce_48 = happySpecReduce_1  18# happyReduction_48
happyReduction_48 happy_x_1
         =  case happyOut29 happy_x_1 of { (HappyWrap29 happy_var_1) -> 
        happyIn26
                 (AbsGrammatica.Lexpr happy_var_1
        )}

happyReduce_49 = happyReduce 4# 19# happyReduction_49
happyReduction_49 (happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
        case happyOut28 happy_x_3 of { (HappyWrap28 happy_var_3) -> 
        happyIn27
                 (AbsGrammatica.Call happy_var_1 happy_var_3
        ) `HappyStk` happyRest}}

happyReduce_50 = happySpecReduce_0  20# happyReduction_50
happyReduction_50  =  happyIn28
                 ([]
        )

happyReduce_51 = happySpecReduce_1  20# happyReduction_51
happyReduction_51 happy_x_1
         =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
        happyIn28
                 ((:[]) happy_var_1
        )}

happyReduce_52 = happySpecReduce_3  20# happyReduction_52
happyReduction_52 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
        case happyOut28 happy_x_3 of { (HappyWrap28 happy_var_3) -> 
        happyIn28
                 ((:) happy_var_1 happy_var_3
        )}}

happyReduce_53 = happySpecReduce_1  21# happyReduction_53
happyReduction_53 happy_x_1
         =  case happyOut30 happy_x_1 of { (HappyWrap30 happy_var_1) -> 
        happyIn29
                 (happy_var_1
        )}

happyReduce_54 = happySpecReduce_2  21# happyReduction_54
happyReduction_54 happy_x_2
        happy_x_1
         =  case happyOut23 happy_x_2 of { (HappyWrap23 happy_var_2) -> 
        happyIn29
                 (AbsGrammatica.Deref happy_var_2
        )}

happyReduce_55 = happySpecReduce_1  22# happyReduction_55
happyReduction_55 happy_x_1
         =  case happyOut31 happy_x_1 of { (HappyWrap31 happy_var_1) -> 
        happyIn30
                 (happy_var_1
        )}

happyReduce_56 = happySpecReduce_2  22# happyReduction_56
happyReduction_56 happy_x_2
        happy_x_1
         =  case happyOut31 happy_x_2 of { (HappyWrap31 happy_var_2) -> 
        happyIn30
                 (AbsGrammatica.PreInc happy_var_2
        )}

happyReduce_57 = happySpecReduce_2  22# happyReduction_57
happyReduction_57 happy_x_2
        happy_x_1
         =  case happyOut31 happy_x_2 of { (HappyWrap31 happy_var_2) -> 
        happyIn30
                 (AbsGrammatica.PreDecr happy_var_2
        )}

happyReduce_58 = happySpecReduce_1  23# happyReduction_58
happyReduction_58 happy_x_1
         =  case happyOut32 happy_x_1 of { (HappyWrap32 happy_var_1) -> 
        happyIn31
                 (happy_var_1
        )}

happyReduce_59 = happySpecReduce_2  23# happyReduction_59
happyReduction_59 happy_x_2
        happy_x_1
         =  case happyOut32 happy_x_1 of { (HappyWrap32 happy_var_1) -> 
        happyIn31
                 (AbsGrammatica.PostInc happy_var_1
        )}

happyReduce_60 = happySpecReduce_2  23# happyReduction_60
happyReduction_60 happy_x_2
        happy_x_1
         =  case happyOut32 happy_x_1 of { (HappyWrap32 happy_var_1) -> 
        happyIn31
                 (AbsGrammatica.PostDecr happy_var_1
        )}

happyReduce_61 = happySpecReduce_1  23# happyReduction_61
happyReduction_61 happy_x_1
         =  case happyOut33 happy_x_1 of { (HappyWrap33 happy_var_1) -> 
        happyIn31
                 (AbsGrammatica.BasLExpr happy_var_1
        )}

happyReduce_62 = happySpecReduce_3  24# happyReduction_62
happyReduction_62 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
        happyIn32
                 (happy_var_2
        )}

happyReduce_63 = happyReduce 4# 25# happyReduction_63
happyReduction_63 (happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
        case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
        happyIn33
                 (AbsGrammatica.ArrayEl happy_var_1 happy_var_3
        ) `HappyStk` happyRest}}

happyReduce_64 = happySpecReduce_1  25# happyReduction_64
happyReduction_64 happy_x_1
         =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
        happyIn33
                 (AbsGrammatica.Id happy_var_1
        )}

happyReduce_65 = happySpecReduce_1  26# happyReduction_65
happyReduction_65 happy_x_1
         =  case happyOut35 happy_x_1 of { (HappyWrap35 happy_var_1) -> 
        happyIn34
                 (AbsGrammatica.Prog happy_var_1
        )}

happyReduce_66 = happySpecReduce_0  27# happyReduction_66
happyReduction_66  =  happyIn35
                 ([]
        )

happyReduce_67 = happySpecReduce_2  27# happyReduction_67
happyReduction_67 happy_x_2
        happy_x_1
         =  case happyOut36 happy_x_1 of { (HappyWrap36 happy_var_1) -> 
        case happyOut35 happy_x_2 of { (HappyWrap35 happy_var_2) -> 
        happyIn35
                 ((:) happy_var_1 happy_var_2
        )}}

happyReduce_68 = happyReduce 6# 28# happyReduction_68
happyReduction_68 (happy_x_6 `HappyStk`
        happy_x_5 `HappyStk`
        happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut8 happy_x_2 of { (HappyWrap8 happy_var_2) -> 
        case happyOut37 happy_x_4 of { (HappyWrap37 happy_var_4) -> 
        case happyOut43 happy_x_6 of { (HappyWrap43 happy_var_6) -> 
        happyIn36
                 (AbsGrammatica.Dfun happy_var_2 happy_var_4 happy_var_6
        ) `HappyStk` happyRest}}}

happyReduce_69 = happySpecReduce_3  28# happyReduction_69
happyReduction_69 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
        happyIn36
                 (AbsGrammatica.DvarGo happy_var_2
        )}

happyReduce_70 = happySpecReduce_0  29# happyReduction_70
happyReduction_70  =  happyIn37
                 ([]
        )

happyReduce_71 = happySpecReduce_1  29# happyReduction_71
happyReduction_71 happy_x_1
         =  case happyOut38 happy_x_1 of { (HappyWrap38 happy_var_1) -> 
        happyIn37
                 ((:[]) happy_var_1
        )}

happyReduce_72 = happySpecReduce_3  29# happyReduction_72
happyReduction_72 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut38 happy_x_1 of { (HappyWrap38 happy_var_1) -> 
        case happyOut37 happy_x_3 of { (HappyWrap37 happy_var_3) -> 
        happyIn37
                 ((:) happy_var_1 happy_var_3
        )}}

happyReduce_73 = happySpecReduce_3  30# happyReduction_73
happyReduction_73 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut8 happy_x_2 of { (HappyWrap8 happy_var_2) -> 
        case happyOut40 happy_x_3 of { (HappyWrap40 happy_var_3) -> 
        happyIn38
                 (AbsGrammatica.Param happy_var_2 happy_var_3
        )}}

happyReduce_74 = happyReduce 4# 31# happyReduction_74
happyReduction_74 (happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
        case happyOut40 happy_x_2 of { (HappyWrap40 happy_var_2) -> 
        case happyOut14 happy_x_4 of { (HappyWrap14 happy_var_4) -> 
        happyIn39
                 (AbsGrammatica.VarSpecSingleInit happy_var_1 happy_var_2 happy_var_4
        ) `HappyStk` happyRest}}}

happyReduce_75 = happySpecReduce_3  31# happyReduction_75
happyReduction_75 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
        case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
        happyIn39
                 (AbsGrammatica.VarSpecArrayInit happy_var_1 happy_var_3
        )}}

happyReduce_76 = happySpecReduce_2  31# happyReduction_76
happyReduction_76 happy_x_2
        happy_x_1
         =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
        case happyOut40 happy_x_2 of { (HappyWrap40 happy_var_2) -> 
        happyIn39
                 (AbsGrammatica.VarSpecSingleNoInit happy_var_1 happy_var_2
        )}}

happyReduce_77 = happySpecReduce_1  32# happyReduction_77
happyReduction_77 happy_x_1
         =  case happyOut41 happy_x_1 of { (HappyWrap41 happy_var_1) -> 
        happyIn40
                 (AbsGrammatica.BasTyp happy_var_1
        )}

happyReduce_78 = happySpecReduce_1  32# happyReduction_78
happyReduction_78 happy_x_1
         =  case happyOut42 happy_x_1 of { (HappyWrap42 happy_var_1) -> 
        happyIn40
                 (AbsGrammatica.CompType happy_var_1
        )}

happyReduce_79 = happySpecReduce_1  33# happyReduction_79
happyReduction_79 happy_x_1
         =  happyIn41
                 (AbsGrammatica.BasicType_bool
        )

happyReduce_80 = happySpecReduce_1  33# happyReduction_80
happyReduction_80 happy_x_1
         =  happyIn41
                 (AbsGrammatica.BasicType_char
        )

happyReduce_81 = happySpecReduce_1  33# happyReduction_81
happyReduction_81 happy_x_1
         =  happyIn41
                 (AbsGrammatica.BasicType_float
        )

happyReduce_82 = happySpecReduce_1  33# happyReduction_82
happyReduction_82 happy_x_1
         =  happyIn41
                 (AbsGrammatica.BasicType_int
        )

happyReduce_83 = happySpecReduce_1  33# happyReduction_83
happyReduction_83 happy_x_1
         =  happyIn41
                 (AbsGrammatica.BasicType_string
        )

happyReduce_84 = happyReduce 4# 34# happyReduction_84
happyReduction_84 (happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut11 happy_x_2 of { (HappyWrap11 happy_var_2) -> 
        case happyOut40 happy_x_4 of { (HappyWrap40 happy_var_4) -> 
        happyIn42
                 (AbsGrammatica.ArrDef happy_var_2 happy_var_4
        ) `HappyStk` happyRest}}

happyReduce_85 = happySpecReduce_3  34# happyReduction_85
happyReduction_85 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut40 happy_x_3 of { (HappyWrap40 happy_var_3) -> 
        happyIn42
                 (AbsGrammatica.ArrUnDef happy_var_3
        )}

happyReduce_86 = happySpecReduce_2  34# happyReduction_86
happyReduction_86 happy_x_2
        happy_x_1
         =  case happyOut40 happy_x_2 of { (HappyWrap40 happy_var_2) -> 
        happyIn42
                 (AbsGrammatica.Pointer happy_var_2
        )}

happyReduce_87 = happySpecReduce_3  35# happyReduction_87
happyReduction_87 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut44 happy_x_2 of { (HappyWrap44 happy_var_2) -> 
        happyIn43
                 (AbsGrammatica.BlockDecl happy_var_2
        )}

happyReduce_88 = happySpecReduce_0  36# happyReduction_88
happyReduction_88  =  happyIn44
                 ([]
        )

happyReduce_89 = happySpecReduce_2  36# happyReduction_89
happyReduction_89 happy_x_2
        happy_x_1
         =  case happyOut45 happy_x_1 of { (HappyWrap45 happy_var_1) -> 
        case happyOut44 happy_x_2 of { (HappyWrap44 happy_var_2) -> 
        happyIn44
                 ((:) happy_var_1 happy_var_2
        )}}

happyReduce_90 = happySpecReduce_1  37# happyReduction_90
happyReduction_90 happy_x_1
         =  case happyOut36 happy_x_1 of { (HappyWrap36 happy_var_1) -> 
        happyIn45
                 (AbsGrammatica.DeclItem happy_var_1
        )}

happyReduce_91 = happySpecReduce_1  37# happyReduction_91
happyReduction_91 happy_x_1
         =  case happyOut47 happy_x_1 of { (HappyWrap47 happy_var_1) -> 
        happyIn45
                 (AbsGrammatica.StmtItem happy_var_1
        )}

happyReduce_92 = happySpecReduce_0  38# happyReduction_92
happyReduction_92  =  happyIn46
                 ([]
        )

happyReduce_93 = happySpecReduce_2  38# happyReduction_93
happyReduction_93 happy_x_2
        happy_x_1
         =  case happyOut47 happy_x_1 of { (HappyWrap47 happy_var_1) -> 
        case happyOut46 happy_x_2 of { (HappyWrap46 happy_var_2) -> 
        happyIn46
                 ((:) happy_var_1 happy_var_2
        )}}

happyReduce_94 = happySpecReduce_1  39# happyReduction_94
happyReduction_94 happy_x_1
         =  case happyOut43 happy_x_1 of { (HappyWrap43 happy_var_1) -> 
        happyIn47
                 (AbsGrammatica.Comp happy_var_1
        )}

happyReduce_95 = happySpecReduce_2  39# happyReduction_95
happyReduction_95 happy_x_2
        happy_x_1
         =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
        happyIn47
                 (AbsGrammatica.ProcCall happy_var_1
        )}

happyReduce_96 = happySpecReduce_2  39# happyReduction_96
happyReduction_96 happy_x_2
        happy_x_1
         =  case happyOut49 happy_x_1 of { (HappyWrap49 happy_var_1) -> 
        happyIn47
                 (AbsGrammatica.Jmp happy_var_1
        )}

happyReduce_97 = happySpecReduce_1  39# happyReduction_97
happyReduction_97 happy_x_1
         =  case happyOut51 happy_x_1 of { (HappyWrap51 happy_var_1) -> 
        happyIn47
                 (AbsGrammatica.Iter happy_var_1
        )}

happyReduce_98 = happySpecReduce_1  39# happyReduction_98
happyReduction_98 happy_x_1
         =  case happyOut50 happy_x_1 of { (HappyWrap50 happy_var_1) -> 
        happyIn47
                 (AbsGrammatica.Sel happy_var_1
        )}

happyReduce_99 = happyReduce 4# 39# happyReduction_99
happyReduction_99 (happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut29 happy_x_1 of { (HappyWrap29 happy_var_1) -> 
        case happyOut48 happy_x_2 of { (HappyWrap48 happy_var_2) -> 
        case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
        happyIn47
                 (AbsGrammatica.Assgn happy_var_1 happy_var_2 happy_var_3
        ) `HappyStk` happyRest}}}

happyReduce_100 = happySpecReduce_2  39# happyReduction_100
happyReduction_100 happy_x_2
        happy_x_1
         =  case happyOut29 happy_x_1 of { (HappyWrap29 happy_var_1) -> 
        happyIn47
                 (AbsGrammatica.LExprStmt happy_var_1
        )}

happyReduce_101 = happySpecReduce_3  39# happyReduction_101
happyReduction_101 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
        happyIn47
                 (AbsGrammatica.DeclStmt happy_var_2
        )}

happyReduce_102 = happySpecReduce_3  39# happyReduction_102
happyReduction_102 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
        happyIn47
                 (AbsGrammatica.StmtInc happy_var_1
        )}

happyReduce_103 = happySpecReduce_3  39# happyReduction_103
happyReduction_103 happy_x_3
        happy_x_2
        happy_x_1
         =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
        happyIn47
                 (AbsGrammatica.StmtDec happy_var_1
        )}

happyReduce_104 = happySpecReduce_1  40# happyReduction_104
happyReduction_104 happy_x_1
         =  happyIn48
                 (AbsGrammatica.Assign
        )

happyReduce_105 = happySpecReduce_1  40# happyReduction_105
happyReduction_105 happy_x_1
         =  happyIn48
                 (AbsGrammatica.AssgnMul
        )

happyReduce_106 = happySpecReduce_1  40# happyReduction_106
happyReduction_106 happy_x_1
         =  happyIn48
                 (AbsGrammatica.AssgnAdd
        )

happyReduce_107 = happySpecReduce_1  40# happyReduction_107
happyReduction_107 happy_x_1
         =  happyIn48
                 (AbsGrammatica.AssgnDiv
        )

happyReduce_108 = happySpecReduce_1  40# happyReduction_108
happyReduction_108 happy_x_1
         =  happyIn48
                 (AbsGrammatica.AssgnSub
        )

happyReduce_109 = happySpecReduce_1  40# happyReduction_109
happyReduction_109 happy_x_1
         =  happyIn48
                 (AbsGrammatica.AssgnPow
        )

happyReduce_110 = happySpecReduce_1  40# happyReduction_110
happyReduction_110 happy_x_1
         =  happyIn48
                 (AbsGrammatica.AssgnAnd
        )

happyReduce_111 = happySpecReduce_1  40# happyReduction_111
happyReduction_111 happy_x_1
         =  happyIn48
                 (AbsGrammatica.AssgnOr
        )

happyReduce_112 = happySpecReduce_1  41# happyReduction_112
happyReduction_112 happy_x_1
         =  happyIn49
                 (AbsGrammatica.Break
        )

happyReduce_113 = happySpecReduce_1  41# happyReduction_113
happyReduction_113 happy_x_1
         =  happyIn49
                 (AbsGrammatica.Continue
        )

happyReduce_114 = happyReduce 5# 42# happyReduction_114
happyReduction_114 (happy_x_5 `HappyStk`
        happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
        case happyOut47 happy_x_5 of { (HappyWrap47 happy_var_5) -> 
        happyIn50
                 (AbsGrammatica.IfNoElse happy_var_3 happy_var_5
        ) `HappyStk` happyRest}}

happyReduce_115 = happyReduce 7# 42# happyReduction_115
happyReduction_115 (happy_x_7 `HappyStk`
        happy_x_6 `HappyStk`
        happy_x_5 `HappyStk`
        happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
        case happyOut47 happy_x_5 of { (HappyWrap47 happy_var_5) -> 
        case happyOut47 happy_x_7 of { (HappyWrap47 happy_var_7) -> 
        happyIn50
                 (AbsGrammatica.IfElse happy_var_3 happy_var_5 happy_var_7
        ) `HappyStk` happyRest}}}

happyReduce_116 = happyReduce 5# 43# happyReduction_116
happyReduction_116 (happy_x_5 `HappyStk`
        happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
        case happyOut47 happy_x_5 of { (HappyWrap47 happy_var_5) -> 
        happyIn51
                 (AbsGrammatica.While happy_var_3 happy_var_5
        ) `HappyStk` happyRest}}

happyReduce_117 = happyReduce 7# 43# happyReduction_117
happyReduction_117 (happy_x_7 `HappyStk`
        happy_x_6 `HappyStk`
        happy_x_5 `HappyStk`
        happy_x_4 `HappyStk`
        happy_x_3 `HappyStk`
        happy_x_2 `HappyStk`
        happy_x_1 `HappyStk`
        happyRest)
         = case happyOut47 happy_x_2 of { (HappyWrap47 happy_var_2) -> 
        case happyOut14 happy_x_5 of { (HappyWrap14 happy_var_5) -> 
        happyIn51
                 (AbsGrammatica.DoWhile happy_var_2 happy_var_5
        ) `HappyStk` happyRest}}

happyTerminalToTok term = case term of {
        PT _ (TS _ 1) -> 2#;
        PT _ (TS _ 2) -> 3#;
        PT _ (TS _ 3) -> 4#;
        PT _ (TS _ 4) -> 5#;
        PT _ (TS _ 5) -> 6#;
        PT _ (TS _ 6) -> 7#;
        PT _ (TS _ 7) -> 8#;
        PT _ (TS _ 8) -> 9#;
        PT _ (TS _ 9) -> 10#;
        PT _ (TS _ 10) -> 11#;
        PT _ (TS _ 11) -> 12#;
        PT _ (TS _ 12) -> 13#;
        PT _ (TS _ 13) -> 14#;
        PT _ (TS _ 14) -> 15#;
        PT _ (TS _ 15) -> 16#;
        PT _ (TS _ 16) -> 17#;
        PT _ (TS _ 17) -> 18#;
        PT _ (TS _ 18) -> 19#;
        PT _ (TS _ 19) -> 20#;
        PT _ (TS _ 20) -> 21#;
        PT _ (TS _ 21) -> 22#;
        PT _ (TS _ 22) -> 23#;
        PT _ (TS _ 23) -> 24#;
        PT _ (TS _ 24) -> 25#;
        PT _ (TS _ 25) -> 26#;
        PT _ (TS _ 26) -> 27#;
        PT _ (TS _ 27) -> 28#;
        PT _ (TS _ 28) -> 29#;
        PT _ (TS _ 29) -> 30#;
        PT _ (TS _ 30) -> 31#;
        PT _ (TS _ 31) -> 32#;
        PT _ (TS _ 32) -> 33#;
        PT _ (TS _ 33) -> 34#;
        PT _ (TS _ 34) -> 35#;
        PT _ (TS _ 35) -> 36#;
        PT _ (TS _ 36) -> 37#;
        PT _ (TS _ 37) -> 38#;
        PT _ (TS _ 38) -> 39#;
        PT _ (TS _ 39) -> 40#;
        PT _ (TS _ 40) -> 41#;
        PT _ (TS _ 41) -> 42#;
        PT _ (TS _ 42) -> 43#;
        PT _ (TS _ 43) -> 44#;
        PT _ (TS _ 44) -> 45#;
        PT _ (TS _ 45) -> 46#;
        PT _ (TS _ 46) -> 47#;
        PT _ (TS _ 47) -> 48#;
        PT _ (TS _ 48) -> 49#;
        PT _ (TS _ 49) -> 50#;
        PT _ (TV happy_dollar_dollar) -> 51#;
        PT _ (TC happy_dollar_dollar) -> 52#;
        PT _ (TD happy_dollar_dollar) -> 53#;
        PT _ (TI happy_dollar_dollar) -> 54#;
        PT _ (TL happy_dollar_dollar) -> 55#;
        _ -> -1#;
        }
{-# NOINLINE happyTerminalToTok #-}

happyLex kend  _kmore []       = kend notHappyAtAll []
happyLex _kend kmore  (tk:tks) = kmore (happyTerminalToTok tk) tk tks
{-# INLINE happyLex #-}

happyNewToken action sts stk = happyLex (\tk -> happyDoAction 56# notHappyAtAll action sts stk) (\i tk -> happyDoAction i tk action sts stk)

happyReport 56# tk explist resume tks = happyReport' tks explist resume
happyReport _ tk explist resume tks = happyReport' (tk:tks) explist (\tks -> resume (Happy_Prelude.tail tks))


happyThen :: () => (Err a) -> (a -> (Err b)) -> (Err b)
happyThen = ((>>=))
happyReturn :: () => a -> (Err a)
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyFmap1 f m tks = happyThen (m tks) (\a -> happyReturn (f a))
happyReturn1 :: () => a -> b -> (Err a)
happyReturn1 = \a tks -> (return) a
happyReport' :: () => [(Token)] -> [Happy_Prelude.String] -> ([(Token)] -> (Err a)) -> (Err a)
happyReport' = (\tokens expected resume -> happyError tokens)

happyAbort :: () => [(Token)] -> (Err a)
happyAbort = Happy_Prelude.error "Called abort handler in non-resumptive parser"

pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {(HappyWrap34 x') = happyOut34 x} in x'))

pStmt tks = happySomeParser where
 happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (let {(HappyWrap47 x') = happyOut47 x} in x'))

pRExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (let {(HappyWrap14 x') = happyOut14 x} in x'))

pLExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (let {(HappyWrap29 x') = happyOut29 x} in x'))

happySeq = happyDontSeq


type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens
#define HAPPY_COERCE 1
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $

#if !defined(__GLASGOW_HASKELL__)
#  error This code isn't being built with GHC.
#endif

-- Get WORDS_BIGENDIAN (if defined)
#include "MachDeps.h"

-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Happy_Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Happy_Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Happy_Prelude.Bool)
#define PLUS(n,m) (n Happy_GHC_Exts.+# m)
#define MINUS(n,m) (n Happy_GHC_Exts.-# m)
#define TIMES(n,m) (n Happy_GHC_Exts.*# m)
#define NEGATE(n) (Happy_GHC_Exts.negateInt# (n))

type Happy_Int = Happy_GHC_Exts.Int#
data Happy_IntList = HappyCons Happy_Int Happy_IntList

#define INVALID_TOK -1#
#define ERROR_TOK 0#
#define CATCH_TOK 1#

#if defined(HAPPY_COERCE)
#  define GET_ERROR_TOKEN(x)  (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# i) -> i })
#  define MK_ERROR_TOKEN(i)   (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# i))
#  define MK_TOKEN(x)         (happyInTok (x))
#else
#  define GET_ERROR_TOKEN(x)  (case x of { HappyErrorToken (Happy_GHC_Exts.I# i) -> i })
#  define MK_ERROR_TOKEN(i)   (HappyErrorToken (Happy_GHC_Exts.I# i))
#  define MK_TOKEN(x)         (HappyTerminal (x))
#endif

#if defined(HAPPY_DEBUG)
#  define DEBUG_TRACE(s)    (happyTrace (s)) Happy_Prelude.$
happyTrace string expr = Happy_System_IO_Unsafe.unsafePerformIO Happy_Prelude.$ do
    Happy_System_IO.hPutStr Happy_System_IO.stderr string
    Happy_Prelude.return expr
#else
#  define DEBUG_TRACE(s)    {- nothing -}
#endif

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept ERROR_TOK tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) =
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

happyDoAction i tk st =
  DEBUG_TRACE("state: " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++
              ",\ttoken: " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++
              ",\taction: ")
  case happyDecodeAction (happyNextAction i st) of
    HappyFail             -> DEBUG_TRACE("failing.\n")
                             happyFail i tk st
    HappyAccept           -> DEBUG_TRACE("accept.\n")
                             happyAccept i tk st
    HappyReduce rule      -> DEBUG_TRACE("reduce (rule " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# rule) Happy_Prelude.++ ")")
                             (happyReduceArr Happy_Data_Array.! (Happy_GHC_Exts.I# rule)) i tk st
    HappyShift  new_state -> DEBUG_TRACE("shift, enter state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# new_state) Happy_Prelude.++ "\n")
                             happyShift new_state i tk st

{-# INLINE happyNextAction #-}
happyNextAction i st = case happyIndexActionTable i st of
  Happy_Prelude.Just (Happy_GHC_Exts.I# act) -> act
  Happy_Prelude.Nothing                      -> happyIndexOffAddr happyDefActions st

{-# INLINE happyIndexActionTable #-}
happyIndexActionTable i st
  | GTE(i, 0#), GTE(off, 0#), EQ(happyIndexOffAddr happyCheck off, i)
  -- i >= 0:   Guard against INVALID_TOK (do the default action, which ultimately errors)
  -- off >= 0: Otherwise it's a default action
  -- equality check: Ensure that the entry in the compressed array is owned by st
  = Happy_Prelude.Just (Happy_GHC_Exts.I# (happyIndexOffAddr happyTable off))
  | Happy_Prelude.otherwise
  = Happy_Prelude.Nothing
  where
    off = PLUS(happyIndexOffAddr happyActOffsets st, i)

data HappyAction
  = HappyFail
  | HappyAccept
  | HappyReduce Happy_Int -- rule number
  | HappyShift Happy_Int  -- new state
  deriving Happy_Prelude.Show

{-# INLINE happyDecodeAction #-}
happyDecodeAction :: Happy_Int -> HappyAction
happyDecodeAction  0#                        = HappyFail
happyDecodeAction -1#                        = HappyAccept
happyDecodeAction action | LT(action, 0#)    = HappyReduce NEGATE(PLUS(action, 1#))
                         | Happy_Prelude.otherwise = HappyShift MINUS(action, 1#)

{-# INLINE happyIndexGotoTable #-}
happyIndexGotoTable nt st = happyIndexOffAddr happyTable off
  where
    off = PLUS(happyIndexOffAddr happyGotoOffsets st, nt)

{-# INLINE happyIndexOffAddr #-}
happyIndexOffAddr :: HappyAddr -> Happy_Int -> Happy_Int
happyIndexOffAddr (HappyA# arr) off =
#if __GLASGOW_HASKELL__ >= 901
  Happy_GHC_Exts.int32ToInt# -- qualified import because it doesn't exist on older GHC's
#endif
#ifdef WORDS_BIGENDIAN
  -- The CI of `alex` tests this code path
  (Happy_GHC_Exts.word32ToInt32# (Happy_GHC_Exts.wordToWord32# (Happy_GHC_Exts.byteSwap32# (Happy_GHC_Exts.word32ToWord# (Happy_GHC_Exts.int32ToWord32#
#endif
  (Happy_GHC_Exts.indexInt32OffAddr# arr off)
#ifdef WORDS_BIGENDIAN
  )))))
#endif

happyIndexRuleArr :: Happy_Int -> (# Happy_Int, Happy_Int #)
happyIndexRuleArr r = (# nt, len #)
  where
    !(Happy_GHC_Exts.I# n_starts) = happy_n_starts
    offs = TIMES(MINUS(r,n_starts),2#)
    nt = happyIndexOffAddr happyRuleArr offs
    len = happyIndexOffAddr happyRuleArr PLUS(offs,1#)

data HappyAddr = HappyA# Happy_GHC_Exts.Addr#

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state ERROR_TOK tk st sts stk@(x `HappyStk` _) =
     -- See "Error Fixup" below
     let i = GET_ERROR_TOKEN(x) in
     DEBUG_TRACE("shifting the error token")
     happyDoAction i tk new_state (HappyCons st sts) stk

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons st sts) (MK_TOKEN(tk) `HappyStk` stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 nt fn j tk st sts stk
     = happySeq fn (happyGoto nt j tk st (HappyCons st sts) (fn `HappyStk` stk))

happySpecReduce_1 nt fn j tk old_st sts@(HappyCons st _) (v1 `HappyStk` stk')
     = let r = fn v1 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happySpecReduce_2 nt fn j tk old_st
  (HappyCons _ sts@(HappyCons st _))
  (v1 `HappyStk` v2 `HappyStk` stk')
     = let r = fn v1 v2 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happySpecReduce_3 nt fn j tk old_st
  (HappyCons _ (HappyCons _ sts@(HappyCons st _)))
  (v1 `HappyStk` v2 `HappyStk` v3 `HappyStk` stk')
     = let r = fn v1 v2 v3 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happyReduce k nt fn j tk st sts stk
     = case happyDrop MINUS(k,(1# :: Happy_Int)) sts of
         sts1@(HappyCons st1 _) ->
                let r = fn stk in -- it doesn't hurt to always seq here...
                st `happyTcHack` happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk in
          j `happyTcHack` happyThen1 (fn stk tk)
                                     (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk
              off = happyIndexOffAddr happyGotoOffsets st1
              off_i = PLUS(off, nt)
              new_state = happyIndexOffAddr happyTable off_i
          in
            j `happyTcHack` happyThen1 (fn stk tk)
                                       (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l               = l
happyDrop n  (HappyCons _ t) = happyDrop MINUS(n,(1# :: Happy_Int)) t

happyDropStk 0# l                 = l
happyDropStk n  (x `HappyStk` xs) = happyDropStk MINUS(n,(1#::Happy_Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

happyGoto nt j tk st =
   DEBUG_TRACE(", goto state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# new_state) Happy_Prelude.++ "\n")
   happyDoAction j tk new_state
  where new_state = happyIndexGotoTable nt st

{- Note [Error recovery]
~~~~~~~~~~~~~~~~~~~~~~~~
When there is no applicable action for the current lookahead token `tk`,
happy enters error recovery mode. Depending on whether the grammar file
declares the two action form `%error { abort } { report }` for
    Resumptive Error Handling,
it works in one (not resumptive) or two phases (resumptive):

 1. Fixup mode:
    Try to see if there is an action for the error token ERROR_TOK. If there
    is, do *not* emit an error and pretend instead that an `error` token was
    inserted.
    When there is no ERROR_TOK action, report an error.

    In non-resumptive error handling, calling the single error handler
    (e.g. `happyError`) will throw an exception and abort the parser.
    However, in resumptive error handling we enter *error resumption mode*.

 2. Error resumption mode:
    After reporting the error (with `report`), happy will attempt to find
    a good state stack to resume parsing in.
    For each candidate stack, it discards input until one of the candidates
    resumes (i.e. shifts the current input).
    If no candidate resumes before the end of input, resumption failed and
    calls the `abort` function, to much the same effect as in non-resumptive
    error handling.

    Candidate stacks are declared by the grammar author using the special
    `catch` terminal and called "catch frames".
    This mechanism is described in detail in Note [happyResume].

The `catch` resumption mechanism (2) is what usually is associated with
`error` in `bison` or `menhir`. Since `error` is used for the Fixup mechanism
(1) above, we call the corresponding token `catch`.
Furthermore, in constrast to `bison`, our implementation of `catch`
non-deterministically considers multiple catch frames on the stack for
resumption (See Note [Multiple catch frames]).

Note [happyResume]
~~~~~~~~~~~~~~~~~~
`happyResume` implements the resumption mechanism from Note [Error recovery].
It is best understood by example. Consider

Exp :: { String }
Exp : '1'                { "1" }
    | catch              { "catch" }
    | Exp '+' Exp %shift { $1 Happy_Prelude.++ " + " Happy_Prelude.++ $3 } -- %shift: associate 1 + 1 + 1 to the right
    | '(' Exp ')'        { "(" Happy_Prelude.++ $2 Happy_Prelude.++ ")" }

The idea of the use of `catch` here is that upon encountering a parse error
during expression parsing, we can gracefully degrade using the `catch` rule,
still producing a partial syntax tree and keep on parsing to find further
syntax errors.

Let's trace the parser state for input 11+1, which will error out after shifting 1.
After shifting, we have the following item stack (growing downwards and omitting
transitive closure items):

  State 0: %start_parseExp -> . Exp
  State 5: Exp -> '1' .

(Stack as a list of state numbers: [5,0].)
As Note [Error recovery] describes, we will first try Fixup mode.
That fails because no production can shift the `error` token.
Next we try Error resumption mode. This works as follows:

  1. Pop off the item stack until we find an item that can shift the `catch`
     token. (Implemented in `pop_items`.)
       * State 5 cannot shift catch. Pop.
       * State 0 can shift catch, which would transition into
          State 4: Exp -> catch .
     So record the *stack* `[4,0]` after doing the shift transition.
     We call this a *catch frame*, where the top is a *catch state*,
     corresponding to an item in which we just shifted a `catch` token.
     There can be multiple such catch stacks, see Note [Multiple catch frames].

  2. Discard tokens from the input until the lookahead can be shifted in one
     of the catch stacks. (Implemented in `discard_input_until_exp` and
     `some_catch_state_shifts`.)
       * We cannot shift the current lookahead '1' in state 4, so we discard
       * We *can* shift the next lookahead '+' in state 4, but only after
         reducing, which pops State 4 and goes to State 3:
           State 3: %start_parseExp -> Exp .
                    Exp -> Exp . '+' Exp
         Here we can shift '+'.
     As you can see, to implement this machinery we need to simulate
     the operation of the LALR automaton, especially reduction
     (`happySimulateReduce`).

Note [Multiple catch frames]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
For fewer spurious error messages, it can be beneficial to trace multiple catch
items. Consider

Exp : '1'
    | catch
    | Exp '+' Exp %shift
    | '(' Exp ')'

Let's trace the parser state for input (;+1, which will error out after shifting (.
After shifting, we have the following item stack (growing downwards):

  State 0: %start_parseExp -> . Exp
  State 6: Exp -> '(' . Exp ')'

Upon error, we want to find items in the stack which can shift a catch token.
Note that both State 0 and State 6 can shift a catch token, transitioning into
  State 4: Exp -> catch .
Hence we record the catch frames `[4,6,0]` and `[4,0]` for possible resumption.

Which catch frame do we pick for resumption?
Note that resuming catch frame `[4,0]` will parse as "catch+1", whereas
resuming the innermost frame `[4,6,0]` corresponds to parsing "(catch+1".
The latter would keep discarding input until the closing ')' is found.
So we will discard + and 1, leading to a spurious syntax error at the end of
input, aborting the parse and never producing a partial syntax tree. Bad!

It is far preferable to resume with catch frame `[4,0]`, where we can resume
successfully on input +, so that is what we do.

In general, we pick the catch frame for resumption that discards the least
amount of input for a successful shift, preferring the topmost such catch frame.
-}

-- happyFail :: Happy_Int -> Token -> Happy_Int -> _
-- This function triggers Note [Error recovery].
-- If the current token is ERROR_TOK, phase (1) has failed and we might try
-- phase (2).
happyFail ERROR_TOK = happyFixupFailed
happyFail i         = happyTryFixup i

-- Enter Error Fixup (see Note [Error recovery]):
-- generate an error token, save the old token and carry on.
-- When a `happyShift` accepts the error token, we will pop off the error token
-- to resume parsing with the current lookahead `i`.
happyTryFixup i tk action sts stk =
  DEBUG_TRACE("entering `error` fixup.\n")
  happyDoAction ERROR_TOK tk action sts (MK_ERROR_TOKEN(i) `HappyStk` stk)
  -- NB: `happyShift` will simply pop the error token and carry on with
  --     `tk`. Hence we don't change `tk` in the call here

-- See Note [Error recovery], phase (2).
-- Enter resumption mode after reporting the error by calling `happyResume`.
happyFixupFailed tk st sts (x `HappyStk` stk) =
  let i = GET_ERROR_TOKEN(x) in
  DEBUG_TRACE("`error` fixup failed.\n")
  let resume   = happyResume i tk st sts stk
      expected = happyExpectedTokens st sts in
  happyReport i tk expected resume

-- happyResume :: Happy_Int -> Token -> Happy_Int -> _
-- See Note [happyResume]
happyResume i tk st sts stk = pop_items [] st sts stk
  where
    !(Happy_GHC_Exts.I# n_starts) = happy_n_starts   -- this is to test whether we have a start token
    !(Happy_GHC_Exts.I# eof_i) = happy_n_terms Happy_Prelude.- 1   -- this is the token number of the EOF token
    happy_list_to_list :: Happy_IntList -> [Happy_Prelude.Int]
    happy_list_to_list (HappyCons st sts)
      | LT(st, n_starts)
      = [(Happy_GHC_Exts.I# st)]
      | Happy_Prelude.otherwise
      = (Happy_GHC_Exts.I# st) : happy_list_to_list sts

    -- See (1) of Note [happyResume]
    pop_items catch_frames st sts stk
      | LT(st, n_starts)
      = DEBUG_TRACE("reached start state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ ", ")
        if Happy_Prelude.null catch_frames_new
          then DEBUG_TRACE("no resumption.\n")
               happyAbort
          else DEBUG_TRACE("now discard input, trying to anchor in states " Happy_Prelude.++ Happy_Prelude.show (Happy_Prelude.map (happy_list_to_list . Happy_Prelude.fst) (Happy_Prelude.reverse catch_frames_new)) Happy_Prelude.++ ".\n")
               discard_input_until_exp i tk (Happy_Prelude.reverse catch_frames_new)
      | (HappyCons st1 sts1) <- sts, _ `HappyStk` stk1 <- stk
      = pop_items catch_frames_new st1 sts1 stk1
      where
        !catch_frames_new
          | HappyShift new_state <- happyDecodeAction (happyNextAction CATCH_TOK st)
          , DEBUG_TRACE("can shift catch token in state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ ", into state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# new_state) Happy_Prelude.++ "\n")
            Happy_Prelude.null (Happy_Prelude.filter (\(HappyCons _ (HappyCons h _),_) -> EQ(st,h)) catch_frames)
          = (HappyCons new_state (HappyCons st sts), MK_ERROR_TOKEN(i) `HappyStk` stk):catch_frames -- MK_ERROR_TOKEN(i) is just some dummy that should not be accessed by user code
          | Happy_Prelude.otherwise
          = DEBUG_TRACE("already shifted or can't shift catch in " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ "\n")
            catch_frames

    -- See (2) of Note [happyResume]
    discard_input_until_exp i tk catch_frames
      | Happy_Prelude.Just (HappyCons st (HappyCons catch_st sts), catch_frame) <- some_catch_state_shifts i catch_frames
      = DEBUG_TRACE("found expected token in state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ " after shifting from " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# catch_st) Happy_Prelude.++ ": " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++ "\n")
        happyDoAction i tk st (HappyCons catch_st sts) catch_frame
      | EQ(i,eof_i) -- is i EOF?
      = DEBUG_TRACE("reached EOF, cannot resume. abort parse :(\n")
        happyAbort
      | Happy_Prelude.otherwise
      = DEBUG_TRACE("discard token " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++ "\n")
        happyLex (\eof_tk -> discard_input_until_exp eof_i eof_tk catch_frames) -- eof
                 (\i tk   -> discard_input_until_exp i tk catch_frames)         -- not eof

    some_catch_state_shifts _ [] = DEBUG_TRACE("no catch state could shift.\n") Happy_Prelude.Nothing
    some_catch_state_shifts i catch_frames@(((HappyCons st sts),_):_) = try_head i st sts catch_frames
      where
        try_head i st sts catch_frames = -- PRECONDITION: head catch_frames = (HappyCons st sts)
          DEBUG_TRACE("trying token " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++ " in state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ ": ")
          case happyDecodeAction (happyNextAction i st) of
            HappyFail     -> DEBUG_TRACE("fail.\n")   some_catch_state_shifts i (Happy_Prelude.tail catch_frames)
            HappyAccept   -> DEBUG_TRACE("accept.\n") Happy_Prelude.Just (Happy_Prelude.head catch_frames)
            HappyShift _  -> DEBUG_TRACE("shift.\n")  Happy_Prelude.Just (Happy_Prelude.head catch_frames)
            HappyReduce r -> case happySimulateReduce r st sts of
              (HappyCons st1 sts1) -> try_head i st1 sts1 catch_frames

happySimulateReduce r st sts =
  DEBUG_TRACE("simulate reduction of rule " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# r) Happy_Prelude.++ ", ")
  let (# nt, len #) = happyIndexRuleArr r in
  DEBUG_TRACE("nt " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# nt) Happy_Prelude.++ ", len: " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# len) Happy_Prelude.++ ", new_st ")
  let !(sts1@(HappyCons st1 _)) = happyDrop len (HappyCons st sts)
      new_st = happyIndexGotoTable nt st1 in
  DEBUG_TRACE(Happy_Prelude.show (Happy_GHC_Exts.I# new_st) Happy_Prelude.++ ".\n")
  (HappyCons new_st sts1)

happyTokenToString :: Happy_Prelude.Int -> Happy_Prelude.String
happyTokenToString i = happyTokenStrings Happy_Prelude.!! (i Happy_Prelude.- 2) -- 2: errorTok, catchTok

happyExpectedTokens :: Happy_Int -> Happy_IntList -> [Happy_Prelude.String]
-- Upon a parse error, we want to suggest tokens that are expected in that
-- situation. This function computes such tokens.
-- It works by examining the top of the state stack.
-- For every token number that does a shift transition, record that token number.
-- For every token number that does a reduce transition, simulate that reduction
-- on the state state stack and repeat.
-- The recorded token numbers are then formatted with 'happyTokenToString' and
-- returned.
happyExpectedTokens st sts =
  DEBUG_TRACE("constructing expected tokens.\n")
  Happy_Prelude.map happyTokenToString (search_shifts st sts [])
  where
    search_shifts st sts shifts = Happy_Prelude.foldr (add_action st sts) shifts (distinct_actions st)
    add_action st sts (Happy_GHC_Exts.I# i, Happy_GHC_Exts.I# act) shifts =
      DEBUG_TRACE("found action in state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ ", input " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++ ", " Happy_Prelude.++ Happy_Prelude.show (happyDecodeAction act) Happy_Prelude.++ "\n")
      case happyDecodeAction act of
        HappyFail     -> shifts
        HappyAccept   -> shifts -- This would always be %eof or error... Not helpful
        HappyShift _  -> Happy_Prelude.insert (Happy_GHC_Exts.I# i) shifts
        HappyReduce r -> case happySimulateReduce r st sts of
          (HappyCons st1 sts1) -> search_shifts st1 sts1 shifts
    distinct_actions st
      -- The (token number, action) pairs of all actions in the given state
      = ((-1), (Happy_GHC_Exts.I# (happyIndexOffAddr happyDefActions st)))
      : [ (i, act) | i <- [begin_i..happy_n_terms], act <- get_act row_off i ]
      where
        row_off = happyIndexOffAddr happyActOffsets st
        begin_i = 2 -- +2: errorTok,catchTok
    get_act off (Happy_GHC_Exts.I# i) -- happyIndexActionTable with cached row offset
      | let off_i = PLUS(off,i)
      , GTE(off_i,0#)
      , EQ(happyIndexOffAddr happyCheck off_i,i)
      = [(Happy_GHC_Exts.I# (happyIndexOffAddr happyTable off_i))]
      | Happy_Prelude.otherwise
      = []

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Happy_Prelude.error "Internal Happy parser panic. This is not supposed to happen! Please open a bug report at https://github.com/haskell/happy/issues.\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions

happyTcHack :: Happy_Int -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}

-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Happy_GHC_Exts.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
