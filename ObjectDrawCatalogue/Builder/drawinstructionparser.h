#pragma once

#include <memory>

#include "drawinstructionparser_init.hpp"
#include "../def_encoding.h"


enum GeometryType {
    AREA, POINT, LINE
};


class DrawInstructionParser
{
public:
    using shared_instruction = std::shared_ptr<drawing_instruction::DrawingInstruction>;

    DrawInstructionParser() = default;
    QVector<shared_instruction> build(const QString &featureReference, const def_encode::DrawInstrs& encodedDrawInstrs, GeometryType type);

private:
    void processDrawingCommand(const QString& command, const QStringList& params);
    void processStateCommand(const QString& command, const QStringList& params);

    void processSpatial(const QStringList &params);
    void processClearGeometry();

    std::shared_ptr<drawing_instruction::PointInstruction> processPointInstruction(const QStringList &params);
    std::shared_ptr<drawing_instruction::LineInstruction> processLineInstruction(const QStringList &params);
    std::shared_ptr<drawing_instruction::AreaInstruction> processColorFillInstruction(const QStringList &params);
    std::shared_ptr<drawing_instruction::AreaInstruction> processAreaReferenceInstruction(const QStringList &params);
    std::shared_ptr<drawing_instruction::TextInstruction> processTextnstruction(const QStringList &params);
    std::shared_ptr<drawing_instruction::NullInstruction> processNullInstruction(const QStringList &params);
private:

    QVector<shared_instruction> m_drawIntrs;

    /* DefaultState */
    CommandsInitState m_state;
    GeometryType m_type;
    QString m_featureReference;
};
