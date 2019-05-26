#pragma once

#include <QMap>
#include <memory>

namespace drawing_instruction {
class DrawingInstruction;

};


class DrawingInstructionsController
{
public:
    using shared_instruction = std::shared_ptr<drawing_instruction::DrawingInstruction>;
    using vDrawingInstruction = QVector<shared_instruction>;


    DrawingInstructionsController() = default;
    void setDrawInstr(const QString &featureId, const QString& defEncodeDrawInstr, int geometryType);
    vDrawingInstruction drawInstr(const QString &featureId) const;


private:
    QMap<QString, vDrawingInstruction> m_drawInstr;
};
