function Vector2(x = 0, y = 0) constructor
{
    // Explicit instance fields (critical!)
    self.x = x;
    self.y = y;

    // -------------------------
    // Basic arithmetic
    // -------------------------

    static add = function(v)
    {
        return new Vector2(self.x + v.x, self.y + v.y);
    };

    static mul = function(s)
    {
        return new Vector2(self.x * s, self.y * s);
    };

    // -------------------------
    // In-place operations (faster, no allocation)
    // -------------------------

    static iadd = function(v)
    {
        self.x += v.x;
        self.y += v.y;
        return self;
    };

    static imul = function(s)
    {
        self.x *= s;
        self.y *= s;
        return self;
    };

    // -------------------------
    // Vector math
    // -------------------------

    static length = function()
    {
        return sqrt(self.x*self.x + self.y*self.y);
    };

    static lengthSq = function()
    {
        return self.x*self.x + self.y*self.y;
    };

    static normalize = function()
    {
        var len = sqrt(self.x*self.x + self.y*self.y);

        if (len == 0)
            return new Vector2(0,0);

        return new Vector2(self.x / len, self.y / len);
    };

    static dot = function(v)
    {
        return self.x*v.x + self.y*v.y;
    };

    static distance = function(v)
    {
        var dx = self.x - v.x;
        var dy = self.y - v.y;
        return sqrt(dx*dx + dy*dy);
    };

    // -------------------------
    // Utility
    // -------------------------

    static clone = function()
    {
        return new Vector2(self.x, self.y);
    };

    static set = function(nx, ny)
    {
        self.x = nx;
        self.y = ny;
        return self;
    };

    static isZero = function()
    {
        return self.x == 0 && self.y == 0;
    };

    static toString = function()
    {
        return "(" + string(self.x) + ", " + string(self.y) + ")";
    };
}