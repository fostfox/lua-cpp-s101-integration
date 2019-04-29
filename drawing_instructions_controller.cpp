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
        qDebug() << "WARNING: UPDATE DrawInstructions for featureId: " << featureId;
    }
    m_drawInstr[featureId] = drawingInstructions;
}

QMap<int, DrawingInstructions> DrawingInstructionsController::drawInstr() const
{
    return m_drawInstr;
}

DrawingInstructions DrawingInstructionsController::drawInstr(int featureId) const
{
    return m_drawInstr[featureId];
}
