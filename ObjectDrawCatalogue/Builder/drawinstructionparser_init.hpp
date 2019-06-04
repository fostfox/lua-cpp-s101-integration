#pragma once

#include "../Packages/drawinginstruction_package.h"

enum DrawingCommand {
    POINT_INSTRUCTION, LINE_INSTRUCTION, COLOR_FILL, AREA_FILL_REFERENCE,
    TEXT_INSTRUCTION, NULL_INSTRUCTION
};
enum StateCommand {
    VIEWING_GROUP, DISPLAY_PLANE, DRAWING_PRIORITY, SCALE_MINIMUM, SCALE_MAXIMUM, //Visibility
    LOCAL_OFFSET, LINE_PLACEMENT, ROTATION, //Transform
    LINE_STYLE, DASH, //Line Style
    FONT_COLOR, FONT_SIZE, TEXT_ALIGN_HORIZONTAL, TEXT_ALIGN_VERTICAL, // Text Style
    SPATIAL_REFERENCE, CLEAR_GOOMETRY//Geometry

};
const static QMap<QString, DrawingCommand>  drawingCommands = {
    { "PointInstruction",   POINT_INSTRUCTION },
    { "LineInstruction",    LINE_INSTRUCTION },
    { "ColorFill",          COLOR_FILL },
    { "AreaFillReference",  AREA_FILL_REFERENCE },
    { "TextInstruction",    TEXT_INSTRUCTION },
    { "NullInstruction",    NULL_INSTRUCTION },
};
const static QMap<QString, StateCommand>  stateCommands = {
    { "ViewingGroup",      VIEWING_GROUP } ,
    { "DisplayPlane",      DISPLAY_PLANE } ,
    { "DrawingPriority",   DRAWING_PRIORITY } ,
    { "ScaleMinimum",      SCALE_MINIMUM } ,
    { "ScaleMaximum",      SCALE_MAXIMUM } ,
    { "LocalOffset",       LOCAL_OFFSET } ,
    { "LinePlacement",     LINE_PLACEMENT } ,
    { "Rotation",           ROTATION } ,
    { "LineStyle",         LINE_STYLE } ,
    { "Dash",               DASH } ,
    { "FontColor",         FONT_COLOR } ,
    { "FontSize",          FONT_SIZE } ,
    { "TextAlign_Horizontal", TEXT_ALIGN_HORIZONTAL } ,
    { "TextAlign_Vertical", TEXT_ALIGN_VERTICAL } ,
    { "SpatialReference",  SPATIAL_REFERENCE } ,
    { "ClearGeometry", CLEAR_GOOMETRY }
};

//-----------------------------------------

namespace commands_initial_state {
struct VisibilityDefault {
    QString viewingGroup = "";
    QString displayPlane = "";
    int drawingPriority = 0;
    int scaleMinimum = INT_MIN;
    int scaleMaximum = INT_MAX;
};
struct TransformDefault {
    double xOffsetMM = 0;
    double yOffsetMM = 0;
    symbol::LinePlacementMode linePlacementMode = symbol::LinePlacementMode::RELATIVE_MODE;
    double offset = 0.5;
    symbol::AreaPlacementMode areaPlacementMode = symbol::AreaPlacementMode::VISIBLE_PARTS;
    area_fills::AreaCRSType areaCRSType = area_fills::AreaCRSType::GLOBAL_GEOMETRY;
    graphic_base::CRSType rotationCRS = graphic_base::CRSType::PORTRAYAL_CRS;
    double rotation = 0;
    double scaleFactor = 1.0;
};
struct LineStylemDefault {
    std::optional<double> start = {};
    std::optional<double> length = {};
    std::optional<double> reference = {};
    std::optional<double> position = {};
    double rotation = 0;
    graphic_base::CRSType crsType;
    double scaleFactor = 1.0;
    std::optional<QString> name = {};
    std::optional<double> intervalLength = {};
    std::optional<double> width = {};
    std::optional<QString> token = {};
    double transparency = 0.0;
    line_styles::CapStyle capStyle = line_styles::CapStyle::BUTT;
    line_styles::JoinStyle joinStyle = line_styles::JoinStyle::BEVEL;
    double offset = 0.0;
};
struct TextStyleDefault {
    QString fc_token = "";
    double fc_transparency = 0;
    QString fbc_token = "";
    double fbc_transparency = 1;
    double bodySize = 10;
    text_package::FontProportion proportion = text_package::FontProportion::PROPORTIONAL;
    text_package::FontWeight weight = text_package::FontWeight::MEDIUM;
    text_package::FontSlant slant = text_package::FontSlant::UPRIGHT;
    bool serifs = false;
    bool underline = false;
    bool strikethrough = false;
    bool upperline = false;
    QString fontReference = "";
    text_package::HorizontalAlignment horizontalAlignment = text_package::HorizontalAlignment::START;
    text_package::VerticalAlignment verticalAlignment = text_package::VerticalAlignment::BASELINE;
    double verticalOffset = 0;
};
struct  GeometryDefault {
    QVector<drawing_instruction::SpatialReference> spatialRefs;
    static const bool forward_default = true;
    //ClearGeometry
    ///....
};

} // namespace commands_initial_state

struct CommandsInitState {
    commands_initial_state::VisibilityDefault visibility;
    commands_initial_state::TransformDefault transform;
    commands_initial_state::LineStylemDefault lineStylem;
    commands_initial_state::TextStyleDefault textStyle;
    commands_initial_state::GeometryDefault geometry;
};
