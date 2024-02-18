---@meta

--- The math library is a standard Lua library that provides functions for manipulating numbers. In Garry's Mod several additional math functions have been added.
math = {}

--- An easing library that allows you to interpolate with various kinds of smoothing [functions](https://easings.net/). To use with Global.Lerp, input what you would to the fraction argument in one of these easing functions and then the output of that into the Global.Lerp fraction argument.
---
--- 	Example usage with Lerp and math.ease.InSine
---
--- -- Define a wrapper function to make it easier to work with
--- local function easedLerp(fraction, from, to)
--- 	return Lerp(math.ease.InSine(fraction), from, to)
--- end
---
--- -- Compare with the non-eased version of Lerp
--- print(easedLerp(0.25, 0, 1))
--- print(Lerp(0.25, 0, 1))
---
--- print(easedLerp(0.25, 0, 5))
--- print(Lerp(0.25, 0, 5))
---
---
--- ```
--- 0.076120467488713
--- 0.25
---
--- 0.38060233744357
--- 1.25
--- ```
---
---
---
---
--- 	A brief visual example of different easing methods
---
---
math.ease = {}

---[SHARED AND MENU] Calculates the absolute value of a number (effectively removes any negative sign).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.abs)
---@param x number The number to get the absolute value of.
---@return number # The absolute value.
function math.abs(x) end

---[SHARED AND MENU] Returns the [arccosine](https://en.wikipedia.org/wiki/Arccosine) of the given number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.acos)
---@param cos number Cosine value in range of -1 to 1.
---@return number # An angle in radians, between 0 and pi, which has the given cos value.  nan if the argument is out of range.
function math.acos(cos) end

---[SHARED AND MENU] Calculates the difference between two angles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.AngleDifference)
---@param a number The first angle.
---@param b number The second angle.
---@return number # The difference between the angles between -180 and 180
function math.AngleDifference(a, b) end

---[SHARED AND MENU] Gradually approaches the target value by the specified amount.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Approach)
---@param current number The value we're currently at.
---@param target number The target value. This function will never overshoot this value.
---@param change number The amount that the current value is allowed to change by to approach the target. (It makes no difference whether this is positive or negative.)
---@return number # New current value, closer to the target than it was previously.
function math.Approach(current, target, change) end

---[SHARED AND MENU] Increments an angle towards another by specified rate.
---
--- This function is for numbers representing angles (0-360), NOT Angle objects!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ApproachAngle)
---@param currentAngle number The current angle to increase
---@param targetAngle number The angle to increase towards
---@param rate number The amount to approach the target angle by
---@return number # Modified angle
function math.ApproachAngle(currentAngle, targetAngle, rate) end

---[SHARED AND MENU] Returns the [arcsine](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions) of the given number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.asin)
---@param normal number Sine value in the range of -1 to 1.
---@return number # An angle in radians, in the range -pi/2 to pi/2, which has the given sine value.  nan if the argument is out of range.
function math.asin(normal) end

---[SHARED AND MENU] Returns the [arctangent](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions) of the given number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.atan)
---@param normal number Tangent value.
---@return number # An angle in radians, in the range -pi/2 to pi/2, which has the given tangent.
function math.atan(normal) end

---[SHARED AND MENU] functions like math.atan(y / x), except it also takes into account the quadrant of the angle and so doesn't have a limited range of output.
---
--- The Y argument comes first!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.atan2)
---@param y number Y coordinate.
---@param x number X coordinate.
---@return number # The angle of the line from (0, 0) to (x, y) in radians, in the left-open interval (-pi, pi]
function math.atan2(y, x) end

---[SHARED AND MENU] Converts a binary string into a number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.BinToInt)
---@param string string Binary string to convert
---@return number # Base 10 number.
function math.BinToInt(string) end

---[SHARED AND MENU] Basic code for Bezier-Spline algorithm.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.BSplinePoint)
---@param tDiff number From 0 to 1, where alongside the spline the point will be.
---@param tPoints table A table of Vectors. The amount cannot be less than 4.
---@param tMax number Just leave this at 1.
---@return Vector # Point on Bezier curve, related to tDiff.
function math.BSplinePoint(tDiff, tPoints, tMax) end

---[SHARED AND MENU] Use math.BSplinePoint instead.
---
--- Basic code for Bezier-Spline algorithm, helper function for math.BSplinePoint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.calcBSplineN)
---@param i number
---@param k number Sending in a value < 1 will result in an infinite loop.
---@param t number
---@param tinc number
---@return number #
function math.calcBSplineN(i, k, t, tinc) end

---[SHARED AND MENU] Ceils or rounds a number up.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ceil)
---@param number number The number to be rounded up.
---@return number # ceiled numbers
function math.ceil(number) end

---[SHARED AND MENU] Cubic Hermite spline algorithm.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.CHSpline)
---@param frac number From 0 to 1, where alongside the spline the point will be.
---@param point0 Vector First point for the spline.
---@param tan0 Vector Tangent for the first point for the spline.
---@param point1 Vector Second point for the spline.
---@param tan1 Vector Tangent for the second point for the spline.
---@return Vector # Point on the cubic Hermite spline, at given fraction.
function math.CHSpline(frac, point0, tan0, point1, tan1) end

---[SHARED AND MENU] Clamps a number between a minimum and maximum value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Clamp)
---@param input number The number to clamp.
---@param min number The minimum value, this function will **never** return a number less than this.
---@param max number The maximum value, this function will **never** return a number greater than this.
---@return number # The clamped value.
function math.Clamp(input, min, max) end

---[SHARED AND MENU] Returns the [cosine](https://en.wikipedia.org/wiki/Trigonometric_functions#cos) of given angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.cos)
---@param number number Angle in radians
---@return number # Cosine of given angle
function math.cos(number) end

---[SHARED AND MENU] Returns the [hyperbolic cosine](https://en.wikipedia.org/wiki/Cosh_(mathematical_function)) of the given angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.cosh)
---@param number number Angle in radians.
---@return number # The hyperbolic cosine of the given angle.
function math.cosh(number) end

---[SHARED AND MENU] Lerp point between 4 control points with cubic bezier.
---
--- See math.QuadraticBezier for a similar function which works with 3 control points.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.CubicBezier)
---@param frac number The fraction for finding the result. This number is clamped between 0 and 1.
---@param p0 Vector First control point
---@param p1 Vector First tangent
---@param p2 Vector Second tangent
---@param p3 Vector Second control point
---@return Vector # Point between control points at the specified fraction
function math.CubicBezier(frac, p0, p1, p2, p3) end

---[SHARED AND MENU] Converts radians to degrees.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.deg)
---@param radians number Value to be converted to degrees.
---@return number # degrees
function math.deg(radians) end

---[SHARED AND MENU] Returns the difference between two points in 2D space. Alias of math.Distance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Dist)
---@param x1 number X position of first point
---@param y1 number Y position of first point
---@param x2 number X position of second point
---@param y2 number Y position of second point
---@return number # Distance between the two points.
---@deprecated You should use math.Distance instead
function math.Dist(x1, y1, x2, y2) end

---[SHARED AND MENU] Returns the difference between two points in 2D space.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Distance)
---@param x1 number X position of first point
---@param y1 number Y position of first point
---@param x2 number X position of second point
---@param y2 number Y position of second point
---@return number # Distance between the two points
function math.Distance(x1, y1, x2, y2) end

---[SHARED AND MENU] Returns the squared difference between two points in 2D space. This is computationally faster than math.Distance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.DistanceSqr)
---@param x1 number X position of first point
---@param y1 number Y position of first point
---@param x2 number X position of second point
---@param y2 number Y position of second point
---@return number # The squared distance between the two points.
function math.DistanceSqr(x1, y1, x2, y2) end

---[SHARED AND MENU] Eases in by reversing the direction of the ease slightly before returning.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InBack)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.InBack(fraction) end

---[SHARED AND MENU] Eases in like a bouncy ball.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InBounce)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.InBounce(fraction) end

---[SHARED AND MENU] Eases in using a circular function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InCirc)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InCirc(fraction) end

---[SHARED AND MENU] Eases in by cubing the fraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InCubic)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InCubic(fraction) end

---[SHARED AND MENU] Eases in like a rubber band.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InElastic)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.InElastic(fraction) end

---[SHARED AND MENU] Eases in using an exponential equation with a base of 2 and where the fraction is used in the exponent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InExpo)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InExpo(fraction) end

---[SHARED AND MENU] Eases in and out by reversing the direction of the ease slightly before returning on both ends.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutBack)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.InOutBack(fraction) end

---[SHARED AND MENU] Eases in and out like a bouncy ball.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutBounce)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.InOutBounce(fraction) end

---[SHARED AND MENU] Eases in and out using a circular function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutCirc)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InOutCirc(fraction) end

---[SHARED AND MENU] Eases in and out by cubing the fraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutCubic)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InOutCubic(fraction) end

---[SHARED AND MENU] Eases in and out like a rubber band.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutElastic)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.InOutElastic(fraction) end

---[SHARED AND MENU] Eases in and out using an exponential equation with a base of 2 and where the fraction is used in the exponent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutExpo)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InOutExpo(fraction) end

---[SHARED AND MENU] Eases in and out by squaring the fraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutQuad)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InOutQuad(fraction) end

---[SHARED AND MENU] Eases in and out by raising the fraction to the power of 4.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutQuart)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InOutQuart(fraction) end

---[SHARED AND MENU] Eases in and out by raising the fraction to the power of 5.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutQuint)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InOutQuint(fraction) end

---[SHARED AND MENU] Eases in and out using math.sin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InOutSine)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InOutSine(fraction) end

---[SHARED AND MENU] Eases in by squaring the fraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InQuad)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InQuad(fraction) end

---[SHARED AND MENU] Eases in by raising the fraction to the power of 4.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InQuart)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InQuart(fraction) end

---[SHARED AND MENU] Eases in by raising the fraction to the power of 5.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InQuint)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InQuint(fraction) end

---[SHARED AND MENU] Eases in using math.sin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.InSine)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.InSine(fraction) end

---[SHARED AND MENU] Eases out by reversing the direction of the ease slightly before finishing.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutBack)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.OutBack(fraction) end

---[SHARED AND MENU] Eases out like a bouncy ball.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutBounce)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.OutBounce(fraction) end

---[SHARED AND MENU] Eases out using a circular function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutCirc)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.OutCirc(fraction) end

---[SHARED AND MENU] Eases out by cubing the fraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutCubic)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.OutCubic(fraction) end

---[SHARED AND MENU] Eases out like a rubber band.
--- 	This doesn't work properly when used with Global.Lerp as it clamps the fraction between 0 and 1. Using your own version of Global.Lerp that is unclamped would be necessary instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutElastic)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value
function math.ease.OutElastic(fraction) end

---[SHARED AND MENU] Eases out using an exponential equation with a base of 2 and where the fraction is used in the exponent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutExpo)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.OutExpo(fraction) end

---[SHARED AND MENU] Eases out by squaring the fraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutQuad)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.OutQuad(fraction) end

---[SHARED AND MENU] Eases out by raising the fraction to the power of 4.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutQuart)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.OutQuart(fraction) end

---[SHARED AND MENU] Eases out by raising the fraction to the power of 5.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutQuint)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.OutQuint(fraction) end

---[SHARED AND MENU] Eases out using math.sin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ease.OutSine)
---@param fraction number Fraction of the progress to ease, from 0 to 1
---@return number # "Eased" Value, from 0 to 1
function math.ease.OutSine(fraction) end

---[SHARED AND MENU] Calculates the progress of a value fraction, taking in to account given easing fractions
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.EaseInOut)
---@param progress number Fraction of the progress to ease, from 0 to 1
---@param easeIn number Fraction of how much easing to begin with
---@param easeOut number Fraction of how much easing to end with
---@return number # "Eased" Value, from 0 to 1
function math.EaseInOut(progress, easeIn, easeOut) end

---[SHARED AND MENU] Returns the x power of the Euler constant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.exp)
---@param exponent number The exponent for the function.
---@return number # e to the specified power
function math.exp(exponent) end

---[SHARED AND MENU] Simple function that calculates [factorial](https://en.wikipedia.org/wiki/Factorial) of a whole number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Factorial)
---@param val_in number An whole number to get a factorial of. Decimal numbers will be treated as whole numbers.
---@return number # The factorial of given number.
function math.Factorial(val_in) end

---[SHARED AND MENU] Floors or rounds a number down.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.floor)
---@param number number The number to be rounded down.
---@return number # floored numbers
function math.floor(number) end

---[SHARED AND MENU] Returns the modulus of the specified values.
---
--- While this is similar to the % operator, **it will return a negative value if the first argument is negative**, whereas the % operator will return a `positive` value **even if the first operand is negative**.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.fmod)
---@param base number The base value.
---@param modulator number The modulator.
---@return number # The calculated modulus.
function math.fmod(base, modulator) end

---[SHARED AND MENU] **Lua reference description**: Returns `m` and `e` such that `x = m2e`, `e` is an integer and the absolute value of `m` is in the range ((0.5, 1) (or zero when x is zero).
---
--- Used to split the number value into a normalized fraction and an exponent. Two values are returned: the first is a multiplier in the range `1/2` (**inclusive**) to `1` (**exclusive**) and the second is an integer exponent.
---
--- The result is such that `x = m*2^e`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.frexp)
---@param x number The value to get the normalized fraction and the exponent from.
---@return number # m, multiplier - between `0.5` and `1`.
---@return number # e, exponent - **always** an integer.
function math.frexp(x) end

---[SHARED AND MENU] Converts an integer to a binary (base-2) string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.IntToBin)
---@param int number Number to be converted.
---@return string # Binary number string. The length of this will always be a multiple of 3.
function math.IntToBin(int) end

---[SHARED AND MENU] Takes a normalised number and returns the floating point representation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.ldexp)
---@param normalizedFraction number The value to get the normalized fraction and the exponent from.
---@param exponent number The value to get the normalized fraction and the exponent from.
---@return number # result
function math.ldexp(normalizedFraction, exponent) end

---[SHARED AND MENU] With one argument, return the natural logarithm of x (to base e).
---
--- With two arguments, return the logarithm of x to the given base, calculated as log(x)/log(base).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.log)
---@param x number The value to get the base from exponent from.
---@param base? number The logarithmic base.
---@return number # Logarithm of x to the given base
function math.log(x, base) end

---[SHARED AND MENU] Returns the base-10 logarithm of x. This is usually more accurate than math.log(x, 10).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.log10)
---@param x number The value to get the base from exponent from.
---@return number # The result.
function math.log10(x) end

---[SHARED AND MENU] Returns the largest value of all arguments.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.max)
---@param ... any Numbers to get the largest from
---@return number # The largest number
function math.max(...) end

---[SHARED AND MENU] Returns the smallest value of all arguments.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.min)
---@param ... any Numbers to get the smallest from.
---@return number # The smallest number
function math.min(...) end

---[SHARED AND MENU] Returns the modulus of the specified values. Same as math.fmod.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.mod)
---@param base number The base value
---@param modulator number Modulator
---@return number # The calculated modulus
---@deprecated This is removed in Lua versions later than what GMod is currently using. You should use the % operator or math.fmod instead.
function math.mod(base, modulator) end

---[SHARED AND MENU] Returns the integral and fractional component of the modulo operation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.modf)
---@param base number The base value.
---@return number # The integral component.
---@return number # The fractional component.
function math.modf(base) end

---[SHARED AND MENU] Normalizes angle, so it returns value between -180 and 180.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.NormalizeAngle)
---@param angle number The angle to normalize, in degrees.
---@return number # The normalized angle, in the range of -180 to 180 degrees.
function math.NormalizeAngle(angle) end

---[SHARED AND MENU] Returns x raised to the power y.
--- In particular, math.pow(1.0, x) and math.pow(x, 0.0) always return 1.0, even when x is a zero or a nan. If both x and y are finite, x is negative, and y is not an integer then math.pow(x, y) is undefined.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.pow)
---@param x number Base.
---@param y number Exponent.
---@return number # y power of x
function math.pow(x, y) end

---[SHARED AND MENU] Lerp point between 3 control points with quadratic bezier.
---
--- See math.CubicBezier for a function which works with 4 control points.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.QuadraticBezier)
---@param frac number The fraction for finding the result. This number is clamped between 0 and 1.
---@param p0 Vector First control point
---@param p1 Vector Tangent
---@param p2 Vector Second control point
---@return Vector # Point between control points at the specified fraction
function math.QuadraticBezier(frac, p0, p1, p2) end

---[SHARED AND MENU] Converts an angle in degrees to it's equivalent in radians.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.rad)
---@param degrees number The angle measured in degrees.
---@return number # radians
function math.rad(degrees) end

---[SHARED AND MENU] Returns a random float between min and max.
---
--- See also math.random
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Rand)
---@param min number The minimum value.
---@param max number The maximum value.
---@return number # Random float between min and max.
function math.Rand(min, max) end

---[SHARED AND MENU] When called without arguments, returns a uniform pseudo-random real number in the range 0 to 1 which includes 0 but excludes 1.
---
--- When called with an integer number m, returns a uniform pseudo-random integer in the range 1 to m inclusive.
---
--- When called with two integer numbers m and n, returns a uniform pseudo-random integer in the range m to n inclusive.
---
--- See also math.Rand
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.random)
---@param m? number
--- If m is the only parameter: upper limit.
---
--- If n is also provided: lower limit.
---
--- If provided, this must be an integer.
---@param n? number Upper limit.
---
--- If provided, this must be an integer.
---@return number # Random value
function math.random(m, n) end

---[SHARED AND MENU] Seeds the random number generator. The same seed will guarantee the same sequence of numbers each time with math.random.
---
--- For shared random values across predicted realms, use util.SharedRandom.
---
--- Incorrect usage of this function will affect `all` random numbers in the game.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.randomseed)
---@param seed number The new seed
function math.randomseed(seed) end

---[SHARED AND MENU] Remaps the value from one range to another
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Remap)
---@param value number The value
---@param inMin number The minimum of the initial range
---@param inMax number The maximum of the initial range
---@param outMin number The minimum of new range
---@param outMax number The maximum of new range
---@return number # The number in the new range
function math.Remap(value, inMin, inMax, outMin, outMax) end

---[SHARED AND MENU] Rounds the given value to the nearest whole number or to the given decimal places.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Round)
---@param value number The value to round.
---@param decimals? number The decimal places to round to.
---@return number # The rounded value.
function math.Round(value, decimals) end

---[SHARED AND MENU] Returns the [sine](https://en.wikipedia.org/wiki/Trigonometric_functions) of given angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.sin)
---@param number number Angle in radians
---@return number # Sine for given angle
function math.sin(number) end

---[SHARED AND MENU] Returns the [hyperbolic sine](https://en.wikipedia.org/wiki/Hyperbolic_functions) of the given angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.sinh)
---@param number number Angle in radians.
---@return number # The hyperbolic sine of the given angle.
function math.sinh(number) end

---[SHARED AND MENU] Snaps a number to the closest multiplicative of given number. See also Angle:SnapTo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.SnapTo)
---@param input number The number to snap.
---@param snapTo number What to snap the input number to.
---@return number # The clamped value.
function math.SnapTo(input, snapTo) end

---[SHARED AND MENU] Returns the square root of the number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.sqrt)
---@param value number Value to get the square root of.
---@return number # squareRoot
function math.sqrt(value) end

---[SHARED AND MENU] Returns the tangent of the given angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.tan)
---@param value number Angle in radians
---@return number # The tangent of the given angle.
function math.tan(value) end

---[SHARED AND MENU] Returns the [hyperbolic tangent](https://en.wikipedia.org/wiki/Hyperbolic_functions) of the given number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.tanh)
---@param number number Angle in radians.
---@return number # The hyperbolic tangent of the given angle.
function math.tanh(number) end

---[SHARED AND MENU] Returns the fraction of where the current time is relative to the start and end times
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.TimeFraction)
---@param start number Start time in seconds
---@param _end number End time in seconds
---@param current number Current time in seconds
---@return number # Fraction
function math.TimeFraction(start, _end, current) end

---[SHARED AND MENU] Trim unwanted decimal places.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/math.Truncate)
---@param num number The number to truncate
---@param digits? number The amount of digits to keep after the point.
---@return number # The result.
function math.Truncate(num, digits) end
