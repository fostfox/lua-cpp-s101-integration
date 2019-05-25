#pragma once

#include <QMap>


namespace drawing_instruction {
class DrawingInstruction;

};



class DrawingInstructionsController
{
public:
    using vDrawingInstruction = QVector<drawing_instruction::DrawingInstruction* >;


    DrawingInstructionsController() = default;
    void setDrawInstr(int featureId, const QString& defEncodeDrawInstr);


private:
    QMap<int, vDrawingInstruction> m_drawInstr;
};
