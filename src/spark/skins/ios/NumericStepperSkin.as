package spark.skins.ios
{
	import mx.core.DPIClassification;
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TextInput;
	import spark.components.supportClasses.StyleableTextField;
	import spark.layouts.HorizontalLayout;
	import spark.skins.mobile.supportClasses.MobileSkin;
	import spark.skins.spark.NumericStepperDecrementButtonSkin;
	import spark.skins.spark.NumericStepperIncrementButtonSkin;
	import spark.skins.spark.NumericStepperSkin;
	import spark.skins.spark.NumericStepperTextInputSkin;

	public class NumericStepperSkin extends spark.skins.spark.NumericStepperSkin
	{
		/*public var incrementButton:Button;
		public var decrementButton:Button;
		public var textDisplay:TextInput;*/
		/*<s:Button id="incrementButton" right="0" top="0" height="50%" tabEnabled="false" 
		skinClass="spark.skins.spark.NumericStepperIncrementButtonSkin" />
              
			<!--- The default class is NumericStepperDecrementButtonSkin.
					@copy spark.components.Spinner#decrementButton
					@see spark.skins.spark.NumericStepperDecrementButtonSkin -->
			<s:Button id="decrementButton" right="0" bottom="0" height="50%" tabEnabled="false" 
					  skinClass="spark.skins.spark.NumericStepperDecrementButtonSkin" />
								   
			<!--- The default class is NumericStepperTextInputSkin.
					@copy spark.components.NumericStepper#textDisplay
					@see spark.skins.spark.NumericStepperTextInputSkin -->
			<s:TextInput id="textDisplay" left="0" top="0" right="18" bottom="0"
				skinClass="spark.skins.spark.NumericStepperTextInputSkin" />
		*/
		public function NumericStepperSkin()
		{
			super();
			minHeight=23;
			minWidth=40;
			// Depending on density set our measured width
			/*switch (applicationDPI)
			{
				case DPIClassification.DPI_320:
				{
					minHeight = 15;
					break;
				}
				case DPIClassification.DPI_240:
				{
					minHeight = 11;
					break;
				}
				default:
				{
					// default DPI_160
					minHeight = 7;
					break;
				}
			}*/
		}
		
		static private const exclusions:Array = ["textDisplay", "decrementButton", "incrementButton"];
		
		/**
		 * @private
		 */
		override protected function initializationComplete():void
		{
			super.initializationComplete();
		}
		
		private var cornerRadiusChanged:Boolean;
		private var borderStylesChanged:Boolean;
		
		/**
		 *  @private 
		 */ 
		override protected function createChildren():void
		{
			super.createChildren();
			
			if (!incrementButton) {
				incrementButton = new Button();
				incrementButton.id = 'incrementButton';
				incrementButton.right = incrementButton.top = 0;
				incrementButton.percentHeight = 50;
				incrementButton.setStyle("skinClass", NumericStepperIncrementButtonSkin);
				addChild(incrementButton);
			}
			if (!decrementButton) {
				decrementButton = new Button();
				decrementButton.right = incrementButton.bottom = 0;
				decrementButton.id = 'decrementButton';
				decrementButton.percentHeight = 50;
				decrementButton.setStyle("skinClass", NumericStepperDecrementButtonSkin);
				addChild(decrementButton);
			}
			if (!textDisplay) {
				textDisplay = new TextInput();
				textDisplay.left = textDisplay.top = textDisplay.bottom = 0;
				textDisplay.right = 18;
				textDisplay.id = 'textDisplay';
				textDisplay.setStyle("skinClass", NumericStepperTextInputSkin);
				addChild(textDisplay);
			}
		}
		
		/*override protected function measure():void
		{
			var controlIncrementButtonWidth:Number = getElementPreferredWidth(incrementButton);
			var controlDecrementButtonButtonWidth:Number = getElementPreferredWidth(decrementButton);
			var controlTextDisplayHeight:Number = getElementPreferredHeight(textDisplay);
			
			// max of contentGroup width or titleDisplay or controlBarGroup
			measuredWidth = controlIncrementButtonWidth + controlDecrementButtonButtonWidth + controlTextDisplayHeight;
			
			// height of contentGroup, titleDisplay and controlBarGroup
			measuredHeight = controlTextDisplayHeight;
		}*/
		
		
		/**
		 *  @private
		 */
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (cornerRadiusChanged)
			{
				var cr:Number = getStyle("cornerRadius");
				if (incrementButton)
					incrementButton.setStyle("cornerRadius", cr);
				if (decrementButton)
					decrementButton.setStyle("cornerRadius", cr);
				cornerRadiusChanged = false;
			}
			
			if (borderStylesChanged)
			{
				textDisplay.setStyle("borderAlpha", getStyle("borderAlpha"));
				textDisplay.setStyle("borderColor", getStyle("borderColor"));
				textDisplay.setStyle("borderVisible", getStyle("borderVisible"));
				borderStylesChanged = false;
			}
		}
		
		/**
		 *  @private
		 */
		override public function styleChanged(styleProp:String):void
		{
			var allStyles:Boolean = !styleProp || styleProp == "styleName";
			
			super.styleChanged(styleProp);
			
			if (allStyles || styleProp == "cornerRadius")
			{
				cornerRadiusChanged = true;
				invalidateProperties();
			}
			
			if (allStyles || styleProp.indexOf("border") == 0)
			{
				borderStylesChanged = true;
				invalidateProperties();
			}
		}
	}
}