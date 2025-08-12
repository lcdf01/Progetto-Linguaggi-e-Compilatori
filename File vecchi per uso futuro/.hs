{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module Grammatica.Par
  ( happyError
  , myLexer
  , pProgram
  , pStmt
  , pRExpr
  , pLExpr
  ) where

import Prelude

import qualified Grammatica.Abs
import Grammatica.Lex
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap7 = HappyWrap7 (Grammatica.Abs.Ident)
happyIn7 :: (Grammatica.Abs.Ident) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap7 x)
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> HappyWrap7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
newtype HappyWrap8 = HappyWrap8 (Char)
happyIn8 :: (Char) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap8 x)
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> HappyWrap8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
newtype HappyWrap9 = HappyWrap9 (Double)
happyIn9 :: (Double) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap9 x)
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> HappyWrap9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
newtype HappyWrap10 = HappyWrap10 (Integer)
happyIn10 :: (Integer) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap10 x)
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> HappyWrap10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
newtype HappyWrap11 = HappyWrap11 (String)
happyIn11 :: (String) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap11 x)
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> HappyWrap11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
newtype HappyWrap12 = HappyWrap12 (Grammatica.Abs.Boolean)
happyIn12 :: (Grammatica.Abs.Boolean) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap12 x)
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> HappyWrap12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
newtype HappyWrap13 = HappyWrap13 (Grammatica.Abs.RExpr)
happyIn13 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap13 x)
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> HappyWrap13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
newtype HappyWrap14 = HappyWrap14 (Grammatica.Abs.RExpr)
happyIn14 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap14 x)
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> HappyWrap14
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
newtype HappyWrap15 = HappyWrap15 (Grammatica.Abs.RExpr)
happyIn15 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap15 x)
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> HappyWrap15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
newtype HappyWrap16 = HappyWrap16 (Grammatica.Abs.RExpr)
happyIn16 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 (Grammatica.Abs.RExpr)
happyIn17 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 (Grammatica.Abs.RExpr)
happyIn18 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 (Grammatica.Abs.RExpr)
happyIn19 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 (Grammatica.Abs.RExpr)
happyIn20 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 (Grammatica.Abs.RExpr)
happyIn21 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
newtype HappyWrap22 = HappyWrap22 (Grammatica.Abs.RExpr)
happyIn22 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap22 x)
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> HappyWrap22
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
newtype HappyWrap23 = HappyWrap23 (Grammatica.Abs.RExpr)
happyIn23 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap23 x)
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> HappyWrap23
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
newtype HappyWrap24 = HappyWrap24 (Grammatica.Abs.RExpr)
happyIn24 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap24 x)
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> HappyWrap24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
newtype HappyWrap25 = HappyWrap25 (Grammatica.Abs.RExpr)
happyIn25 :: (Grammatica.Abs.RExpr) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap25 x)
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> HappyWrap25
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
newtype HappyWrap26 = HappyWrap26 (Grammatica.Abs.FunCall)
happyIn26 :: (Grammatica.Abs.FunCall) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap26 x)
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> HappyWrap26
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
newtype HappyWrap27 = HappyWrap27 ([Grammatica.Abs.RExpr])
happyIn27 :: ([Grammatica.Abs.RExpr]) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap27 x)
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> HappyWrap27
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
newtype HappyWrap28 = HappyWrap28 (Grammatica.Abs.LExpr)
happyIn28 :: (Grammatica.Abs.LExpr) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap28 x)
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> HappyWrap28
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
newtype HappyWrap29 = HappyWrap29 (Grammatica.Abs.LExpr)
happyIn29 :: (Grammatica.Abs.LExpr) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap29 x)
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> HappyWrap29
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
newtype HappyWrap30 = HappyWrap30 (Grammatica.Abs.LExpr)
happyIn30 :: (Grammatica.Abs.LExpr) -> (HappyAbsSyn )
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap30 x)
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn ) -> HappyWrap30
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
newtype HappyWrap31 = HappyWrap31 (Grammatica.Abs.LExpr)
happyIn31 :: (Grammatica.Abs.LExpr) -> (HappyAbsSyn )
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap31 x)
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn ) -> HappyWrap31
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
newtype HappyWrap32 = HappyWrap32 (Grammatica.Abs.BLExpr)
happyIn32 :: (Grammatica.Abs.BLExpr) -> (HappyAbsSyn )
happyIn32 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap32 x)
{-# INLINE happyIn32 #-}
happyOut32 :: (HappyAbsSyn ) -> HappyWrap32
happyOut32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut32 #-}
newtype HappyWrap33 = HappyWrap33 (Grammatica.Abs.Program)
happyIn33 :: (Grammatica.Abs.Program) -> (HappyAbsSyn )
happyIn33 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap33 x)
{-# INLINE happyIn33 #-}
happyOut33 :: (HappyAbsSyn ) -> HappyWrap33
happyOut33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut33 #-}
newtype HappyWrap34 = HappyWrap34 ([Grammatica.Abs.Decl])
happyIn34 :: ([Grammatica.Abs.Decl]) -> (HappyAbsSyn )
happyIn34 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap34 x)
{-# INLINE happyIn34 #-}
happyOut34 :: (HappyAbsSyn ) -> HappyWrap34
happyOut34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut34 #-}
newtype HappyWrap35 = HappyWrap35 (Grammatica.Abs.Decl)
happyIn35 :: (Grammatica.Abs.Decl) -> (HappyAbsSyn )
happyIn35 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap35 x)
{-# INLINE happyIn35 #-}
happyOut35 :: (HappyAbsSyn ) -> HappyWrap35
happyOut35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut35 #-}
newtype HappyWrap36 = HappyWrap36 ([Grammatica.Abs.Parameter])
happyIn36 :: ([Grammatica.Abs.Parameter]) -> (HappyAbsSyn )
happyIn36 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap36 x)
{-# INLINE happyIn36 #-}
happyOut36 :: (HappyAbsSyn ) -> HappyWrap36
happyOut36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut36 #-}
newtype HappyWrap37 = HappyWrap37 (Grammatica.Abs.Parameter)
happyIn37 :: (Grammatica.Abs.Parameter) -> (HappyAbsSyn )
happyIn37 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap37 x)
{-# INLINE happyIn37 #-}
happyOut37 :: (HappyAbsSyn ) -> HappyWrap37
happyOut37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut37 #-}
newtype HappyWrap38 = HappyWrap38 (Grammatica.Abs.VarSpec)
happyIn38 :: (Grammatica.Abs.VarSpec) -> (HappyAbsSyn )
happyIn38 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap38 x)
{-# INLINE happyIn38 #-}
happyOut38 :: (HappyAbsSyn ) -> HappyWrap38
happyOut38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut38 #-}
newtype HappyWrap39 = HappyWrap39 (Grammatica.Abs.TypeSpec)
happyIn39 :: (Grammatica.Abs.TypeSpec) -> (HappyAbsSyn )
happyIn39 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap39 x)
{-# INLINE happyIn39 #-}
happyOut39 :: (HappyAbsSyn ) -> HappyWrap39
happyOut39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut39 #-}
newtype HappyWrap40 = HappyWrap40 (Grammatica.Abs.BasicType)
happyIn40 :: (Grammatica.Abs.BasicType) -> (HappyAbsSyn )
happyIn40 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap40 x)
{-# INLINE happyIn40 #-}
happyOut40 :: (HappyAbsSyn ) -> HappyWrap40
happyOut40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut40 #-}
newtype HappyWrap41 = HappyWrap41 (Grammatica.Abs.CompoundType)
happyIn41 :: (Grammatica.Abs.CompoundType) -> (HappyAbsSyn )
happyIn41 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap41 x)
{-# INLINE happyIn41 #-}
happyOut41 :: (HappyAbsSyn ) -> HappyWrap41
happyOut41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut41 #-}
newtype HappyWrap42 = HappyWrap42 (Grammatica.Abs.CompStmt)
happyIn42 :: (Grammatica.Abs.CompStmt) -> (HappyAbsSyn )
happyIn42 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap42 x)
{-# INLINE happyIn42 #-}
happyOut42 :: (HappyAbsSyn ) -> HappyWrap42
happyOut42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut42 #-}
newtype HappyWrap43 = HappyWrap43 ([Grammatica.Abs.BlockItem])
happyIn43 :: ([Grammatica.Abs.BlockItem]) -> (HappyAbsSyn )
happyIn43 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap43 x)
{-# INLINE happyIn43 #-}
happyOut43 :: (HappyAbsSyn ) -> HappyWrap43
happyOut43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut43 #-}
newtype HappyWrap44 = HappyWrap44 (Grammatica.Abs.BlockItem)
happyIn44 :: (Grammatica.Abs.BlockItem) -> (HappyAbsSyn )
happyIn44 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap44 x)
{-# INLINE happyIn44 #-}
happyOut44 :: (HappyAbsSyn ) -> HappyWrap44
happyOut44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut44 #-}
newtype HappyWrap45 = HappyWrap45 ([Grammatica.Abs.Stmt])
happyIn45 :: ([Grammatica.Abs.Stmt]) -> (HappyAbsSyn )
happyIn45 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap45 x)
{-# INLINE happyIn45 #-}
happyOut45 :: (HappyAbsSyn ) -> HappyWrap45
happyOut45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut45 #-}
newtype HappyWrap46 = HappyWrap46 (Grammatica.Abs.Stmt)
happyIn46 :: (Grammatica.Abs.Stmt) -> (HappyAbsSyn )
happyIn46 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap46 x)
{-# INLINE happyIn46 #-}
happyOut46 :: (HappyAbsSyn ) -> HappyWrap46
happyOut46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut46 #-}
newtype HappyWrap47 = HappyWrap47 (Grammatica.Abs.Assignment_op)
happyIn47 :: (Grammatica.Abs.Assignment_op) -> (HappyAbsSyn )
happyIn47 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap47 x)
{-# INLINE happyIn47 #-}
happyOut47 :: (HappyAbsSyn ) -> HappyWrap47
happyOut47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut47 #-}
newtype HappyWrap48 = HappyWrap48 (Grammatica.Abs.JumpStmt)
happyIn48 :: (Grammatica.Abs.JumpStmt) -> (HappyAbsSyn )
happyIn48 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap48 x)
{-# INLINE happyIn48 #-}
happyOut48 :: (HappyAbsSyn ) -> HappyWrap48
happyOut48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut48 #-}
newtype HappyWrap49 = HappyWrap49 (Grammatica.Abs.SelectionStmt)
happyIn49 :: (Grammatica.Abs.SelectionStmt) -> (HappyAbsSyn )
happyIn49 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap49 x)
{-# INLINE happyIn49 #-}
happyOut49 :: (HappyAbsSyn ) -> HappyWrap49
happyOut49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut49 #-}
newtype HappyWrap50 = HappyWrap50 (Grammatica.Abs.IterStmt)
happyIn50 :: (Grammatica.Abs.IterStmt) -> (HappyAbsSyn )
happyIn50 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap50 x)
{-# INLINE happyIn50 #-}
happyOut50 :: (HappyAbsSyn ) -> HappyWrap50
happyOut50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut50 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x21\x00\x00\x00\x00\x00\x00\x00\x00\x4a\x04\x00\x34\xc4\x11\x00\x00\x00\x00\x00\x00\x90\x94\x0c\x40\x00\x41\xe0\x03\x00\x00\x00\x00\x00\x00\x28\x11\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x22\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\xa0\x44\x00\x02\x08\x02\x1f\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x01\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x40\x04\x3b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x20\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa4\x64\x00\x02\x08\x02\x1f\x00\x00\x00\x00\x00\x00\x40\x89\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x92\x92\x01\x08\x20\x08\x7c\x00\x00\x00\x00\x00\x00\x00\x25\x02\x10\x40\x10\xf8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x21\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x22\xd1\x04\x02\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x94\x08\x00\x68\x88\x23\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x89\x00\x80\xc6\x38\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x40\x00\x10\x51\xc8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x94\x08\x00\x68\x8c\x23\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x80\xa4\x64\x00\x02\x08\x02\x1f\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x92\x92\x01\x08\x20\x08\x7c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x90\x94\x0c\x40\x00\x41\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\xa4\x64\x00\x02\x08\x02\x1f\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x24\x25\x03\x10\x40\x10\xf8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x90\x92\x01\x08\x20\x08\x7c\x00\x00\x00\x00\x00\x00\x20\x25\x03\x10\x40\x10\xf8\x00\x00\x00\x00\x00\x00\x40\x4a\x06\x20\x80\x20\xf0\x01\x00\x00\x00\x00\x00\x80\x94\x0c\x40\x00\x41\xe0\x03\x00\x00\x00\x00\x00\x00\x29\x19\x80\x00\x82\xc0\x07\x00\x00\x00\x00\x00\x00\x52\x32\x00\x01\x04\x81\x0f\x00\x00\x00\x00\x00\x00\xa4\x64\x00\x02\x08\x02\x1f\x00\x00\x00\x00\x00\x00\x48\xc9\x00\x04\x10\x04\x3e\x00\x00\x00\x00\x00\x00\x90\x92\x01\x08\x20\x08\x7c\x00\x00\x00\x00\x00\x00\x20\x25\x03\x10\x40\x10\xf8\x00\x00\x00\x00\x00\x00\x40\x4a\x06\x20\x80\x20\xf0\x01\x00\x00\x00\x00\x00\x80\x94\x0c\x40\x00\x41\xe0\x03\x00\x00\x00\x00\x00\x20\x29\x19\x80\x00\x82\xc0\x07\x00\x00\x00\x00\x00\x40\x52\x32\x00\x01\x04\x81\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x44\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x88\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x20\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x41\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x22\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x28\x64\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x44\x21\x03\x00\x00\x00\x00\x00\x00\x00\x92\x92\x01\x08\x20\x08\x7c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x88\x42\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x90\x94\x0c\x40\x00\x41\xe0\x03\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x12\x01\x00\x0d\x71\x04\x00\x00\x00\x00\x00\x00\x00\x25\x02\x00\x1a\xe2\x08\x00\x00\x00\x00\x00\x00\x48\x4a\x06\x20\x80\x20\xf0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x52\x32\x00\x01\x04\x81\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x92\x92\x01\x08\x20\x08\x7c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x51\xc8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x20\x0a\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x89\x00\x80\x86\x38\x02\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","%start_pStmt","%start_pRExpr","%start_pLExpr","Ident","Char","Double","Integer","String","Boolean","RExpr","RExpr1","RExpr2","RExpr3","RExpr4","RExpr5","RExpr6","RExpr7","RExpr8","RExpr9","RExpr10","RExpr11","RExpr12","FunCall","ListRExpr","LExpr","LExpr1","LExpr2","LExpr3","BLExpr","Program","ListDecl","Decl","ListParameter","Parameter","VarSpec","TypeSpec","BasicType","CompoundType","CompStmt","ListBlockItem","BlockItem","ListStmt","Stmt","Assignment_op","JumpStmt","SelectionStmt","IterStmt","'!'","'!='","'%'","'&'","'&&'","'&='","'('","')'","'*'","'*='","'+'","'++'","'+='","','","'-'","'--'","'-='","'/'","'/='","';'","'<'","'<='","'='","'=='","'>'","'>='","'['","']'","'^'","'^='","'bool'","'break'","'char'","'continue'","'do'","'else'","'false'","'float'","'func'","'if'","'int'","'string'","'true'","'var'","'while'","'{'","'|='","'||'","'}'","L_Ident","L_charac","L_doubl","L_integ","L_quoted","%eof"]
        bit_start = st Prelude.* 105
        bit_end = (st Prelude.+ 1) Prelude.* 105
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..104]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x27\x00\xc2\x00\x01\x00\x0e\x00\xd2\xff\x00\x00\xf1\xff\xd8\xff\x00\x00\x00\x00\x52\x00\x00\x00\x0e\x00\x31\x00\xfc\xff\xfc\xff\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd7\xff\x1c\x00\x00\x00\x00\x00\x5c\x04\x78\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x14\x00\x0e\x00\x01\x00\x31\x00\xf6\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x44\x00\x5c\x00\x43\x01\x00\x00\x32\x00\x63\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc2\x00\x76\x00\x51\x00\x98\x00\x9a\x00\x67\x00\x00\x00\x27\x00\x6e\x00\x6e\x00\x3e\x01\x8e\x00\x9d\x00\x00\x00\x00\x00\x7a\x00\x9a\x00\x00\x00\x77\x00\x01\x00\xa0\x00\x01\x00\x88\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\xa4\x00\xa5\x00\x01\x00\xae\x00\x00\x00\xf9\xff\xb7\x00\x00\x00\x00\x00\x14\x00\x14\x00\x14\x00\x14\x00\x14\x00\x14\x00\x14\x00\x14\x00\x14\x00\x14\x00\x14\x00\x14\x00\x01\x00\x01\x00\x00\x00\x00\x00\x00\x00\xb7\x00\x00\x00\x00\x00\x00\x00\xbb\x00\x00\x00\x7e\x00\x7e\x00\x7e\x00\x7e\x00\x7e\x00\x78\x00\x78\x00\x7e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x58\x04\xfd\xff\x00\x00\x00\x00\xf8\xff\xc7\x00\xf7\xff\xc9\x00\x0b\x00\x00\x00\x0c\x00\xc0\x00\x00\x00\x00\x00\xad\x00\x00\x00\xc3\x00\x00\x00\x00\x00\xb2\x00\x01\x00\xed\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc5\x00\xb2\x00\xb3\x00\x00\x00\x01\x00\xea\x00\xe3\x00\xc8\x00\x85\x00\xc2\x00\xc2\x00\x01\x00\x00\x00\x00\x00\x01\x00\x00\x00\xcd\x00\x01\x00\x00\x00\x1d\x00\xd9\x00\x00\x00\xb2\x00\xda\x00\xd7\x00\xd8\x00\x00\x00\xb2\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc2\x00\xfa\x00\xde\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x29\x00\xe0\x00\xc1\x01\x42\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5d\x00\x4b\x04\x97\x00\xbe\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdf\x02\x58\x01\xdb\x01\x31\x04\x0e\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xed\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe9\x00\x00\x00\x12\x00\x00\x00\x55\x00\x00\x00\x00\x00\x36\x00\x16\x01\x1f\x00\x7b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6f\x00\x00\x00\x30\x00\xf5\x01\x00\x00\x0f\x02\x00\x00\x00\x00\x29\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x73\x01\x00\x00\x00\x00\x43\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc9\x03\xe3\x03\xfd\x03\x17\x04\xf9\x02\x95\x03\xaf\x03\x13\x03\x2d\x03\x47\x03\x61\x03\x7b\x03\xc5\x02\xab\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf7\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x43\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa3\x00\x5d\x02\x1b\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbd\x00\x00\x00\x00\x00\x77\x02\x00\x00\x00\x00\x1f\x01\x00\x00\x04\x01\x0d\x01\x91\x02\x00\x00\x00\x00\x8d\x01\x00\x00\x00\x00\xa7\x01\x00\x00\x00\x00\x00\x00\x00\x00\xc6\x00\x72\x00\xfe\x00\x00\x00\x00\x00\xcb\x00\x00\x00\x00\x00\x00\x00\x00\x00\x28\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xbd\xff\x00\x00\x00\x00\x00\x00\x00\x00\xfb\xff\xbf\xff\x00\x00\xca\xff\xc8\xff\xc5\xff\xc2\xff\x00\x00\x00\x00\x00\x00\x00\x00\xbf\xff\xd7\xff\xd5\xff\xd8\xff\xd6\xff\xd4\xff\x00\x00\xf4\xff\xf2\xff\xf0\xff\xee\xff\xe7\xff\xe4\xff\xe0\xff\xde\xff\xdb\xff\xd9\xff\xd2\xff\xd1\xff\xda\xff\xcf\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf5\xff\xf6\xff\xfa\xff\xf9\xff\xf8\xff\xf7\xff\xbf\xff\x00\x00\x00\x00\xa1\xff\x00\x00\x00\x00\x9d\xff\x9e\xff\x8f\xff\x8e\xff\x00\x00\x00\x00\x00\x00\x00\x00\xa7\xff\x00\x00\xbe\xff\xbd\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbc\xff\xa5\xff\x00\x00\xa7\xff\xa4\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9f\xff\x00\x00\x91\xff\x96\xff\x95\xff\x93\xff\x94\xff\x9b\xff\x97\xff\x92\xff\x90\xff\xa0\xff\xcd\xff\x00\x00\x00\x00\x00\x00\x00\x00\xdd\xff\x00\x00\xcf\xff\xdc\xff\xef\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc6\xff\xc7\xff\xc9\xff\x00\x00\xc4\xff\xc3\xff\xc1\xff\xf3\xff\xf1\xff\xe8\xff\xe9\xff\xed\xff\xea\xff\xeb\xff\xe5\xff\xe6\xff\xec\xff\xe2\xff\xe3\xff\xe1\xff\xdf\xff\xd0\xff\x00\x00\x00\x00\x98\xff\x99\xff\xcc\xff\x00\x00\x00\x00\x00\x00\x00\x00\x9a\xff\x00\x00\x00\x00\xa6\xff\xa8\xff\xb9\xff\xba\xff\xb3\xff\xb2\xff\xb1\xff\x00\x00\x00\x00\x00\x00\xb0\xff\xaf\xff\xae\xff\xad\xff\xac\xff\x00\x00\x00\x00\xb4\xff\xa9\xff\x00\x00\x00\x00\xb8\xff\x00\x00\x9a\xff\x00\x00\x00\x00\x00\x00\x9c\xff\xce\xff\xcd\xff\xc0\xff\x00\x00\xcd\xff\xcb\xff\x00\x00\x8d\xff\x8b\xff\x00\x00\xb9\xff\x00\x00\xb5\xff\xaa\xff\x00\x00\xab\xff\xbb\xff\xb7\xff\xb6\xff\x00\x00\x00\x00\x00\x00\xd3\xff\x8a\xff\x8c\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x08\x00\x01\x00\x07\x00\x32\x00\x04\x00\x0e\x00\x30\x00\x07\x00\x1c\x00\x09\x00\x14\x00\x1b\x00\x0c\x00\x37\x00\x37\x00\x0f\x00\x10\x00\x00\x00\x08\x00\x08\x00\x07\x00\x07\x00\x09\x00\x04\x00\x1c\x00\x0c\x00\x07\x00\x1b\x00\x09\x00\x10\x00\x00\x00\x0c\x00\x05\x00\x35\x00\x0f\x00\x10\x00\x08\x00\x25\x00\x30\x00\x30\x00\x30\x00\x1b\x00\x35\x00\x2b\x00\x30\x00\x32\x00\x1b\x00\x00\x00\x1f\x00\x1d\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x07\x00\x25\x00\x09\x00\x30\x00\x30\x00\x0c\x00\x1f\x00\x2b\x00\x32\x00\x10\x00\x00\x00\x1a\x00\x1b\x00\x1c\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x07\x00\x1b\x00\x30\x00\x27\x00\x1f\x00\x0c\x00\x1b\x00\x1c\x00\x2c\x00\x10\x00\x00\x00\x25\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x2b\x00\x00\x00\x0c\x00\x1b\x00\x1d\x00\x1e\x00\x10\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x13\x00\x37\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x14\x00\x1c\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x14\x00\x23\x00\x24\x00\x25\x00\x03\x00\x27\x00\x07\x00\x29\x00\x2a\x00\x2b\x00\x09\x00\x13\x00\x32\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x0b\x00\x12\x00\x1c\x00\x07\x00\x0f\x00\x09\x00\x1d\x00\x1e\x00\x0c\x00\x23\x00\x24\x00\x25\x00\x10\x00\x27\x00\x00\x00\x29\x00\x2a\x00\x2b\x00\x20\x00\x21\x00\x22\x00\x37\x00\x07\x00\x32\x00\x07\x00\x14\x00\x09\x00\x07\x00\x20\x00\x0c\x00\x22\x00\x23\x00\x32\x00\x10\x00\x31\x00\x27\x00\x28\x00\x17\x00\x18\x00\x19\x00\x2c\x00\x2d\x00\x2e\x00\x14\x00\x2d\x00\x31\x00\x32\x00\x14\x00\x14\x00\x20\x00\x09\x00\x22\x00\x23\x00\x00\x00\x08\x00\x05\x00\x27\x00\x28\x00\x20\x00\x21\x00\x22\x00\x2c\x00\x2d\x00\x2e\x00\x07\x00\x1c\x00\x09\x00\x32\x00\x1b\x00\x0c\x00\x08\x00\x07\x00\x1f\x00\x10\x00\x21\x00\x14\x00\x17\x00\x18\x00\x19\x00\x26\x00\x2c\x00\x17\x00\x29\x00\x2a\x00\x20\x00\x21\x00\x22\x00\x00\x00\x1c\x00\x20\x00\x30\x00\x22\x00\x23\x00\x20\x00\x21\x00\x22\x00\x00\x00\x28\x00\x20\x00\x21\x00\x22\x00\x2c\x00\x2d\x00\x2e\x00\x0e\x00\x08\x00\x13\x00\x32\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x32\x00\x2e\x00\x13\x00\x24\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x23\x00\x00\x00\x2e\x00\x2c\x00\x27\x00\x30\x00\x29\x00\x2a\x00\x2b\x00\x23\x00\x00\x00\x14\x00\x31\x00\x27\x00\x03\x00\x29\x00\x2a\x00\x2b\x00\x28\x00\x00\x00\x13\x00\x21\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x03\x00\x00\x00\x13\x00\x23\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x23\x00\x00\x00\xff\xff\xff\xff\x27\x00\xff\xff\x29\x00\x2a\x00\x2b\x00\x23\x00\xff\xff\xff\xff\xff\xff\x27\x00\xff\xff\x29\x00\x2a\x00\x2b\x00\xff\xff\xff\xff\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\xff\xff\x06\x00\xff\xff\x23\x00\xff\xff\x0a\x00\xff\xff\x27\x00\x0d\x00\x29\x00\x2a\x00\x2b\x00\x11\x00\x17\x00\x13\x00\x14\x00\x00\x00\x1b\x00\x17\x00\xff\xff\xff\xff\x1f\x00\xff\xff\x21\x00\xff\xff\x1e\x00\xff\xff\xff\xff\x26\x00\xff\xff\xff\xff\x29\x00\x2a\x00\xff\xff\xff\xff\xff\xff\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x2f\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x02\x00\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\xff\xff\xff\xff\x0b\x00\xff\xff\xff\xff\xff\xff\x0f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x15\x00\x16\x00\xff\xff\x18\x00\x19\x00\x1a\x00\x1f\x00\xff\xff\x21\x00\xff\xff\xff\xff\xff\xff\xff\xff\x26\x00\xff\xff\xff\xff\x29\x00\x2a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x8b\x00\x26\x00\x0d\x00\x06\x00\x27\x00\xb5\x00\x75\x00\x28\x00\xa8\x00\x0e\x00\xb3\x00\x61\x00\x0f\x00\xff\xff\xff\xff\x29\x00\x10\x00\x44\x00\xb1\x00\xb0\x00\x0d\x00\x5e\x00\x0e\x00\x27\x00\xb6\x00\x0f\x00\x28\x00\x2a\x00\x0e\x00\x10\x00\x44\x00\x0f\x00\x74\x00\x2f\x00\x29\x00\x10\x00\xc8\x00\x2b\x00\x75\x00\x75\x00\x75\x00\x61\x00\x2f\x00\x2c\x00\x75\x00\x06\x00\x2a\x00\x44\x00\x4e\x00\x68\x00\x06\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x28\x00\x2b\x00\x0e\x00\x75\x00\x75\x00\x0f\x00\x45\x00\x2c\x00\x06\x00\x10\x00\x06\x00\x3f\x00\x40\x00\x41\x00\x06\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x5e\x00\x2a\x00\x75\x00\x43\x00\x96\x00\x5f\x00\x47\x00\x41\x00\x44\x00\x60\x00\x30\x00\x2b\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x2c\x00\x06\x00\x7a\x00\x61\x00\xab\x00\xac\x00\x7b\x00\x06\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\xff\xff\x32\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x30\x00\x5d\x00\x48\x00\x78\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x52\x00\x33\x00\x49\x00\x4a\x00\x69\x00\x4b\x00\x50\x00\x35\x00\x36\x00\x37\x00\x6a\x00\x31\x00\x06\x00\x32\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x6d\x00\x6b\x00\x48\x00\x9a\xff\x6e\x00\x9a\xff\xc4\x00\xac\x00\x9a\xff\x33\x00\x97\x00\x4a\x00\x9a\xff\x4b\x00\x06\x00\x35\x00\x36\x00\x37\x00\x9b\x00\x9c\x00\x9d\x00\xff\xff\x4e\x00\x06\x00\x0d\x00\x9b\x00\x0e\x00\x9a\x00\x9a\xff\x0f\x00\x9a\xff\x9a\xff\x06\x00\x10\x00\x99\x00\x9a\xff\x9a\xff\x76\x00\x0a\x00\x0b\x00\x9a\xff\x9a\xff\x9a\xff\x95\x00\x93\x00\x9a\xff\x9a\xff\x8f\x00\x8e\x00\x39\x00\x9f\x00\x3a\x00\x3b\x00\x06\x00\x7c\x00\x74\x00\x43\x00\x3c\x00\xa9\x00\x9c\x00\x9d\x00\x4d\x00\x3e\x00\x3f\x00\x0d\x00\x8c\x00\x0e\x00\x06\x00\xa1\x00\x0f\x00\xb4\x00\xb2\x00\xa2\x00\x10\x00\xa3\x00\xaf\x00\x75\x00\x0a\x00\x0b\x00\xa4\x00\xae\x00\xab\x00\xa5\x00\xa6\x00\xc0\x00\x9c\x00\x9d\x00\x30\x00\xc2\x00\x39\x00\x75\x00\x3a\x00\x3b\x00\xc5\x00\x9c\x00\x9d\x00\x30\x00\x3c\x00\xc2\x00\x9c\x00\x9d\x00\x3d\x00\x3e\x00\x3f\x00\xbe\x00\xbf\x00\x31\x00\x06\x00\x32\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x06\x00\xb8\x00\x31\x00\xc7\x00\x32\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x33\x00\x30\x00\x3f\x00\xae\x00\x34\x00\x75\x00\x35\x00\x36\x00\x37\x00\x33\x00\x30\x00\xcb\x00\xca\x00\x50\x00\x61\x00\x35\x00\x36\x00\x37\x00\x52\x00\x46\x00\x31\x00\xb6\x00\x32\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xa6\x00\xbc\x00\x31\x00\xc3\x00\x32\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x33\x00\x30\x00\x00\x00\x00\x00\xbb\x00\x00\x00\x35\x00\x36\x00\x37\x00\x33\x00\x00\x00\x00\x00\x00\x00\xba\x00\x00\x00\x35\x00\x36\x00\x37\x00\x00\x00\x00\x00\x31\x00\x00\x00\x32\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9f\x00\x00\x00\x54\x00\x00\x00\x33\x00\x00\x00\x55\x00\x00\x00\xcb\x00\x56\x00\x35\x00\x36\x00\x37\x00\x57\x00\xa0\x00\x58\x00\x59\x00\x06\x00\xa1\x00\x5a\x00\x00\x00\x00\x00\xa2\x00\x00\x00\xa3\x00\x00\x00\x5b\x00\x00\x00\x00\x00\xa4\x00\x00\x00\x00\x00\xa5\x00\xa6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x65\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x5c\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x8f\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x90\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x8f\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\xb8\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x8f\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\xc8\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x63\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x64\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x95\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x93\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x91\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x8c\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xa8\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xbf\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xb9\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x7c\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x7d\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x66\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x85\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x82\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x81\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7f\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7e\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x84\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x83\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x89\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x88\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x87\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x86\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x62\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x06\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x77\x00\x20\x00\x21\x00\x22\x00\x6c\x00\x00\x00\x24\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x00\x00\x00\x00\x6d\x00\x00\x00\x00\x00\x00\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6f\x00\x70\x00\x00\x00\x71\x00\x72\x00\x73\x00\xa2\x00\x00\x00\xa3\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa4\x00\x00\x00\x00\x00\xa5\x00\xa6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

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

happy_n_terms = 56 :: Prelude.Int
happy_n_nonterms = 44 :: Prelude.Int

happyReduce_4 = happySpecReduce_1  0# happyReduction_4
happyReduction_4 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn7
		 (Grammatica.Abs.Ident happy_var_1
	)}

happyReduce_5 = happySpecReduce_1  1# happyReduction_5
happyReduction_5 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TC happy_var_1)) -> 
	happyIn8
		 ((read happy_var_1) :: Char
	)}

happyReduce_6 = happySpecReduce_1  2# happyReduction_6
happyReduction_6 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TD happy_var_1)) -> 
	happyIn9
		 ((read happy_var_1) :: Double
	)}

happyReduce_7 = happySpecReduce_1  3# happyReduction_7
happyReduction_7 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
	happyIn10
		 ((read happy_var_1) :: Integer
	)}

happyReduce_8 = happySpecReduce_1  4# happyReduction_8
happyReduction_8 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TL happy_var_1)) -> 
	happyIn11
		 (happy_var_1
	)}

happyReduce_9 = happySpecReduce_1  5# happyReduction_9
happyReduction_9 happy_x_1
	 =  happyIn12
		 (Grammatica.Abs.Boolean_true
	)

happyReduce_10 = happySpecReduce_1  5# happyReduction_10
happyReduction_10 happy_x_1
	 =  happyIn12
		 (Grammatica.Abs.Boolean_false
	)

happyReduce_11 = happySpecReduce_1  6# happyReduction_11
happyReduction_11 happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	happyIn13
		 (happy_var_1
	)}

happyReduce_12 = happySpecReduce_3  6# happyReduction_12
happyReduction_12 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Grammatica.Abs.Or happy_var_1 happy_var_3
	)}}

happyReduce_13 = happySpecReduce_1  7# happyReduction_13
happyReduction_13 happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	happyIn14
		 (happy_var_1
	)}

happyReduce_14 = happySpecReduce_3  7# happyReduction_14
happyReduction_14 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut15 happy_x_3 of { (HappyWrap15 happy_var_3) -> 
	happyIn14
		 (Grammatica.Abs.And happy_var_1 happy_var_3
	)}}

happyReduce_15 = happySpecReduce_1  8# happyReduction_15
happyReduction_15 happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	happyIn15
		 (happy_var_1
	)}

happyReduce_16 = happySpecReduce_2  8# happyReduction_16
happyReduction_16 happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	happyIn15
		 (Grammatica.Abs.Not happy_var_2
	)}

happyReduce_17 = happySpecReduce_1  9# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	happyIn16
		 (happy_var_1
	)}

happyReduce_18 = happySpecReduce_3  9# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn16
		 (Grammatica.Abs.Eq happy_var_1 happy_var_3
	)}}

happyReduce_19 = happySpecReduce_3  9# happyReduction_19
happyReduction_19 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn16
		 (Grammatica.Abs.Neq happy_var_1 happy_var_3
	)}}

happyReduce_20 = happySpecReduce_3  9# happyReduction_20
happyReduction_20 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn16
		 (Grammatica.Abs.Lt happy_var_1 happy_var_3
	)}}

happyReduce_21 = happySpecReduce_3  9# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn16
		 (Grammatica.Abs.LtE happy_var_1 happy_var_3
	)}}

happyReduce_22 = happySpecReduce_3  9# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn16
		 (Grammatica.Abs.Gt happy_var_1 happy_var_3
	)}}

happyReduce_23 = happySpecReduce_3  9# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn16
		 (Grammatica.Abs.GtE happy_var_1 happy_var_3
	)}}

happyReduce_24 = happySpecReduce_1  10# happyReduction_24
happyReduction_24 happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	happyIn17
		 (happy_var_1
	)}

happyReduce_25 = happySpecReduce_3  10# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn17
		 (Grammatica.Abs.Add happy_var_1 happy_var_3
	)}}

happyReduce_26 = happySpecReduce_3  10# happyReduction_26
happyReduction_26 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn17
		 (Grammatica.Abs.Sub happy_var_1 happy_var_3
	)}}

happyReduce_27 = happySpecReduce_1  11# happyReduction_27
happyReduction_27 happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn18
		 (happy_var_1
	)}

happyReduce_28 = happySpecReduce_3  11# happyReduction_28
happyReduction_28 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
	happyIn18
		 (Grammatica.Abs.Mul happy_var_1 happy_var_3
	)}}

happyReduce_29 = happySpecReduce_3  11# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
	happyIn18
		 (Grammatica.Abs.Div happy_var_1 happy_var_3
	)}}

happyReduce_30 = happySpecReduce_3  11# happyReduction_30
happyReduction_30 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
	happyIn18
		 (Grammatica.Abs.Mod happy_var_1 happy_var_3
	)}}

happyReduce_31 = happySpecReduce_1  12# happyReduction_31
happyReduction_31 happy_x_1
	 =  case happyOut20 happy_x_1 of { (HappyWrap20 happy_var_1) -> 
	happyIn19
		 (happy_var_1
	)}

happyReduce_32 = happySpecReduce_3  12# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_1 of { (HappyWrap20 happy_var_1) -> 
	case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
	happyIn19
		 (Grammatica.Abs.Pow happy_var_1 happy_var_3
	)}}

happyReduce_33 = happySpecReduce_1  13# happyReduction_33
happyReduction_33 happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	happyIn20
		 (happy_var_1
	)}

happyReduce_34 = happySpecReduce_2  13# happyReduction_34
happyReduction_34 happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_2 of { (HappyWrap21 happy_var_2) -> 
	happyIn20
		 (Grammatica.Abs.Neg happy_var_2
	)}

happyReduce_35 = happySpecReduce_2  13# happyReduction_35
happyReduction_35 happy_x_2
	happy_x_1
	 =  case happyOut28 happy_x_2 of { (HappyWrap28 happy_var_2) -> 
	happyIn20
		 (Grammatica.Abs.Ref happy_var_2
	)}

happyReduce_36 = happySpecReduce_1  14# happyReduction_36
happyReduction_36 happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	happyIn21
		 (happy_var_1
	)}

happyReduce_37 = happySpecReduce_1  14# happyReduction_37
happyReduction_37 happy_x_1
	 =  case happyOut26 happy_x_1 of { (HappyWrap26 happy_var_1) -> 
	happyIn21
		 (Grammatica.Abs.FCall happy_var_1
	)}

happyReduce_38 = happySpecReduce_1  15# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
	happyIn22
		 (happy_var_1
	)}

happyReduce_39 = happySpecReduce_1  15# happyReduction_39
happyReduction_39 happy_x_1
	 =  case happyOut10 happy_x_1 of { (HappyWrap10 happy_var_1) -> 
	happyIn22
		 (Grammatica.Abs.Int happy_var_1
	)}

happyReduce_40 = happySpecReduce_1  15# happyReduction_40
happyReduction_40 happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	happyIn22
		 (Grammatica.Abs.Char happy_var_1
	)}

happyReduce_41 = happySpecReduce_1  15# happyReduction_41
happyReduction_41 happy_x_1
	 =  case happyOut11 happy_x_1 of { (HappyWrap11 happy_var_1) -> 
	happyIn22
		 (Grammatica.Abs.String happy_var_1
	)}

happyReduce_42 = happySpecReduce_1  15# happyReduction_42
happyReduction_42 happy_x_1
	 =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
	happyIn22
		 (Grammatica.Abs.Float happy_var_1
	)}

happyReduce_43 = happySpecReduce_1  15# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut12 happy_x_1 of { (HappyWrap12 happy_var_1) -> 
	happyIn22
		 (Grammatica.Abs.Bool happy_var_1
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
	 = case happyOut10 happy_x_2 of { (HappyWrap10 happy_var_2) -> 
	case happyOut40 happy_x_4 of { (HappyWrap40 happy_var_4) -> 
	case happyOut27 happy_x_6 of { (HappyWrap27 happy_var_6) -> 
	happyIn22
		 (Grammatica.Abs.GoArrayLit happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_45 = happySpecReduce_1  16# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	happyIn23
		 (happy_var_1
	)}

happyReduce_46 = happySpecReduce_1  17# happyReduction_46
happyReduction_46 happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	happyIn24
		 (happy_var_1
	)}

happyReduce_47 = happySpecReduce_3  18# happyReduction_47
happyReduction_47 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_2 of { (HappyWrap13 happy_var_2) -> 
	happyIn25
		 (happy_var_2
	)}

happyReduce_48 = happySpecReduce_1  18# happyReduction_48
happyReduction_48 happy_x_1
	 =  case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	happyIn25
		 (Grammatica.Abs.Lexpr happy_var_1
	)}

happyReduce_49 = happyReduce 4# 19# happyReduction_49
happyReduction_49 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut27 happy_x_3 of { (HappyWrap27 happy_var_3) -> 
	happyIn26
		 (Grammatica.Abs.Call happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_50 = happySpecReduce_0  20# happyReduction_50
happyReduction_50  =  happyIn27
		 ([]
	)

happyReduce_51 = happySpecReduce_1  20# happyReduction_51
happyReduction_51 happy_x_1
	 =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
	happyIn27
		 ((:[]) happy_var_1
	)}

happyReduce_52 = happySpecReduce_3  20# happyReduction_52
happyReduction_52 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
	case happyOut27 happy_x_3 of { (HappyWrap27 happy_var_3) -> 
	happyIn27
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_53 = happySpecReduce_1  21# happyReduction_53
happyReduction_53 happy_x_1
	 =  case happyOut29 happy_x_1 of { (HappyWrap29 happy_var_1) -> 
	happyIn28
		 (happy_var_1
	)}

happyReduce_54 = happySpecReduce_2  21# happyReduction_54
happyReduction_54 happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_2 of { (HappyWrap22 happy_var_2) -> 
	happyIn28
		 (Grammatica.Abs.Deref happy_var_2
	)}

happyReduce_55 = happySpecReduce_1  22# happyReduction_55
happyReduction_55 happy_x_1
	 =  case happyOut30 happy_x_1 of { (HappyWrap30 happy_var_1) -> 
	happyIn29
		 (happy_var_1
	)}

happyReduce_56 = happySpecReduce_2  22# happyReduction_56
happyReduction_56 happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_2 of { (HappyWrap30 happy_var_2) -> 
	happyIn29
		 (Grammatica.Abs.PreInc happy_var_2
	)}

happyReduce_57 = happySpecReduce_2  22# happyReduction_57
happyReduction_57 happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_2 of { (HappyWrap30 happy_var_2) -> 
	happyIn29
		 (Grammatica.Abs.PreDecr happy_var_2
	)}

happyReduce_58 = happySpecReduce_1  23# happyReduction_58
happyReduction_58 happy_x_1
	 =  case happyOut31 happy_x_1 of { (HappyWrap31 happy_var_1) -> 
	happyIn30
		 (happy_var_1
	)}

happyReduce_59 = happySpecReduce_2  23# happyReduction_59
happyReduction_59 happy_x_2
	happy_x_1
	 =  case happyOut31 happy_x_1 of { (HappyWrap31 happy_var_1) -> 
	happyIn30
		 (Grammatica.Abs.PostInc happy_var_1
	)}

happyReduce_60 = happySpecReduce_2  23# happyReduction_60
happyReduction_60 happy_x_2
	happy_x_1
	 =  case happyOut31 happy_x_1 of { (HappyWrap31 happy_var_1) -> 
	happyIn30
		 (Grammatica.Abs.PostDecr happy_var_1
	)}

happyReduce_61 = happySpecReduce_1  23# happyReduction_61
happyReduction_61 happy_x_1
	 =  case happyOut32 happy_x_1 of { (HappyWrap32 happy_var_1) -> 
	happyIn30
		 (Grammatica.Abs.BasLExpr happy_var_1
	)}

happyReduce_62 = happySpecReduce_3  24# happyReduction_62
happyReduction_62 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut28 happy_x_2 of { (HappyWrap28 happy_var_2) -> 
	happyIn31
		 (happy_var_2
	)}

happyReduce_63 = happyReduce 4# 25# happyReduction_63
happyReduction_63 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut13 happy_x_3 of { (HappyWrap13 happy_var_3) -> 
	happyIn32
		 (Grammatica.Abs.ArrayEl happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_64 = happySpecReduce_1  25# happyReduction_64
happyReduction_64 happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	happyIn32
		 (Grammatica.Abs.Id happy_var_1
	)}

happyReduce_65 = happySpecReduce_1  26# happyReduction_65
happyReduction_65 happy_x_1
	 =  case happyOut34 happy_x_1 of { (HappyWrap34 happy_var_1) -> 
	happyIn33
		 (Grammatica.Abs.Prog happy_var_1
	)}

happyReduce_66 = happySpecReduce_0  27# happyReduction_66
happyReduction_66  =  happyIn34
		 ([]
	)

happyReduce_67 = happySpecReduce_2  27# happyReduction_67
happyReduction_67 happy_x_2
	happy_x_1
	 =  case happyOut35 happy_x_1 of { (HappyWrap35 happy_var_1) -> 
	case happyOut34 happy_x_2 of { (HappyWrap34 happy_var_2) -> 
	happyIn34
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
	 = case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	case happyOut36 happy_x_4 of { (HappyWrap36 happy_var_4) -> 
	case happyOut42 happy_x_6 of { (HappyWrap42 happy_var_6) -> 
	happyIn35
		 (Grammatica.Abs.Dfun happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_69 = happySpecReduce_3  28# happyReduction_69
happyReduction_69 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut38 happy_x_2 of { (HappyWrap38 happy_var_2) -> 
	happyIn35
		 (Grammatica.Abs.DvarGo happy_var_2
	)}

happyReduce_70 = happySpecReduce_0  29# happyReduction_70
happyReduction_70  =  happyIn36
		 ([]
	)

happyReduce_71 = happySpecReduce_1  29# happyReduction_71
happyReduction_71 happy_x_1
	 =  case happyOut37 happy_x_1 of { (HappyWrap37 happy_var_1) -> 
	happyIn36
		 ((:[]) happy_var_1
	)}

happyReduce_72 = happySpecReduce_3  29# happyReduction_72
happyReduction_72 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut37 happy_x_1 of { (HappyWrap37 happy_var_1) -> 
	case happyOut36 happy_x_3 of { (HappyWrap36 happy_var_3) -> 
	happyIn36
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_73 = happySpecReduce_3  30# happyReduction_73
happyReduction_73 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { (HappyWrap7 happy_var_2) -> 
	case happyOut39 happy_x_3 of { (HappyWrap39 happy_var_3) -> 
	happyIn37
		 (Grammatica.Abs.Param happy_var_2 happy_var_3
	)}}

happyReduce_74 = happyReduce 4# 31# happyReduction_74
happyReduction_74 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
	case happyOut13 happy_x_4 of { (HappyWrap13 happy_var_4) -> 
	happyIn38
		 (Grammatica.Abs.VarSpecSingleInit happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}}

happyReduce_75 = happySpecReduce_3  31# happyReduction_75
happyReduction_75 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut13 happy_x_3 of { (HappyWrap13 happy_var_3) -> 
	happyIn38
		 (Grammatica.Abs.VarSpecArrayInit happy_var_1 happy_var_3
	)}}

happyReduce_76 = happySpecReduce_2  31# happyReduction_76
happyReduction_76 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
	happyIn38
		 (Grammatica.Abs.VarSpecSingleNoInit happy_var_1 happy_var_2
	)}}

happyReduce_77 = happySpecReduce_1  32# happyReduction_77
happyReduction_77 happy_x_1
	 =  case happyOut40 happy_x_1 of { (HappyWrap40 happy_var_1) -> 
	happyIn39
		 (Grammatica.Abs.BasTyp happy_var_1
	)}

happyReduce_78 = happySpecReduce_1  32# happyReduction_78
happyReduction_78 happy_x_1
	 =  case happyOut41 happy_x_1 of { (HappyWrap41 happy_var_1) -> 
	happyIn39
		 (Grammatica.Abs.CompType happy_var_1
	)}

happyReduce_79 = happySpecReduce_1  33# happyReduction_79
happyReduction_79 happy_x_1
	 =  happyIn40
		 (Grammatica.Abs.BasicType_bool
	)

happyReduce_80 = happySpecReduce_1  33# happyReduction_80
happyReduction_80 happy_x_1
	 =  happyIn40
		 (Grammatica.Abs.BasicType_char
	)

happyReduce_81 = happySpecReduce_1  33# happyReduction_81
happyReduction_81 happy_x_1
	 =  happyIn40
		 (Grammatica.Abs.BasicType_float
	)

happyReduce_82 = happySpecReduce_1  33# happyReduction_82
happyReduction_82 happy_x_1
	 =  happyIn40
		 (Grammatica.Abs.BasicType_int
	)

happyReduce_83 = happySpecReduce_1  33# happyReduction_83
happyReduction_83 happy_x_1
	 =  happyIn40
		 (Grammatica.Abs.BasicType_string
	)

happyReduce_84 = happyReduce 4# 34# happyReduction_84
happyReduction_84 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut10 happy_x_2 of { (HappyWrap10 happy_var_2) -> 
	case happyOut39 happy_x_4 of { (HappyWrap39 happy_var_4) -> 
	happyIn41
		 (Grammatica.Abs.ArrDef happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_85 = happySpecReduce_3  34# happyReduction_85
happyReduction_85 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_3 of { (HappyWrap39 happy_var_3) -> 
	happyIn41
		 (Grammatica.Abs.ArrUnDef happy_var_3
	)}

happyReduce_86 = happySpecReduce_2  34# happyReduction_86
happyReduction_86 happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
	happyIn41
		 (Grammatica.Abs.Pointer happy_var_2
	)}

happyReduce_87 = happySpecReduce_3  35# happyReduction_87
happyReduction_87 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut43 happy_x_2 of { (HappyWrap43 happy_var_2) -> 
	happyIn42
		 (Grammatica.Abs.BlockDecl happy_var_2
	)}

happyReduce_88 = happySpecReduce_0  36# happyReduction_88
happyReduction_88  =  happyIn43
		 ([]
	)

happyReduce_89 = happySpecReduce_2  36# happyReduction_89
happyReduction_89 happy_x_2
	happy_x_1
	 =  case happyOut44 happy_x_1 of { (HappyWrap44 happy_var_1) -> 
	case happyOut43 happy_x_2 of { (HappyWrap43 happy_var_2) -> 
	happyIn43
		 ((:) happy_var_1 happy_var_2
	)}}

happyReduce_90 = happySpecReduce_1  37# happyReduction_90
happyReduction_90 happy_x_1
	 =  case happyOut35 happy_x_1 of { (HappyWrap35 happy_var_1) -> 
	happyIn44
		 (Grammatica.Abs.DeclItem happy_var_1
	)}

happyReduce_91 = happySpecReduce_1  37# happyReduction_91
happyReduction_91 happy_x_1
	 =  case happyOut46 happy_x_1 of { (HappyWrap46 happy_var_1) -> 
	happyIn44
		 (Grammatica.Abs.StmtItem happy_var_1
	)}

happyReduce_92 = happySpecReduce_0  38# happyReduction_92
happyReduction_92  =  happyIn45
		 ([]
	)

happyReduce_93 = happySpecReduce_2  38# happyReduction_93
happyReduction_93 happy_x_2
	happy_x_1
	 =  case happyOut46 happy_x_1 of { (HappyWrap46 happy_var_1) -> 
	case happyOut45 happy_x_2 of { (HappyWrap45 happy_var_2) -> 
	happyIn45
		 ((:) happy_var_1 happy_var_2
	)}}

happyReduce_94 = happySpecReduce_1  39# happyReduction_94
happyReduction_94 happy_x_1
	 =  case happyOut42 happy_x_1 of { (HappyWrap42 happy_var_1) -> 
	happyIn46
		 (Grammatica.Abs.Comp happy_var_1
	)}

happyReduce_95 = happySpecReduce_2  39# happyReduction_95
happyReduction_95 happy_x_2
	happy_x_1
	 =  case happyOut26 happy_x_1 of { (HappyWrap26 happy_var_1) -> 
	happyIn46
		 (Grammatica.Abs.ProcCall happy_var_1
	)}

happyReduce_96 = happySpecReduce_2  39# happyReduction_96
happyReduction_96 happy_x_2
	happy_x_1
	 =  case happyOut48 happy_x_1 of { (HappyWrap48 happy_var_1) -> 
	happyIn46
		 (Grammatica.Abs.Jmp happy_var_1
	)}

happyReduce_97 = happySpecReduce_1  39# happyReduction_97
happyReduction_97 happy_x_1
	 =  case happyOut50 happy_x_1 of { (HappyWrap50 happy_var_1) -> 
	happyIn46
		 (Grammatica.Abs.Iter happy_var_1
	)}

happyReduce_98 = happySpecReduce_1  39# happyReduction_98
happyReduction_98 happy_x_1
	 =  case happyOut49 happy_x_1 of { (HappyWrap49 happy_var_1) -> 
	happyIn46
		 (Grammatica.Abs.Sel happy_var_1
	)}

happyReduce_99 = happyReduce 4# 39# happyReduction_99
happyReduction_99 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	case happyOut47 happy_x_2 of { (HappyWrap47 happy_var_2) -> 
	case happyOut13 happy_x_3 of { (HappyWrap13 happy_var_3) -> 
	happyIn46
		 (Grammatica.Abs.Assgn happy_var_1 happy_var_2 happy_var_3
	) `HappyStk` happyRest}}}

happyReduce_100 = happySpecReduce_2  39# happyReduction_100
happyReduction_100 happy_x_2
	happy_x_1
	 =  case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	happyIn46
		 (Grammatica.Abs.LExprStmt happy_var_1
	)}

happyReduce_101 = happySpecReduce_3  39# happyReduction_101
happyReduction_101 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut38 happy_x_2 of { (HappyWrap38 happy_var_2) -> 
	happyIn46
		 (Grammatica.Abs.DeclStmt happy_var_2
	)}

happyReduce_102 = happySpecReduce_3  39# happyReduction_102
happyReduction_102 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	happyIn46
		 (Grammatica.Abs.StmtInc happy_var_1
	)}

happyReduce_103 = happySpecReduce_3  39# happyReduction_103
happyReduction_103 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	happyIn46
		 (Grammatica.Abs.StmtDec happy_var_1
	)}

happyReduce_104 = happySpecReduce_1  40# happyReduction_104
happyReduction_104 happy_x_1
	 =  happyIn47
		 (Grammatica.Abs.Assign
	)

happyReduce_105 = happySpecReduce_1  40# happyReduction_105
happyReduction_105 happy_x_1
	 =  happyIn47
		 (Grammatica.Abs.AssgnMul
	)

happyReduce_106 = happySpecReduce_1  40# happyReduction_106
happyReduction_106 happy_x_1
	 =  happyIn47
		 (Grammatica.Abs.AssgnAdd
	)

happyReduce_107 = happySpecReduce_1  40# happyReduction_107
happyReduction_107 happy_x_1
	 =  happyIn47
		 (Grammatica.Abs.AssgnDiv
	)

happyReduce_108 = happySpecReduce_1  40# happyReduction_108
happyReduction_108 happy_x_1
	 =  happyIn47
		 (Grammatica.Abs.AssgnSub
	)

happyReduce_109 = happySpecReduce_1  40# happyReduction_109
happyReduction_109 happy_x_1
	 =  happyIn47
		 (Grammatica.Abs.AssgnPow
	)

happyReduce_110 = happySpecReduce_1  40# happyReduction_110
happyReduction_110 happy_x_1
	 =  happyIn47
		 (Grammatica.Abs.AssgnAnd
	)

happyReduce_111 = happySpecReduce_1  40# happyReduction_111
happyReduction_111 happy_x_1
	 =  happyIn47
		 (Grammatica.Abs.AssgnOr
	)

happyReduce_112 = happySpecReduce_1  41# happyReduction_112
happyReduction_112 happy_x_1
	 =  happyIn48
		 (Grammatica.Abs.Break
	)

happyReduce_113 = happySpecReduce_1  41# happyReduction_113
happyReduction_113 happy_x_1
	 =  happyIn48
		 (Grammatica.Abs.Continue
	)

happyReduce_114 = happyReduce 5# 42# happyReduction_114
happyReduction_114 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_3 of { (HappyWrap13 happy_var_3) -> 
	case happyOut46 happy_x_5 of { (HappyWrap46 happy_var_5) -> 
	happyIn49
		 (Grammatica.Abs.IfNoElse happy_var_3 happy_var_5
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
	 = case happyOut13 happy_x_3 of { (HappyWrap13 happy_var_3) -> 
	case happyOut46 happy_x_5 of { (HappyWrap46 happy_var_5) -> 
	case happyOut46 happy_x_7 of { (HappyWrap46 happy_var_7) -> 
	happyIn49
		 (Grammatica.Abs.IfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest}}}

happyReduce_116 = happyReduce 5# 43# happyReduction_116
happyReduction_116 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_3 of { (HappyWrap13 happy_var_3) -> 
	case happyOut46 happy_x_5 of { (HappyWrap46 happy_var_5) -> 
	happyIn50
		 (Grammatica.Abs.While happy_var_3 happy_var_5
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
	 = case happyOut46 happy_x_2 of { (HappyWrap46 happy_var_2) -> 
	case happyOut13 happy_x_5 of { (HappyWrap13 happy_var_5) -> 
	happyIn50
		 (Grammatica.Abs.DoWhile happy_var_2 happy_var_5
	) `HappyStk` happyRest}}

happyNewToken action sts stk [] =
	happyDoAction 55# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TS _ 25) -> cont 25#;
	PT _ (TS _ 26) -> cont 26#;
	PT _ (TS _ 27) -> cont 27#;
	PT _ (TS _ 28) -> cont 28#;
	PT _ (TS _ 29) -> cont 29#;
	PT _ (TS _ 30) -> cont 30#;
	PT _ (TS _ 31) -> cont 31#;
	PT _ (TS _ 32) -> cont 32#;
	PT _ (TS _ 33) -> cont 33#;
	PT _ (TS _ 34) -> cont 34#;
	PT _ (TS _ 35) -> cont 35#;
	PT _ (TS _ 36) -> cont 36#;
	PT _ (TS _ 37) -> cont 37#;
	PT _ (TS _ 38) -> cont 38#;
	PT _ (TS _ 39) -> cont 39#;
	PT _ (TS _ 40) -> cont 40#;
	PT _ (TS _ 41) -> cont 41#;
	PT _ (TS _ 42) -> cont 42#;
	PT _ (TS _ 43) -> cont 43#;
	PT _ (TS _ 44) -> cont 44#;
	PT _ (TS _ 45) -> cont 45#;
	PT _ (TS _ 46) -> cont 46#;
	PT _ (TS _ 47) -> cont 47#;
	PT _ (TS _ 48) -> cont 48#;
	PT _ (TS _ 49) -> cont 49#;
	PT _ (TV happy_dollar_dollar) -> cont 50#;
	PT _ (TC happy_dollar_dollar) -> cont 51#;
	PT _ (TD happy_dollar_dollar) -> cont 52#;
	PT _ (TI happy_dollar_dollar) -> cont 53#;
	PT _ (TL happy_dollar_dollar) -> cont 54#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 55# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = ((>>=))
happyReturn :: () => a -> Err a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {(HappyWrap33 x') = happyOut33 x} in x'))

pStmt tks = happySomeParser where
 happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (let {(HappyWrap46 x') = happyOut46 x} in x'))

pRExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (let {(HappyWrap13 x') = happyOut13 x} in x'))

pLExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (let {(HappyWrap28 x') = happyOut28 x} in x'))

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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































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
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Prelude.Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else Prelude.False
         action
          | check     = indexShortOffAddr happyTable off_i
          | Prelude.otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
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
