package spark.skins.ios
{
	import flash.display.GradientType;
	import flash.geom.Matrix;
	
	import mx.core.mx_internal;
	
	import spark.components.LabelItemRenderer;

	use namespace mx_internal;
	public class LabelItemRenderer extends spark.components.LabelItemRenderer
	{
		public function LabelItemRenderer()
		{
			super();
			percentWidth = 100;
		}
		
		protected override function drawBackground(unscaledWidth:Number, 
										  unscaledHeight:Number):void
		{
			// figure out backgroundColor
			var backgroundColor:*;
			var downColor:* = getStyle("downColor");
			var drawBackground:Boolean = true;
			var opaqueBackgroundColor:* = undefined;
			
			if (down && downColor !== undefined)
			{
				backgroundColor = downColor;
			}
			else if (selected)
			{
				backgroundColor = getStyle("selectionColor");
			}
			else if (hovered)
			{
				backgroundColor = getStyle("rollOverColor");
			}
			else if (showsCaret)
			{
				backgroundColor = getStyle("selectionColor");
			}
			else
			{
				var alternatingColors:Array;
				var alternatingColorsStyle:Object = getStyle("alternatingItemColors");
				
				if (alternatingColorsStyle)
					alternatingColors = (alternatingColorsStyle is Array) ? (alternatingColorsStyle as Array) : [alternatingColorsStyle];
				
				if (alternatingColors && alternatingColors.length > 0)
				{
					// translate these colors into uints
					styleManager.getColorNames(alternatingColors);
					
					backgroundColor = alternatingColors[itemIndex % alternatingColors.length];
				}
				else
				{
					// don't draw background if it is the contentBackgroundColor. The
					// list skin handles the background drawing for us. 
					drawBackground = false;
				}
				
			} 
			
			// draw backgroundColor
			// the reason why we draw it in the case of drawBackground == 0 is for
			// mouse hit testing purposes
			graphics.beginFill(backgroundColor, drawBackground ? 1 : 0);
			graphics.lineStyle();
			graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
			graphics.endFill();
			
			// Selected and down states have a gradient overlay as well
			// as different separators colors/alphas
			/*if (selected || down)
			{
				var colors:Array = [0x000000, 0x000000 ];
				var alphas:Array = [.2, .1];
				var ratios:Array = [0, 255];
				var matrix:Matrix = new Matrix();
				
				// gradient overlay
				matrix.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2, 0, 0 );
				graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matrix);
				graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
				graphics.endFill();
			}
			else */if (drawBackground)
			{
				// If our background is a solid color, use it as the opaqueBackground property
				// for this renderer. This makes scrolling considerably faster.
				var useOpaqueBackground: * = getStyle("useOpaqueBackground") ;        // if not defined, then true
				if (useOpaqueBackground == undefined || useOpaqueBackground == true )
					opaqueBackgroundColor = backgroundColor;
			}
			
			// Draw the separator for the item renderer
			drawBorder(unscaledWidth, unscaledHeight);
			
			opaqueBackground =  opaqueBackgroundColor;
		}
		
		protected override function drawBorder(unscaledWidth:Number, unscaledHeight:Number):void
		{
			var topSeparatorColor:uint;
			var topSeparatorAlpha:Number;
			var bottomSeparatorColor:uint;
			var bottomSeparatorAlpha:Number;
			
			// separators are a highlight on the top and shadow on the bottom
			topSeparatorColor = 0xe6e9ed;
			topSeparatorAlpha = 1;
			bottomSeparatorColor = 0x000000;
			//bottomSeparatorAlpha = .3;
			
			
			// draw separators
			// don't draw top separator for down and selected states
			if (!(selected || down))
			{
				graphics.beginFill(topSeparatorColor, topSeparatorAlpha);
				graphics.drawRect(0, 0, unscaledWidth, 1);
				graphics.endFill();
			}
			
			graphics.beginFill(bottomSeparatorColor, bottomSeparatorAlpha);
			graphics.drawRect(0, unscaledHeight - (isLastItem ? 0 : 1), unscaledWidth, 1);
			graphics.endFill();
			
			
			// add extra separators to the first and last items so that 
			// the list looks correct during the scrolling bounce/pull effect
			// top
			if (itemIndex == 0)
			{
				graphics.beginFill(bottomSeparatorColor, bottomSeparatorAlpha);
				graphics.drawRect(0, -1, unscaledWidth, 1);
				graphics.endFill(); 
			}
			
			// bottom
			if (isLastItem)
			{
				// we want to offset the bottom by 1 so that we don't get
				// a double line at the bottom of the list if there's a 
				// border
				graphics.beginFill(topSeparatorColor, topSeparatorAlpha);
				graphics.drawRect(0, unscaledHeight + 1, unscaledWidth, 1);
				graphics.endFill(); 
			}
		}
		
	}
}