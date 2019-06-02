#include "drawing_instructions_controller.h"
#include "../Builder/drawinstructionparser.h"


static DrawInstructionParser instuctParser;


//-----------------------------------------------------------------------------

void DrawingInstructionsController::setDrawInstr(const QString& featureId, const QString& defEncodeDrawInstr, int geometryType)
{
    if (m_drawInstr.contains(featureId)) {
        auto msg = "UPDATE DrawInstructions for featureId: " + featureId;
        qWarning(msg.toLocal8Bit().data());
    }

    GeometryType gt;
    switch (geometryType) {
    case 110: gt = GeometryType::POINT;
        break;
    case 120:
    case 125: gt = GeometryType::LINE ;
        break;
    case 130: gt = GeometryType::AREA;
        break;
    default:
        qFatal(("Unsupported Spatial type (refType) = " + featureId).toLocal8Bit().data());
    }

    m_drawInstr[featureId] = instuctParser.build(featureId, def_encode::DrawInstrs(defEncodeDrawInstr), gt);
}

DrawingInstructionsController::vDrawingInstruction DrawingInstructionsController::drawInstr(const QString& featureId) const
{
    if(!m_drawInstr.contains(featureId)){
        qCritical(QString("in 'm_drawInstr' has no drawing instructions for featureId:'%1'").arg(featureId).toUtf8());
        return {};
    }
    return m_drawInstr.value(featureId);
}

const QMap<QString, DrawingInstructionsController::vDrawingInstruction>& DrawingInstructionsController::drawInstr() const
{
    return m_drawInstr;
}
