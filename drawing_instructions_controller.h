#pragma once

#include <string>
#include <vector>

class DrawingInstructions
{
public:
    DrawingInstructions() = default;
    DrawingInstructions(const std::string &drawingInstructionDEF);

private:
    std::string m_drawingInstruction;
};


class DrawingInstructionsController
{
public:
    DrawingInstructionsController() = default;

    void setDrawInstr(int featureId, DrawingInstructions drawingInstructions);
};
