#include "gm_compositecurve.h"

GM_CompositeCurve::GM_CompositeCurve(const QVector<Fe2spRef> &curveAssociations)
    :m_curveAssociations(curveAssociations)
{

}

void GM_CompositeCurve::addCurveAssotiation(const Fe2spRef &curveAssotiation)
{
    m_curveAssociations.push_back(curveAssotiation);
}

const QVector<Fe2spRef>& GM_CompositeCurve::curveAssociations() const
{
    return m_curveAssociations;
}

GM_Object::Type GM_CompositeCurve::getType() const
{
    return GM_Object::COMPOSITE_CURVE;
}
