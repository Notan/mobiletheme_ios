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
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.Button;
import spark.components.Group;
import spark.components.Panel;
import spark.components.supportClasses.StyleableTextField;
import spark.core.SpriteVisualElement;
import spark.layouts.HorizontalLayout;
import spark.skins.ios160.assets.TitleWindowBackground;
import spark.skins.ios240.assets.TitleWindowBackground;
import spark.skins.ios320.assets.TitleWindowBackground;
import spark.skins.mobile.supportClasses.MobileSkin;

public class TitleWindowSkin extends MobileSkin
{
    public function TitleWindowSkin()
    {
        super();
        
        backgroundAlpha = 0.85;
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
                backgroundClass = spark.skins.ios320.assets.TitleWindowBackground;
                paddingTop = verticalGap = 40;
                paddingLeft = paddingRight = paddingBottom = 12;
                break;
            case DPIClassification.DPI_240:
                backgroundClass = spark.skins.ios240.assets.TitleWindowBackground;
                paddingTop = verticalGap = 30;
                paddingLeft = paddingRight = paddingBottom = 9;
                break;
            default:
                backgroundClass = spark.skins.ios160.assets.TitleWindowBackground;
                paddingTop = verticalGap = 20;
                paddingLeft = paddingRight = paddingBottom = 6;
                break;
        }
    }
    
    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------
    
    protected var background:SpriteVisualElement;
    
    protected var backgroundClass:Object;
    
    protected var backgroundAlpha:Number;
    
    protected var paddingTop:Number;
    
    protected var paddingBottom:Number;
    
    protected var paddingLeft:Number;
    
    protected var paddingRight:Number;
    
    protected var verticalGap:Number;
    
    private var _showControlBar:Boolean = false;
    
    public var hostComponent:Panel;
    
    //--------------------------------------------------------------------------
    //
    //  Skin parts
    //
    //--------------------------------------------------------------------------
    
    public var titleDisplay:StyleableTextField;
    
    public var contentGroup:Group;
    
    public var controlBarGroup:Group;
    
    public var closeButton:Button;
    
    private var titleDisplayWrapper:UIComponent;
    
    /**
     *  @private 
     */ 
    override protected function createChildren():void
    {
        super.createChildren();
        
        if (!background)
        {
            background = new backgroundClass;
            // Set alpha here as a workaround. Can't set alpha on FXG Graphic or Group without losing scale grids.
            background.alpha = backgroundAlpha;
            addChild(background);
        }
        
        if (!titleDisplay)
        {
            titleDisplayWrapper = new UIComponent();
            titleDisplayWrapper.id = "titleDisplay";
            
            titleDisplay = StyleableTextField(createInFontContext(StyleableTextField));
            titleDisplay.styleName = titleDisplayWrapper;
            titleDisplay.editable = false;
            titleDisplay.selectable = false;
            
            titleDisplayWrapper.addChild(titleDisplay);
            addChild(titleDisplayWrapper);
        }
        
        if (!contentGroup)
        {
            contentGroup = new Group();
            contentGroup.id = "contentGroup";
            addChild(contentGroup);
        }
            
        if (!controlBarGroup)
        {
            controlBarGroup = new Group();
            controlBarGroup.id = "controlBarGroup";
            
            var hLayout:HorizontalLayout = new HorizontalLayout();
            hLayout.gap = paddingTop / 4;
            controlBarGroup.layout = hLayout;
            addChild(controlBarGroup);
        }
        
        if (!closeButton)
        {
            closeButton = new Button();
            closeButton.id = "closeButton";
            closeButton.label = "X";
			closeButton.minWidth = 0;
            addChild(closeButton);
        }
    }
    
    /**
     *  @private 
     */ 
    override protected function measure():void
    {
        var controlBarComp:UIComponent = (_showControlBar) ? controlBarGroup : closeButton;
        var controlBarGroupWidth:Number = getElementPreferredWidth(controlBarComp);
        var controlBarGroupHeight:Number = getElementPreferredHeight(controlBarComp);
        
        // max of contentGroup width or titleDisplay or controlBarGroup
        measuredWidth = Math.max(
            getElementPreferredWidth(contentGroup),
            getElementPreferredWidth(titleDisplay),
            controlBarGroupWidth) + (paddingLeft + paddingRight);
        
        // height of contentGroup, titleDisplay and controlBarGroup
        measuredHeight = getElementPreferredHeight(contentGroup) + 
            getElementPreferredHeight(titleDisplay) +
            controlBarGroupHeight +
            (paddingTop + (verticalGap * 2) + paddingBottom);
    }
    
    /**
     *  @private 
     */ 
    override protected function commitCurrentState():void
    {
        super.commitCurrentState();
        
        // commit state-specific values
        alpha = (currentState.indexOf("disabled") == 0) ? 0.5 : 1;
        
        var currentStateShowControlBar:Boolean = currentState.indexOf("WithControlBar") >= 0;
        
        if (!_showControlBar && currentStateShowControlBar)
        {
            // Add controlBarGroup
            addChild(controlBarGroup);
            
            // Remove the closeButton when the controlBarGroup is shown
            if (contains(closeButton))
                removeChild(closeButton);
        }
        else if (!currentStateShowControlBar)
        {
            // Remove controlBarGroup if it was shown
            if (_showControlBar)
                removeChild(controlBarGroup);
            
            // Show the closeButton when the controlBarGroup is empty/hidden
            if (!contains(closeButton))
                addChild(closeButton);
        }
        
        invalidateSize();
        invalidateDisplayList();
        
        _showControlBar = currentStateShowControlBar;
    }
    
    /**
     *  @private 
     */ 
    override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.layoutContents(unscaledWidth, unscaledHeight);
        
        var w:Number = unscaledWidth - paddingLeft - paddingRight;
        
        // set FXG position to fill
        setElementSize(background, unscaledWidth, unscaledHeight);
        setElementPosition(background, 0, 0);
        
        var titleHeight:Number = getElementPreferredHeight(titleDisplay);
        var titleWidth:Number = getElementPreferredWidth(titleDisplay);
        
        // center title
        var titleX:Number = paddingLeft + Math.max(0, (w - titleWidth) / 2);
        
        setElementSize(titleDisplay, titleWidth, titleHeight);
        setElementPosition(titleDisplay, titleX, paddingTop);
        
        var controlBarComp:UIComponent = (_showControlBar) ? controlBarGroup : closeButton;
        
        // controlBarGroup/closeButton is pinned to the bottom
        var controlBarHeight:Number = getElementPreferredHeight(controlBarComp);
        var controlBarY:Number = unscaledHeight - paddingBottom - controlBarHeight;
		if (_showControlBar) {
	        setElementSize(controlBarComp, w, controlBarHeight);
    	    setElementPosition(controlBarComp, paddingLeft, controlBarY);
		} else {
			setElementSize(controlBarComp, getElementPreferredWidth(controlBarComp), controlBarHeight);
			setElementPosition(controlBarComp, w-getElementPreferredWidth(closeButton), controlBarHeight);
		}
        
        // contentGroup fills in the remaining space
        var contentY:Number = paddingTop + titleHeight + verticalGap;
        setElementSize(contentGroup, w, controlBarY - contentY - verticalGap);
        setElementPosition(contentGroup, paddingLeft, contentY);
    }
}
}