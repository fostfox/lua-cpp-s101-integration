#include "drawinginstruction_package.h"

using namespace drawing_instruction;

drawing_instruction::DrawingInstruction::DrawingInstruction(const QString &viewingGroup, const QString &displayPlane, const int &drawingPriority, const FeatureReference &featureReference)
    :m_viewingGroup(viewingGroup)
    ,m_displayPlane(displayPlane)
    ,m_drawingPriority(drawingPriority)
    ,m_featureReference(featureReference)
{

}

const int &DrawingInstruction::drawingPriority() const
{
    return m_drawingPriority;
}

std::optional<DrawingInstruction::scale_t> DrawingInstruction::scaleMinimum() const
{
    return m_scaleMinimum;
}

void DrawingInstruction::setScaleMinimum(std::optional<scale_t> scaleMinimum)
{
    m_scaleMinimum = scaleMinimum;
}

std::optional<DrawingInstruction::scale_t> DrawingInstruction::scaleMaximum() const
{
    return m_scaleMaximum;
}

void DrawingInstruction::setScaleMaximum(std::optional<scale_t> scaleMaximum)
{
    m_scaleMaximum = scaleMaximum;
}

QVector<SpatialReference> DrawingInstruction::spatialReferences() const
{
    return m_spatialReferences;
}

void DrawingInstruction::addSpatialReferences(const SpatialReference &spatialReferences)
{
    m_spatialReferences.push_back(spatialReferences);
}

const FeatureReference &DrawingInstruction::featureReference() const
{
    return m_featureReference;
}

void DrawingInstruction::setSpatialReferences(const QVector<SpatialReference> &spatialReferences)
{
    m_spatialReferences = spatialReferences;
}

const QString& DrawingInstruction::displayPlane() const
{
    return m_displayPlane;
}

const QString& DrawingInstruction::viewingGroup() const
{
    return m_viewingGroup;
}

FeatureReference::FeatureReference(const QString &ref)
    :m_reference(ref)
{

}

const QString &FeatureReference::reference() const
{
    return m_reference;
}

NullInstruction::NullInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference)
    :DrawingInstruction (viewingGroup, displayPlane, drawingPriority, m_featureReference)
{
}

PointInstruction::PointInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference, const symbol::Symbol &symbol)
    :DrawingInstruction (viewingGroup, displayPlane, drawingPriority, m_featureReference)
    ,m_symbol(symbol)
{
}

symbol::Symbol PointInstruction::symbol() const
{
    return m_symbol;
}

LineInstruction::LineInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference, const line_styles::AbstractLineStyle *lineStyle)
    :DrawingInstruction (viewingGroup, displayPlane, drawingPriority, m_featureReference)
    ,m_lineStyle(lineStyle)
{
}

const line_styles::AbstractLineStyle *LineInstruction::lineStyle() const
{
    return m_lineStyle;
}

AreaInstruction::AreaInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference, const area_fills::AbstractAreaFill *areaFill)
    :DrawingInstruction (viewingGroup, displayPlane, drawingPriority, m_featureReference)
    ,m_areaFill(areaFill)
{

}

const area_fills::AbstractAreaFill *AreaInstruction::areaFill() const
{
    return m_areaFill;
}

TextInstruction::TextInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference, const text_package::Text *text)
    :DrawingInstruction (viewingGroup, displayPlane, drawingPriority, m_featureReference)
    ,m_text(text)
{

}

const text_package::Text *TextInstruction::text() const
{
    return m_text;
}

SpatialReference::SpatialReference(const QString ref, bool forward)
    :m_reference(ref), m_forward(forward)
{

}

const QString &SpatialReference::reference() const
{
    return m_reference;
}

bool SpatialReference::forward() const
{
    return m_forward;
}
