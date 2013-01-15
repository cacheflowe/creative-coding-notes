### Draw a rectangle in different environments

----
##### Processing(.js)

`fill(255, 0, 0, 1);`
 
`rect(50, 50, 100, 100);`

----
##### Cinder

`gl::color(Color(1.0f, 0.0f, 0.0f));`

`gl::drawSolidRect(Rectf(50, 50, 100, 100));`

----
##### HTML \<canvas\>

`var context = canvas.getContext("2d");`

`context.fillStyle = "rgba(255, 0, 0, 1)";`

`context.fillRect(50, 50, 100, 100);`

----
##### iOS, via CoreGraphics:

`// Inside UIView's drawRect() method`

`CGContextRef context = UIGraphicsGetCurrentContext();`

`CGContextSetFillColorWithColor(context, [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0].CGColor);`

`CGContextFillRect(context, CGRectMake(50, 50, 100, 100));`

----
##### ActionScript 3.0 (Flash)

`var rectangle:Shape = new Shape;`

`rectangle.graphics.beginFill(0xFF0000);`

`rectangle.graphics.drawRect(50, 50, 100, 100);`

