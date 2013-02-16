/**
 *  GODPAPER Confidential,Copyright 2013. All rights reserved.
 *
 *  Permission is hereby granted, free of charge, to any person obtaining
 *  a copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation
 *  the rights to use, copy, modify, merge, publish, distribute, sub-license,
 *  and/or sell copies of the Software, and to permit persons to whom the
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included
 *  in all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 *  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 *  IN THE SOFTWARE.
 */
package com.godpaper.the_chess_jam.model.vo
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.godpaper.as3.consts.DefaultConstants;
	import com.godpaper.as3.impl.AbstractChessVO;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	
	/**
	 * BishopVO.as class.X-Ray attacks.
	 * @see http://chessprogramming.wikispaces.com/X-ray+Attacks+%28Bitboards%29   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 16, 2013 12:52:19 AM
	 */   	 
	public class BishopVO extends AbstractChessVO
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(BishopVO);
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		public function BishopVO(width:int, height:int, rowIndex:int, colIndex:int, flag:uint=1, identifier:String="")
		{
			super(width, height, rowIndex, colIndex, flag, identifier);
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		/**
		 * @inheritDoc
		 */
		override public function initialization(rowIndex:int, colIndex:int, flag:uint=0, identifier:String=""):void
		{
			// * - *
			// - * -
			// * - *
			//about occupies on diagonal direction.
			//serveral admental
			//west north
			var wn:int = 1;
			while(rowIndex-wn)
			{
				if(colIndex-wn)
				{
					this.occupies.setBitt(rowIndex-wn,colIndex-wn,true);
				}else
				{
					break;
				}
				wn++;
			}
			//west south
			var ws:int = 1;
			while((this.row-ws)>rowIndex)
			{
				if(colIndex-ws)
				{
					this.occupies.setBitt(rowIndex+ws,colIndex-ws,true);
				}else
				{
					break;
				}
				ws++;
			}
			//east south
			var es:int = 1;
			while((this.row-es)>rowIndex)
			{
				if(colIndex+es<this.column)
				{
					this.occupies.setBitt(rowIndex+es,colIndex+es,true);
				}else
				{
					break;
				}
				es++;
			}
			//east north
			var en:int = 1;
			while(rowIndex-en)
			{
				if(colIndex+en<this.column)
				{
					this.occupies.setBitt(rowIndex-en,colIndex+en,true);
				}else
				{
					break;
				}
				en++;
			}
			//about legal moves.
			//			LOG.info("redPieces:{0}",ChessPositionModelLocator.getInstance().redPieces.dump());
			//			LOG.info("bluePieces:{0}",ChessPositionModelLocator.getInstance().bluePieces.dump());
			if(flag==DefaultConstants.FLAG_RED)
			{
				this.moves = this.occupies.xor(this.occupies.and(chessPiecesModel.redPieces));
			}
			if(flag==DefaultConstants.FLAG_BLUE)
			{
				this.moves = this.occupies.xor(this.occupies.and(chessPiecesModel.bluePieces));
			}
			//about attacked captures.
			if(flag==DefaultConstants.FLAG_RED)
			{
				this.captures = this.moves.and(chessPiecesModel.bluePieces);
			}
			if(flag==DefaultConstants.FLAG_BLUE)
			{
				this.captures = this.moves.and(chessPiecesModel.redPieces);
			}
			//
			LOG.debug("occupies:{0}",this.occupies.dump());
			LOG.debug("moves:{0}",this.moves.dump());
			LOG.debug("captures:{0}",this.captures.dump());
		}
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
	}
	
}