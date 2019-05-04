#pragma once

class GM_Object
{
public:
    //GM_Object() = default;
    enum Type {COMPOSITE_CURVE, CURVE, CURVE_SEGMENT, MULTIPOINT, POINT, SURFACE};
    virtual Type getType() const = 0;
    virtual ~GM_Object() = default;
};


