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
	import mx.core.mx_internal;
	
	import spark.components.Alert;
	import spark.skins.mobile.VScrollBarSkin;
	
	use namespace mx_internal;
	
	public class VScrollBarSkin extends spark.skins.mobile.VScrollBarSkin
	{
	    public function VScrollBarSkin()
	    {
	        super();
	        
	        thumbSkinClass = spark.skins.ios.VScrollBarThumbSkin;
	        
	        // Depending on density set our measured width
	        switch (applicationDPI)
	        {
	            case DPIClassification.DPI_320:
	            {
	                minWidth = 0;
	                break;
	            }
	            case DPIClassification.DPI_240:
	            {
	                minWidth = 0;
	                break;
	            }
	            default:
	            {
	                // default DPI_160
	                minWidth = 0;
	                break;
	            }
	        }
	    }
	}
}