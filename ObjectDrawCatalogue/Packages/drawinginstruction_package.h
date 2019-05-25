#ifndef DRAWINGINSTRUCTION_PACKAGE_H
#define DRAWINGINSTRUCTION_PACKAGE_H

#pragma once

#include "symbol_package.h"
#include "linestyles_package.h"
#include "areafills_package.h"
#include "text_package.h"

#include <QMap>
#include <QVector>
#include <optional>


namespace drawing_instruction {


//!
//! \brief A reference to a feature type
//! \link 9-11.2.3
//!
class FeatureReference
{
public:
    FeatureReference(const QString &ref);
    const QString &reference() const;

private:
    QString m_reference;
};

//!
//! \brief A reference to a spatial type
//! \link 9-11.2.4
//!
class SpatialReference
{
public:
    SpatialReference();
private:
    QString m_reference;
    bool m_forward;
};

//!
//! \brief Abstract base class for all drawing instructions
//! \link 9-11.2.2
//!
class DrawingInstruction
{
public:
    DrawingInstruction(const QString &viewingGroup, const QString &displayPlane, const int &drawingPriority, const FeatureReference &m_featureReference);
    virtual ~DrawingInstruction();

    const QString& viewingGroup() const;
    const QString& displayPlane() const;
    const int& drawingPriority() const;

    std::optional<int> scaleMinimum() const;
    void setScaleMinimum(int scaleMinimum);

    std::optional<int> scaleMaximum() const;
    void setScaleMaximum(int scaleMaximum);

    QVector<SpatialReference> spatialReferences() const;
    void addSpatialReferences(const SpatialReference &spatialReferences);

private:
    QString m_viewingGroup;
    QString m_displayPlane;
    int m_drawingPriority;
    std::optional<int> m_scaleMinimum;
    std::optional<int> m_scaleMaximum;
    FeatureReference m_featureReference;
    QVector<SpatialReference> m_spatialReferences;
};


class NullInstruction : public DrawingInstruction
{
public:
    NullInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference);
};


class PointInstruction : public DrawingInstruction
{
public:
    PointInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference
                     , const Symbol::Symbol &symbol);
private:
    Symbol::Symbol m_symbol;
};


class LineInstruction : public DrawingInstruction
{
public:
    LineInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference
                    , const LineStyles::AbstractLineStyle* lineStyle);
private:
    LineStyles::AbstractLineStyle* m_lineStyle;
};


class AreaInstruction : public DrawingInstruction
{
public:
    AreaInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference
                    , const AreaFills::AbstractAreaFill* areaFill);
private:
    AreaFills::AbstractAreaFill* m_areaFill;
};


class TextInstruction : public DrawingInstruction
{
public:
    TextInstruction(const QString &viewingGroup, const QString &displayPlane, int drawingPriority, const FeatureReference &m_featureReference
                    , const Text::Text* text);
private:
    Text::Text* m_text;
};


//!
//! \brief A ordered set of Drawing Instructions
//!
class DisplayList
{
public:

private:
    QVector<DrawingInstruction* > m_instructions;
};


} // namespace drawing_instruction
#endif // DRAWINGINSTRUCTION_PACKAGE_H
