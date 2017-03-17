package spark.skins.ios
{
	import mx.core.DPIClassification;
	
	import spark.skins.ios160.assets.Button;
	import spark.skins.ios160.assets.Button_fill;
	import spark.skins.ios240.assets.Button;
	import spark.skins.ios240.assets.Button_fill;
	import spark.skins.ios320.assets.Button;
	import spark.skins.ios320.assets.Button_fill;

	public class CloseButtonTittleWindowSkin extends ButtonSkin
	{
		public function CloseButtonTittleWindowSkin()
		{
			super();
			switch (applicationDPI)
			{
				case DPIClassification.DPI_320:
				{
					borderSkin = spark.skins.ios320.assets.Button;
					upBorderSkin = spark.skins.ios320.assets.Button_fill;
					downBorderSkin = spark.skins.ios320.assets.Button_fill;
					
					layoutGap = 10;
					layoutPaddingLeft = 20;
					layoutPaddingRight = 20;
					layoutPaddingTop = 0;
					layoutPaddingBottom = 0;
					measuredDefaultWidth = 147;//254;
					measuredDefaultHeight = 63;//86;
					
					labelDisplayShadowOffset = 2;
					
					break;
				}
				case DPIClassification.DPI_240:
				{
					borderSkin = spark.skins.ios240.assets.Button;
					upBorderSkin = spark.skins.ios240.assets.Button_fill;
					downBorderSkin = spark.skins.ios240.assets.Button_fill;
					
					layoutGap = 8;
					layoutPaddingLeft = 15;
					layoutPaddingRight = 15;
					layoutPaddingTop = 0;
					layoutPaddingBottom = 0;
					measuredDefaultWidth = 88;//195;
					measuredDefaultHeight = 43;//66;
					
					labelDisplayShadowOffset = 1;
					
					break;
				}
				default:
				{
					borderSkin = spark.skins.ios160.assets.Button;
					upBorderSkin = spark.skins.ios160.assets.Button_fill;
					downBorderSkin = spark.skins.ios160.assets.Button_fill;
					
					layoutGap = 5;
					layoutPaddingLeft = 10;
					layoutPaddingRight = 10;
					layoutPaddingTop = 0;
					layoutPaddingBottom = 0;
					measuredDefaultWidth = 28;//127;
					measuredDefaultHeight = 20;//43;
					
					labelDisplayShadowOffset = 1;
					
					break;
				}
			}
		}
	}
}