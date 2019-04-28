#include "gm_compositecurve.h"

GM_CompositeCurve::GM_CompositeCurve()
{

}

QVector<Fe2spRef> GM_CompositeCurve::curveAssociations() const
{
    return m_curveAssociations;
}
