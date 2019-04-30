#include "drawing_instructions_controller.h"
#include <QDebug>

DrawingInstructions::DrawingInstructions(const std::string &drawingInstructionDEF)
    :m_drawingInstruction(drawingInstructionDEF)
{

}

std::string DrawingInstructions::drawingInstruction() const
{
    return m_drawingInstruction;
}

void DrawingInstructionsController::setDrawInstr(int featureId, DrawingInstructions drawingInstructions)
{
    if (m_drawInstr.contains(featureId)) {
        qWarning() << "UPDATE DrawInstructions for featureId: " << featureId;
    }
    m_drawInstr[featureId] = drawingInstructions;
}

QMap<int, DrawingInstructions> DrawingInstructionsController::drawInstr() const
{
    return m_drawInstr;
}

DrawingInstructions DrawingInstructionsController::drawInstr(int featureId) const
{
    if(!m_drawInstr.contains(featureId)){
        qFatal(QString("in 'm_drawInstr' has no drawing instructions for featureId:'%1'").arg(featureId).toUtf8());
    }
    return m_drawInstr[featureId];
}
