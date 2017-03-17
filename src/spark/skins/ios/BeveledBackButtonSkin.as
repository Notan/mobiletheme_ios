////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2011 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package spark.skins.ios
{
	import flash.display.DisplayObject;
	
	import mx.core.DPIClassification;
	import mx.core.mx_internal;
	
	import spark.skins.mobile.ButtonSkin;
	
	use namespace mx_internal;

/**
 *  iOS-styled ActionBar Button skin for use in the navigationContent
 *  skinPart.
 * 
 *  @see spark.components.ActionBar#navigationContent
 * 
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 2.5 
 *  @productversion Flex 4.5
 */
public class BeveledBackButtonSkin extends spark.skins.mobile.ButtonSkin
{
	private static const DEFAULT_FILL_COLOR:Number = 0xf6f6f6;
	
    public function BeveledBackButtonSkin()
    {
        super();
		
		upBorderSkin = EmptyField;
		borderSkin = EmptyField;
		downBorderSkin = EmptyField;
		
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                layoutBorderSize = 0;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                layoutPaddingLeft = 30;
                layoutPaddingRight = 30;
                measuredDefaultWidth = 60;
                measuredDefaultHeight = 60;
				layoutCornerEllipseSize = 10;
//				borderSkin = spark.skins.ios320.assets.BeveledBackButton;
//              downBorderSkin = spark.skins.ios320.assets.BeveledBackButton_fill;
                
                break;
            }
            case DPIClassification.DPI_240:
            {
                layoutBorderSize = 0;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                layoutPaddingLeft = 22;
                layoutPaddingRight = 22;
                measuredDefaultWidth = 45;
                measuredDefaultHeight = 45;
				layoutCornerEllipseSize = 7;
//				borderSkin = spark.skins.ios240.assets.BeveledBackButton;
//				downBorderSkin = spark.skins.ios240.assets.BeveledBackButton_fill;
                
                break;
            }
            default:
            {
                // 160
                layoutBorderSize = 0;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                layoutPaddingLeft = 15;
                layoutPaddingRight = 15;
                measuredDefaultWidth = 30;
                measuredDefaultHeight = 30;
				layoutCornerEllipseSize = 5;
//				borderSkin = spark.skins.ios160.assets.BeveledBackButton;
//				downBorderSkin = spark.skins.ios160.assets.BeveledBackButton_fill;
				
                break;
            }
        }
        
        // beveled buttons do not scale down
        minHeight = measuredDefaultHeight;
    }
	
	//--------------------------------------------------------------------------
	//
	//  Variables
	//
	//--------------------------------------------------------------------------
	
	protected var borderSkin:Class;
	
	protected var labelDisplayShadowOffset:Number;
	
	protected var colorized:Boolean;
	
	protected var borderBackground:DisplayObject;
	
	//--------------------------------------------------------------------------
	//
	//  Overridden methods
	//
	//--------------------------------------------------------------------------
	
	override protected function createChildren():void
	{
		borderBackground = (new borderSkin() as DisplayObject);
		addChild(borderBackground);
		
		super.createChildren();
	}
	
	override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
	{
		super.layoutContents(unscaledWidth, unscaledHeight);
		
		// move border to 0;
		removeChild(borderBackground);
		addChildAt(borderBackground, 0);
		
		setElementSize(borderBackground, unscaledWidth, unscaledHeight);
		setElementPosition(labelDisplayShadow, labelDisplay.x, labelDisplay.y + labelDisplayShadowOffset);
		labelDisplayShadow.alpha = 0;
	}
	
	override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
	{
		super.drawBackground(unscaledWidth, unscaledHeight);
		
		var chromeColor:uint = getStyle(fillColorStyleName);
		
		// In the down state, the fill shadow is defined in the FXG asset
		graphics.beginFill(chromeColor);
		
		// inset chrome color by BORDER_SIZE
		// bottom line is a shadow
		graphics.drawRoundRect(layoutBorderSize, layoutBorderSize, 
		unscaledWidth - (layoutBorderSize * 2), 
		unscaledHeight - (layoutBorderSize * 2), 
		layoutCornerEllipseSize, layoutCornerEllipseSize);
		graphics.endFill();
		var st:String = getStyle('fontFamily');
		trace('fontFamily:' + st);
	}
	
	protected function get defaultFillColor():Number
	{
		return DEFAULT_FILL_COLOR;
	}
}
}