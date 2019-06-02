#include "builder.h"
#include "builder_init.h"
#include "../Entities/guard.h"
#include "config.h"

#include <QDir>

QString readFileName(QXmlStreamReader &reader);
QXmlStreamReader createReader(const QString &path, const QString &fileName);

pcatalogue::SymbolProfile buildSymbolProfile(const QString &fileName, const QString &refId);
pcatalogue::ColorPalette buildColorProfile(const QString &fileName);
line_styles::LineStyle buildLineStyle(const QString &fileName, const QString &refId);
area_fills::SymbolFill buildSymbolFill(const QString &fileName, const QString &refId);

graphic_base::Vector buildVector(QXmlStreamReader &reader);
pcatalogue::ColorProfile buildColor(QXmlStreamReader &reader);




PortrayalCatalogueController PortrayalCatalogueBuilder::build(QFile *path)
{
    QXmlStreamReader reader(path);

    PortrayalCatalogueController pcCtrl;

    while (!reader.atEnd()){
        auto tag = reader.name().toString();
        if (isAllowed(reader, fc_tags::main, tag)){
            auto ref = reader.attributes().value("id").toString();
            auto fileName = readFileName(reader);

            switch (fc_tags::main[tag]) {
                case fc_tags::COLORS_PROFILE : {
                    auto cp = buildColorProfile(fileName);
                    pcCtrl.addColorProfile(ref, cp);
                } break;
                case fc_tags::SYMBOL : {
                    auto sp = buildSymbolProfile(fileName, ref);
                    pcCtrl.addSymbolProfile(ref, sp);
                } break;
                case fc_tags::LINE_STYLE : {
                    auto ls = buildLineStyle(fileName, ref);
                    pcCtrl.addLineStyle(ref, ls);
                } break;
                case fc_tags::AREA_FILL : {
                    auto af = buildSymbolFill(fileName, ref);
                    pcCtrl.addSymbolFill(ref, af);
                } break;
            }
        } else {
            reader.readNextStartElement();
        }
    }
    if (reader.error()){
        qWarning(QString("Some error: %1").arg(reader.errorString()).toLocal8Bit().data());
    }

    return pcCtrl;
}

QString readFileName(QXmlStreamReader &reader)
{
    while (!reader.atEnd()){
        if (reader.name().toString() == "fileName") {
            return reader.readElementText();
        }
        reader.readNextStartElement();
    }
    qWarning("fileName tag is not found");
    return QString();
}

QXmlStreamReader createReader(const QString &path, const QString &fileName)
{
    auto fullPath = QDir(path).filePath(fileName);
    auto file = new QFile(fullPath);
    if (!QFile::exists(path)){
        qCritical("Filed to exisis file");
    }
    if (!file->open(QIODevice::ReadOnly)){
        qCritical("Filed to open file");
    }
    return QXmlStreamReader(file);
}

pcatalogue::SymbolProfile buildSymbolProfile(const QString &fileName, const QString &refId)
{
    auto fullPath = QDir(filenames::catalogues::SYMBOLS).filePath(fileName);

    SymbolProfileBulder builder;
    builder.setPath(fullPath);
    return builder.build();
}

pcatalogue::ColorPalette buildColorProfile(const QString &fileName)
{
    auto reader = createReader(filenames::catalogues::COLORS, fileName);

    ColorPaletteBulder builder;

    while (!reader.atEnd()){
        auto tag = reader.name().toString();
        if (isAllowed(reader, fc_tags::colorProfiles, tag)){
            switch (fc_tags::colorProfiles[tag]) {
                case fc_tags::ColorProfiles::PALETTE : {
                    auto name = reader.attributes().value("name").toString();
                    builder.startNewPalette(name);
                } break;
                case fc_tags::ColorProfiles::ITEM : {
                    auto token = reader.attributes().value("token").toString();
                    auto color = buildColor(reader);
                    builder.addColorProfile(token, color);
                } break;
            }
        }
        reader.readNextStartElement();
    }
    if (reader.error()){
        qWarning(QString("Some error: %1").arg(reader.errorString()).toLocal8Bit().data());
    }
    return builder.build();
}

line_styles::LineStyle buildLineStyle(const QString &fileName, const QString &refId)
{
    auto reader = createReader(filenames::catalogues::LINE_STILES, fileName);

    LineStyleBulder builder;
    builder.setRefId(refId);

    while (!reader.atEnd()){
        auto tag = reader.name().toString();
        if (isAllowed(reader, fc_tags::lineStyle, tag)){
            switch (fc_tags::lineStyle[tag]) {
            case fc_tags::LineStyle::INTERVAL_LENGTH : {
                auto il = reader.readElementText().toDouble();
                builder.setIntervalLength(il);
            } break;
            case fc_tags::LineStyle::PEN : {
                auto width = reader.attributes().value("width").toDouble();
                builder.setWidth(width);
                reader.readNextStartElement();
                auto colorRef = reader.readElementText();
                builder.setColor(colorRef);
            } break;
            case fc_tags::LineStyle::DASH : {
                reader.readNextStartElement();
                auto start = reader.readElementText().toDouble();
                reader.readNextStartElement();
                auto length = reader.readElementText().toDouble();
                builder.addDash(start, length);
            } break;
            case fc_tags::LineStyle::SYMBOL : {
                auto reference = reader.attributes().value("reference").toString();
                reader.readNextStartElement();
                auto position = reader.readElementText().toDouble();
                builder.addLineSymbol(reference, position);
            } break;
            }
        }
        reader.readNextStartElement();
    }
    if (builder.isReady()) {
        return builder.build();
    } else {
        qFatal(("not completly building, fileName=" + fileName).toLocal8Bit());
    }
}

area_fills::SymbolFill buildSymbolFill( const QString &fileName, const QString& refId)
{
    auto reader = createReader(filenames::catalogues::AREA_FILLS, fileName);

    SymbolFillBulder builder;
    builder.setRefIf(refId);

    while (!reader.atEnd()){
        auto tag = reader.name().toString();
        if (isAllowed(reader, fc_tags::areaFills, tag)){
            switch (fc_tags::areaFills[tag]) {
                case fc_tags::AreaFills::AREA_CRS : {
                    auto type = reader.readElementText();
                    builder.setAreaCRSType(type);
                } break;
                case fc_tags::AreaFills::SYMBOL : {
                    auto reference = reader.attributes().value("reference").toString();
                    builder.setSymbolRef(reference);
                } break;
                case fc_tags::AreaFills::V1 : {
                    auto v1 = buildVector(reader);
                    builder.setV1(v1);
                } break;
                case fc_tags::AreaFills::V2 : {
                    auto v2 = buildVector(reader);
                    builder.setV2(v2);
                } break;
            }
        }
        reader.readNextStartElement();
    }
    if (builder.isReady()) {
        return builder.build();
    } else {
        qFatal("not completly building");
    }
}

graphic_base::Vector buildVector(QXmlStreamReader &reader)
{
    double x(0), y(0);
    while (!reader.atEnd()) {
        auto tag = reader.name();
        if (tag == "v1" || tag == "v2"){
            reader.readNextStartElement();
            x = reader.readElementText().toDouble();
            reader.readNextStartElement();
            y = reader.readElementText().toDouble();
            return graphic_base::Vector(x, y);
        }
        reader.readNextStartElement();
    }

}

pcatalogue::ColorProfile buildColor(QXmlStreamReader &reader)
{
    ColorProfileBulder builder;
    while (!reader.atEnd()) {
        auto tag = reader.name();
        if (tag == "srgb"){
            reader.readNextStartElement();
            auto red = reader.readElementText().toInt();
            reader.readNextStartElement();
            auto green = reader.readElementText().toInt();
            reader.readNextStartElement();
            auto blue = reader.readElementText().toInt();
            builder.setR(red);
            builder.setG(green);
            builder.setB(blue);
            return builder.build();
        }
        reader.readNextStartElement();
    }
}
