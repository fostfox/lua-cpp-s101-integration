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

std::optional<int> DrawingInstruction::scaleMinimum() const
{
    return m_scaleMinimum;
}

void DrawingInstruction::setScaleMinimum(int scaleMinimum)
{
    m_scaleMinimum = scaleMinimum;
}

std::optional<int> DrawingInstruction::scaleMaximum() const
{
    return m_scaleMaximum;
}

void DrawingInstruction::setScaleMaximum(int scaleMaximum)
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
