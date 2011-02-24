package assets
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------

	/**
	 * EmbededAssets.as class.For obtainning static embeded resources.
	 * @see http://livedocs.adobe.com/flex/3/html/help.html?content=embed_3.html
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Dec 2, 2010 3:16:02 PM
	 */   	 
	public class EmbededAssets
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		//blues
		[Embed(source="./BLUE.swf")]
		public static const BLUE:Class;

		//reds
		[Embed(source="./RED.swf")]
		public static const RED:Class;

		//
		[Embed(source="./icon_toll_gate.swf")]
		public static const ICON_TOLL_GATE:Class;
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
		public function EmbededAssets()
		{
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------

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
