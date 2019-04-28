#include "gm_compositecurve.h"

GM_CompositeCurve::GM_CompositeCurve(const QVector<Fe2spRef> &curveAssociations)
    :m_curveAssociations(curveAssociations)
{

}

QVector<Fe2spRef> GM_CompositeCurve::curveAssociations() const
{
    return m_curveAssociations;
}
