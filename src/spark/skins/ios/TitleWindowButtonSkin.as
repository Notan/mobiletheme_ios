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
import mx.core.DPIClassification;

import spark.skins.ios160.assets.TitleWindowButton;
import spark.skins.ios160.assets.TitleWindowButton_fill;
import spark.skins.ios240.assets.TitleWindowButton;
import spark.skins.ios240.assets.TitleWindowButton_fill;
import spark.skins.ios320.assets.TitleWindowButton;
import spark.skins.ios320.assets.TitleWindowButton_fill;

public class TitleWindowButtonSkin extends ButtonSkin
{
    private static const DEFAULT_FILL_COLOR:Number = 0x0F1539;
    
    public function TitleWindowButtonSkin()
    {
        super();
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                borderSkin = spark.skins.ios320.assets.TitleWindowButton;
                upBorderSkin = spark.skins.ios320.assets.TitleWindowButton_fill;
                downBorderSkin = spark.skins.ios320.assets.TitleWindowButton_fill;
                
                layoutGap = 10;
                layoutPaddingLeft = 20;
                layoutPaddingRight = 20;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 254;
                measuredDefaultHeight = 86;
                
                labelDisplayShadowOffset = -2;
                
                break;
            }
            case DPIClassification.DPI_240:
            {
                borderSkin = spark.skins.ios240.assets.TitleWindowButton;
                upBorderSkin = spark.skins.ios240.assets.TitleWindowButton_fill;
                downBorderSkin = spark.skins.ios240.assets.TitleWindowButton_fill;
                
                layoutGap = 8;
                layoutPaddingLeft = 15;
                layoutPaddingRight = 15;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 195;
                measuredDefaultHeight = 66;
                
                labelDisplayShadowOffset = -1;
                
                break;
            }
            default:
            {
                borderSkin = spark.skins.ios160.assets.TitleWindowButton;
                upBorderSkin = spark.skins.ios160.assets.TitleWindowButton_fill;
                downBorderSkin = spark.skins.ios160.assets.TitleWindowButton_fill;
                
                layoutGap = 5;
                layoutPaddingLeft = 10;
                layoutPaddingRight = 10;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 127;
                measuredDefaultHeight = 43;
                
                labelDisplayShadowOffset = -1;
                
                break;
            }
        }
    }
    
    override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.drawBackground(unscaledWidth, unscaledHeight);
        
        // FIXME (jasonsj): why doesn't alpha get reset after state change?
        // Set alpha here as a workaround. Can't set alpha on FXG Graphic or Group without losing scale grids.
        border.alpha = borderBackground.alpha = 0.85;
    }
    
    override protected function get defaultFillColor():Number
    {
        return DEFAULT_FILL_COLOR;
    }
}
}