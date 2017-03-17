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

package
{
internal class IOSThemeClasses
{
import spark.skins.ios.ActionBarSkin; ActionBarSkin;
import spark.skins.ios.BeveledBackButtonSkin; BeveledBackButtonSkin;
import spark.skins.ios.BeveledActionButtonSkin; BeveledActionButtonSkin;
// BUG was ButtonSkin, refactor to ViewMenuItemSkin missed
// possibly because "classes to include" was missing IOSThemeClasses
import spark.skins.ios.ViewMenuItemSkin; ViewMenuItemSkin; 
import spark.skins.ios.ViewMenuSkin; ViewMenuSkin;
import spark.skins.ios.TitleWindowSkin; TitleWindowSkin;
import spark.skins.ios.HScrollBarSkin; HScrollBarSkin;
import spark.skins.ios.TabbedViewNavigatorTabBarSkin; TabbedViewNavigatorTabBarSkin;
import spark.skins.ios.TabbedViewNavigatorTabBarTabSkin; TabbedViewNavigatorTabBarTabSkin;
import spark.skins.ios.VScrollBarSkin; VScrollBarSkin;
[Embed(source="fonts/HelveticaNeueCyr/HelveticaNeueCyr-Roman.otf",
                    fontFamily="mainfont",
                    mimeType="application/x-font",
                    embedAsCFF="true")]
private const ACaslonProRegularEmbeddedFont:Class;
[Embed(source="fonts/HelveticaNeueCyr/HelveticaNeueCyr-Bold.otf",
                    fontFamily="mainfont",
					fontWeight="bold",
                    mimeType="application/x-font",
                    embedAsCFF="true")]
private const ACaslonProRegularEmbeddedFontBold:Class;
}
}