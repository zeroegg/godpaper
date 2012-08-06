/**
 *  GODPAPER Confidential,Copyright 2012. All rights reserved.
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
package com.godpaper.chinese_chess_jam.business
{
	import com.godpaper.as3.utils.LogUtil;
	import com.godpaper.chinese_chess_jam.vo.pgn.PGN_VO;
	
	import mx.logging.ILogger;
	import mx.utils.StringUtil;
	
	import org.hamcrest.text.RegExpMatcher;

	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * A parser with PGN(Portable Game Notation) file;
	 * @see https://github.com/mikechambers/as3corelib/tree/master/src/com/adobe/serialization/json   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Aug 3, 2012 1:09:56 PM
	 */   	 
	public class PGN_Parser
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var _source:String;
		private var pgnVO:PGN_VO;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
//		private const WHITESPACE:Vector.<String> = new Vector.<String>(" ","\t","\n","\r","\f");//" \t\n\r\f"
		private const WHITESPACE:String = " \t\n\r\f";
//		private const DIGITS:String = "0123456789";
//		private const FILES:String = "abcdefghABCDEFGH";
//		private const RANKS:String = "12345678";
//		private const PIECES:String = "车马象士将炮兵";
//		private const MOVECHARACTERS:String = FILES + RANKS + PIECES + "xX:-=Oo+#";
//		private const GAMETERMCHARACTERS:String = "01-2/";
		//
		private static const LOG:ILogger = LogUtil.getLogger(PGN_Parser);
		//RegExpressions
		private const REG_EXP_METADATA:RegExp = /\[.*\]$/igms;
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 
		public function get source():String
		{
			return _source;
		}
		
		public function set source(value:String):void
		{
			_source = value;
		}
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
		public function PGN_Parser(source:String="")
		{
			this._source = StringUtil.trim(source);
			this.pgnVO = new PGN_VO();
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		public function parse():void
		{
			var metaLabelStr:String = REG_EXP_METADATA.exec(this.source);
//			LOG.debug(metaLabelStr);
			var metaLabels:Array = metaLabelStr.split("\n");
//			LOG.debug(metaLabels.toString());
			//
			for(var i:int=0;i<metaLabels.length;i++)
			{
				if(String(metaLabels[i]).indexOf(PGN_VO.META_KEY_GAME)!=-1)
				{
					var gameLabels:Array = String(metaLabels[i]).split("\"");
					this.pgnVO.game = gameLabels[1];
					LOG.debug("pgnVO->game:{0}",this.pgnVO.game);
				}
				if(String(metaLabels[i]).indexOf(PGN_VO.META_KEY_EVENT)!=-1)
				{
					var eventLabels:Array = String(metaLabels[i]).split("\"");
					this.pgnVO.event = eventLabels[1];
					LOG.debug("pgnVO->event:{0}",this.pgnVO.event);
				}
				if(String(metaLabels[i]).indexOf(PGN_VO.META_KEY_SITE)!=-1)
				{
					var siteLabels:Array = String(metaLabels[i]).split("\"");
					this.pgnVO.site = siteLabels[1];
					LOG.debug("pgnVO->site:{0}",this.pgnVO.site);
				}
				if(String(metaLabels[i]).indexOf(PGN_VO.META_KEY_DATE)!=-1)
				{
					var dateLabels:Array = String(metaLabels[i]).split("\"");
					this.pgnVO.date = dateLabels[1];
					LOG.debug("pgnVO->date:{0}",this.pgnVO.date);
				}
			}
//			LOG.debug(labelStr);
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