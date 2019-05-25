#include "drawing_instructions_controller.h"

#include "def_encoding.h"
#include "drawinginstruction_package.h"

DrawingInstructionsController::vDrawingInstruction parse(const  def_encode::DrawInstrs& encodedDrawInstrs)
{

}

//-----------------------------------------------------------------------------

void DrawingInstructionsController::setDrawInstr(int featureId, const QString& defEncodeDrawInstr)
{
    if (m_drawInstr.contains(featureId)) {
        auto msg = std::string("UPDATE DrawInstructions for featureId: ") + std::to_string(featureId);
        qWarning(msg.c_str());
    }

    m_drawInstr[featureId] = parse(def_encode::DrawInstrs(defEncodeDrawInstr));
}
