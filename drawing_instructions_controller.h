#pragma once

#include <string>
#include <QMap>
#include <QString>

class DrawingInstructions
{
public:
    DrawingInstructions() = default;
    DrawingInstructions(const std::string &drawingInstructionDEF);

    std::string drawingInstruction() const;

private:
    std::string m_drawingInstruction;
};


class DrawingInstructionsController
{
public:
    DrawingInstructionsController() = default;

    void setDrawInstr(int featureId, DrawingInstructions drawingInstructions);

    QMap<int, DrawingInstructions> drawInstr() const;
    DrawingInstructions drawInstr(int featureId) const;

private:
    QMap<int, DrawingInstructions> m_drawInstr;
};
