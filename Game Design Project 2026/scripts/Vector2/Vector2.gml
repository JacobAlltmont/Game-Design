/// @function Vector2(_x,_y)
/// @param {real} _x
/// @param {real} _y
/// @returns {Vector2}
function Vector2(_x, _y) constructor
{
    __type = "Vector2";

    x = _x;
    y = _y;

    /// @param {Vector2} other
    /// @returns {Vector2}
    static add = function(other)
    {
        return new Vector2(x + other.x, y + other.y);
    }

    /// @param {Vector2} other
    /// @returns {Vector2}
    static subtract = function(other)
    {
        return new Vector2(x - other.x, y - other.y);
    }

    /// @param {real} s
    /// @returns {Vector2}
    static scale = function(s)
    {
        return new Vector2(x * s, y * s);
    }

    /// @returns {real}
    static length = function()
    {
        return sqrt(x*x + y*y);
    }

    /// @returns {Vector2}
    static normalize = function()
    {
        var len = sqrt(x*x + y*y);
        return len == 0 ? new Vector2(0,0) : new Vector2(x/len, y/len);
    }

    /// @param {Vector2} other
    /// @returns {real}
    static dot = function(other)
    {
        return x * other.x + y * other.y;
    }
	
	static toArray = function()
	{
		return [x,y]
	}
}
