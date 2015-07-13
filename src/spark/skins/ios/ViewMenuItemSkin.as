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

import spark.skins.ios160.assets.ViewMenuItem_fillDown;
import spark.skins.ios160.assets.ViewMenuItem_fillUp;
import spark.skins.ios240.assets.ViewMenuItem;
import spark.skins.ios240.assets.ViewMenuItem_fillDown;
import spark.skins.ios240.assets.ViewMenuItem_fillUp;
import spark.skins.ios320.assets.ViewMenuItem;
import spark.skins.ios320.assets.ViewMenuItem_fillDown;
import spark.skins.ios320.assets.ViewMenuItem_fillUp;
import spark.skins.mobile.supportClasses.MobileSkin;

use namespace mx_internal;

public class ViewMenuItemSkin extends ButtonSkin
{
    private static const DEFAULT_FILL_COLOR:Number = 0x282E38;
    
    public function ViewMenuItemSkin()
    {
        super();
        
        useIconStyle = false;
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                borderSkin = spark.skins.ios320.assets.ViewMenuItem;
                upBorderSkin = spark.skins.ios320.assets.ViewMenuItem_fillUp;
                downBorderSkin = spark.skins.ios320.assets.ViewMenuItem_fillUp;
                
                layoutGap = 10;
                layoutPaddingLeft = 20;
                layoutPaddingRight = 20;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 262;
                measuredDefaultHeight = 88;
                
                break;
            }
            case DPIClassification.DPI_240:
            {
                borderSkin = spark.skins.ios240.assets.ViewMenuItem;
                upBorderSkin = spark.skins.ios240.assets.ViewMenuItem_fillUp;
                downBorderSkin = spark.skins.ios240.assets.ViewMenuItem_fillUp;
                
                layoutGap = 8;
                layoutPaddingLeft = 15;
                layoutPaddingRight = 15;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 196;
                measuredDefaultHeight = 66;
                
                break;
            }
            default:
            {
                borderSkin = spark.skins.ios160.assets.ViewMenuItem;
                upBorderSkin = spark.skins.ios160.assets.ViewMenuItem_fillUp;
                downBorderSkin = spark.skins.ios160.assets.ViewMenuItem_fillUp;
                
                layoutGap = 5;
                layoutPaddingLeft = 10;
                layoutPaddingRight = 10;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 131;
                measuredDefaultHeight = 44;
                
                break;
            }
        }
    }
    
    override protected function get defaultFillColor():Number
    {
        return DEFAULT_FILL_COLOR;
    }
}
}