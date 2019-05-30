#include "drawinstructionparser.h"


bool isDrawingCommands(const QString& c) {
    return drawingCommands.contains(c);
}
bool isStateCommands(const QString& c) {
    return stateCommands.contains(c);
}

///-------------------------------------------------------

QVector<DrawInstructionParser::shared_instruction> DrawInstructionParser::build(const QString &featureReference, const def_encode::DrawInstrs& encodedDrawInstrs, GeometryType type)
{
    using namespace drawing_instruction;

    //ResetState
    m_state = CommandsInitState();
    m_type = type;
    m_featureReference = featureReference;

    for (const auto& encodedDI : encodedDrawInstrs.drawInstrs()) {
        const auto& command = encodedDI.command();
        const auto& params = encodedDI.parametrList();

        if (isDrawingCommands(command)){
            processDrawingCommand(command, params);
        } else if (isStateCommands(command)){
            processStateCommand(command, params);
        } else {
            qCritical("Unsupported Command");
        }
    }
    return std::move(m_drawIntrs); //m_drawIntrs need to be erased after build() returned
}

void DrawInstructionParser::processDrawingCommand(const QString &command, const QStringList &params)
{
    using namespace drawing_instruction;
    shared_instruction di;

    switch (drawingCommands[command]) {
    case POINT_INSTRUCTION: {
        di = processPointInstruction(params);
    } break;
    case LINE_INSTRUCTION: {
        di = processLineInstruction(params);
    } break;
    case COLOR_FILL: {
        di = processColorFillInstruction(params);
    } break;
    case AREA_FILL_REFERENCE: {
        di = processAreaReferenceInstruction(params);
    } break;
    case TEXT_INSTRUCTION: {
        di = processTextnstruction(params);
    } break;
    case NULL_INSTRUCTION: {
        di = processNullInstruction(params);
    } break;
    }
    di->setScaleMaximum(m_state.visibility.scaleMaximum);
    di->setScaleMinimum(m_state.visibility.scaleMinimum);

    if (!m_state.geometry.spatialRefs.isEmpty()){
        di->setSpatialReferences(m_state.geometry.spatialRefs);
    }
    m_drawIntrs.push_back(di);
}

void DrawInstructionParser::processStateCommand(const QString &command, const QStringList &params)
{
    const int MAX_ITEM_I = params.size()-1;

    switch (stateCommands[command]) {
     //Visibility
    case VIEWING_GROUP: {
        switch (MAX_ITEM_I){
        case 0: m_state.visibility.viewingGroup = params[0];
        }
    } break;
    case DISPLAY_PLANE: {
        switch (MAX_ITEM_I){
        case 0: m_state.visibility.displayPlane = params[0];
        }
    } break;
    case DRAWING_PRIORITY: {
        switch (MAX_ITEM_I){
        case 0: m_state.visibility.drawingPriority = params[0].toInt();
        }
    } break;
    case SCALE_MINIMUM: {
        switch (MAX_ITEM_I){
        case 0: m_state.visibility.scaleMinimum = params[0].toInt();
        }
    } break;
    case SCALE_MAXIMUM: {
        switch (MAX_ITEM_I){
        case 0: m_state.visibility.scaleMaximum = params[0].toInt();
        }
    } break;
    case LOCAL_OFFSET: {
        switch (MAX_ITEM_I){
        case 1: m_state.transform.yOffsetMM = params[1].toDouble();                             [[fallthrough]];
        case 0: m_state.transform.xOffsetMM = params[0].toDouble();
        }
    } break;
    case LINE_PLACEMENT: {
        switch (MAX_ITEM_I){
        case 1: m_state.transform.offset = params[1].toDouble();                                [[fallthrough]];
        case 0: m_state.transform.linePlacementMode = symbol::toLinePlacementMode(params[0]);
        }
    } break;
    case ROTATION: {
        switch (MAX_ITEM_I){
        case 1: m_state.transform.rotation = params[1].toDouble();                              [[fallthrough]];
        case 0: m_state.transform.rotationCRS = graphic_base::toCRSType(params[0]);
        }
    } break;
    case LINE_STYLE: {
        switch (MAX_ITEM_I){
        case 7: m_state.lineStylem.offset = params[7].toDouble();                               [[fallthrough]];
        case 6: m_state.lineStylem.joinStyle = line_styles::toJoinStyle(params[6]);             [[fallthrough]];
        case 5: m_state.lineStylem.capStyle = line_styles::toCapStyle(params[5]);               [[fallthrough]];
        case 4: m_state.lineStylem.transparency = params[4].toDouble();                         [[fallthrough]];
        case 3: m_state.lineStylem.token = std::make_optional(params[3]);                       [[fallthrough]];
        case 2: m_state.lineStylem.width = std::make_optional(params[2].toDouble());            [[fallthrough]];
        case 1: m_state.lineStylem.intervalLength = std::make_optional(params[1].toDouble());   [[fallthrough]];
        case 0: m_state.lineStylem.name = std::make_optional(params[0]);
        }
    } break;
    case DASH: {
        switch (MAX_ITEM_I){
        case 1: m_state.lineStylem.length = std::make_optional(params[1].toDouble());           [[fallthrough]];
        case 0: m_state.lineStylem.start = std::make_optional(params[0].toDouble());
        }
    } break;

    case FONT_COLOR: {
        switch (MAX_ITEM_I){
        case 1: m_state.textStyle.fc_transparency = params[1].toDouble();                       [[fallthrough]];
        case 0: m_state.textStyle.fc_token = params[0];
        }
    } break;
    case FONT_SIZE: {
        switch (MAX_ITEM_I){
        case 0: m_state.textStyle.bodySize = params[0].toDouble();
        }
    } break;
    case TEXT_ALIGN_HORIZONTAL: {
        switch (MAX_ITEM_I){
        case 0: m_state.textStyle.horizontalAlignment = text_package::toHorizontalAlignment(params[0]);
        }
    } break;
    case TEXT_ALIGN_VERTICAL: { // Text Style
        switch (MAX_ITEM_I){
        case 0: m_state.textStyle.verticalAlignment = text_package::toVerticalAlignment(params[0]);
        }
    } break;
    case SPATIAL_REFERENCE: {
        processSpatial(params);
    } break;
    case CLEAR_GOOMETRY : {
        processClearGeometry();
    } break;
    }
}

void DrawInstructionParser::processSpatial(const QStringList &params)
{
    const int MAX_ITEM_I = params.size()-1;

    auto forward = m_state.geometry.forward_default;

    switch (MAX_ITEM_I){
    case 1: forward  = params[1] == "true" ? true : false;                  [[fallthrough]];
    case 0: m_state.geometry.spatialRefs.push_back({ params[0], forward });
    }
}

void DrawInstructionParser::processClearGeometry()
{
    m_state.geometry.spatialRefs.clear();
}

std::shared_ptr<drawing_instruction::PointInstruction> DrawInstructionParser::processPointInstruction(const QStringList &params)
{
    const auto& reference = params[0];
    symbol::Symbol symbol(
                reference,
                m_state.transform.rotation,
                m_state.transform.rotationCRS,
                graphic_base::Vector(m_state.transform.xOffsetMM,m_state.transform.yOffsetMM)
                );
    switch (m_type) {
    case POINT: {
    } break;
    case LINE: {
        symbol::LineSymbolPlacement lsp(
                    m_state.transform.offset,
                    m_state.transform.linePlacementMode);
        symbol.setLinePlacement(lsp);
    } break;
    case AREA: {
        symbol::AreaSymbolPlacement asp(
                    m_state.transform.areaPlacementMode);
        symbol.setAreaPlacement(asp);
    } break;
    }
    return std::make_shared<drawing_instruction::PointInstruction> (
                m_state.visibility.viewingGroup
                ,m_state.visibility.displayPlane
                ,m_state.visibility.drawingPriority
                ,drawing_instruction::FeatureReference(m_featureReference)
                ,symbol
                );
}

std::shared_ptr<drawing_instruction::LineInstruction> DrawInstructionParser::processLineInstruction(const QStringList &params)
{
    if (m_state.lineStylem.name.has_value()){
        qDebug(("Preset Line Style " + m_state.lineStylem.name.value()).toLocal8Bit().data());
    }
    line_styles::AbstractLineStyle* lineStyle;
    if (params.size() != 1) {
        qCritical("Too mach lineStyle params");
    } else if (!params[0].isEmpty()){
        lineStyle = new line_styles::LineStyleReference(params[0]);
    } else {
        graphic_base::Color color(
                    m_state.lineStylem.token.value(),
                    m_state.lineStylem.transparency
                    );

        graphic_base::Pen pen(
                    m_state.lineStylem.width.value(),
                    color
                    );

        auto* tmplineStyle = new line_styles::LineStyle(
                    m_state.lineStylem.offset,
                    m_state.lineStylem.capStyle,
                    m_state.lineStylem.joinStyle,
                    pen
                    );
        if (m_state.lineStylem.start.has_value() && m_state.lineStylem.length.has_value()){
            line_styles::Dash d(
                        m_state.lineStylem.start.value(),
                        m_state.lineStylem.length.value());
            tmplineStyle->addDash(d);
        }

        if (m_state.lineStylem.intervalLength.has_value()){
            tmplineStyle->setIntervalLength(
                        m_state.lineStylem.intervalLength.value()
                        );
        }
        lineStyle = tmplineStyle;
    }
    return std::make_shared<drawing_instruction::LineInstruction> (
                m_state.visibility.viewingGroup
                ,m_state.visibility.displayPlane
                ,m_state.visibility.drawingPriority
                ,drawing_instruction::FeatureReference(m_featureReference)
                ,lineStyle
                );
}

std::shared_ptr<drawing_instruction::AreaInstruction> DrawInstructionParser::processColorFillInstruction(const QStringList &params)
{           
    QString token = params[0];

    double transparency = 0;
    if (params.size() > 1) transparency = params[1].toDouble();

    graphic_base::Color color(token, transparency);

    auto *colorFill = new area_fills::ColorFill(color);

    return std::make_shared<drawing_instruction::AreaInstruction> (
                m_state.visibility.viewingGroup
                ,m_state.visibility.displayPlane
                ,m_state.visibility.drawingPriority
                ,drawing_instruction::FeatureReference(m_featureReference)
                ,colorFill
                );
}

std::shared_ptr<drawing_instruction::AreaInstruction> DrawInstructionParser::processAreaReferenceInstruction(const QStringList &params)
{
    QString reference = params[0];

    auto *areaFillRef = new area_fills::AreaFillReference(reference);

    return std::make_shared<drawing_instruction::AreaInstruction> (
                m_state.visibility.viewingGroup
                ,m_state.visibility.displayPlane
                ,m_state.visibility.drawingPriority
                ,drawing_instruction::FeatureReference(m_featureReference)
                ,areaFillRef
                );
}

std::shared_ptr<drawing_instruction::TextInstruction> DrawInstructionParser::processTextnstruction(const QStringList &params)
{
    using namespace text_package;

    QString text;
    std::optional<double> textViewingGroup;
    std::optional<double> textPriority;
    const int MAX_ITEM_I = params.size()-1;
    switch (MAX_ITEM_I){
    case 2: textPriority = params[2].toDouble();                [[fallthrough]];
    case 1: textViewingGroup = params[1].toDouble();            [[fallthrough]];
    case 0: text = params[0];
    }
    Text* text_p;
    Font *font = new FontCharacteristics(
                m_state.textStyle.serifs,
                m_state.textStyle.weight,
                m_state.textStyle.slant,
                m_state.textStyle.proportion
                );
    graphic_base::Color foreground(
                m_state.textStyle.fc_token,
                m_state.textStyle.fc_transparency
                );

    TextElement textElem(
                text,
                m_state.textStyle.bodySize,
                m_state.textStyle.verticalOffset,
                font,
                foreground);

    switch (m_type) {
    case LINE: {
        text_p = new TextLine(
                    m_state.textStyle.horizontalAlignment,
                    m_state.textStyle.verticalAlignment,
                    { textElem },
                    m_state.transform.offset,
                    m_state.transform.linePlacementMode
                    );
    } break;
    case POINT: {
        text_p = new TextPoint(
                    m_state.textStyle.horizontalAlignment,
                    m_state.textStyle.verticalAlignment,
                    { textElem },
                    m_state.transform.rotation
                    );
    } break;
    case AREA: {
        TextPoint *tmp = new TextPoint(
                    m_state.textStyle.horizontalAlignment,
                    m_state.textStyle.verticalAlignment,
                    { textElem },
                    m_state.transform.rotation
                    );
        tmp->setAreaPlacement(symbol::AreaSymbolPlacement(m_state.transform.areaPlacementMode));
        text_p = tmp;
    } break;
    }

    return std::make_shared<drawing_instruction::TextInstruction> (
                m_state.visibility.viewingGroup
                ,m_state.visibility.displayPlane
                ,m_state.visibility.drawingPriority
                ,drawing_instruction::FeatureReference(m_featureReference)
                ,text_p
                );
}

std::shared_ptr<drawing_instruction::NullInstruction> DrawInstructionParser::processNullInstruction(const QStringList &params)
{
    return std::make_shared<drawing_instruction::NullInstruction> (
                m_state.visibility.viewingGroup
                ,m_state.visibility.displayPlane
                ,m_state.visibility.drawingPriority
                ,drawing_instruction::FeatureReference(m_featureReference)
                );
}
