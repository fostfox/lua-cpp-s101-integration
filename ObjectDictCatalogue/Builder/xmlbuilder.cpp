#include "xmlbuilder.h"

#include <QXmlStreamReader>


enum BuildTypes { SimpleAttribute_, ComplexAttribute_,
    Role_, InformationAssociation_, FeatureAssociation_,
    InformationType_, FeatureType_,

    Name, Definition, Code, Alias, ValueType, Label, Remarks, Value, Role,
    Attribute, FeatureUseType, Association, FeatureType, InformationType,
    Lower, Upper,
    ListedValue, SubAttributeBinding, AttributeBinding, FeatureBinding, InformationBinding, PermittedPrimitives,

    Sequential, Nil, Infinite, Ref

};
const static QMap<std::string, BuildTypes> strTypeToBuildType=  {
    { "S100_FC_SimpleAttribute",        SimpleAttribute_ },
    { "S100_FC_ComplexAttribute",       ComplexAttribute_ },
    { "S100_FC_Role",                   Role_ },
    { "S100_FC_InformationAssociation", InformationAssociation_ },
    { "S100_FC_FeatureAssociation",     FeatureAssociation_ },
    { "S100_FC_InformationType",        InformationType_ },
    { "S100_FC_FeatureType",            FeatureType_ },

    { "name",           Name },
    { "definition",     Definition },
    { "code",           Code },
    { "alias",          Alias },
    { "valueType",      ValueType },
    { "label",          Label },
    { "remarks",        Remarks },
    { "value",          Value },
    { "role",           Role },
    { "association",    Association },
    { "featureType",    FeatureType },
    { "informationType",InformationType },


    { "attributeBinding", AttributeBinding },
    { "featureBinding", FeatureBinding },
    { "informationBinding", InformationBinding },
    { "subAttributeBinding", SubAttributeBinding },
    { "listedValue",    ListedValue },
    { "featureUseType", FeatureUseType },
    { "permittedPrimitives", PermittedPrimitives},

    { "lower", Lower },
    { "upper", Upper },
    { "attribute", Attribute },

};



FeatureCatalogueXMLBuilder::FeatureCatalogueXMLBuilder()
{
}

FeatureCatalogueController FeatureCatalogueXMLBuilder::build(QFile* xmlPath)
{
    reader.setDevice(xmlPath);
    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
                case SimpleAttribute_ : {
                    readNext1(&reader);
                    auto sa = buildSimpleAttribute();
                    fc_controller.addSimpleAttr(sa);
                } break;
                case ComplexAttribute_ : {
                    readNext1(&reader);
                    auto ca = buildComplexAttribute();
                    fc_controller.addComplexAttr(ca);
                } break;
                case Role_ : {
                    readNext1(&reader);
                    auto ft = buildRole();
                    fc_controller.addRole(ft);
                } break;
                case InformationAssociation_ : {
                    readNext1(&reader);
                    auto ia = buildInformationAssociation();
                    fc_controller.addInformationAssociation(ia);
                } break;
                case FeatureAssociation_ : {
                    readNext1(&reader);
                    auto fa = buildFeatureAssociation();
                    fc_controller.addFeatureAssociation(fa);
                } break;
                case InformationType_ : {
                    readNext1(&reader);
                    auto it = buildInformationType();
                    fc_controller.addInformationType(it);
                } break;
                case FeatureType_ : {
                    readNext1(&reader);
                    auto ft = buildFeatureType();
                    fc_controller.addFeatureType(ft);
                } break;
                default:
                    readNext1(&reader);
            }
        } else {
            readNext1(&reader);
        }
    }
    if (reader.error()){
        qWarning(QString("Some error: %1").arg(reader.errorString()).toLocal8Bit().data());
    }
    return fc_controller;
}

bool FeatureCatalogueXMLBuilder::isStartElementAndAllowed(std::string tag)
{
    return reader.isStartElement() && strTypeToBuildType.contains(tag);
}

void FeatureCatalogueXMLBuilder::printErrorIfHapend()
{
    if (reader.error()){
        qWarning(QString("Some error: %1").arg(reader.errorString()).toLocal8Bit().data());
        //throw "Error";
    }
}

std::string FeatureCatalogueXMLBuilder::readAttrValue(QString tag)
{
    return reader.isStartElement()
            ? reader.attributes().value(tag).toString().toStdString()
            : "";
}

void FeatureCatalogueXMLBuilder::readNext1(QXmlStreamReader *reader)
{
    ///reader->readNext();
    reader->readNextStartElement();
}

void FeatureCatalogueXMLBuilder::readNext2(QXmlStreamReader *reader)
{
    readNext1(reader);
    readNext1(reader);
}

FC_SimpleAttribute FeatureCatalogueXMLBuilder::buildSimpleAttribute()
{
    FC_SimpleAttribute sa;
    auto header = buildItem();
    auto valueType = buildAttributeValueType();
    sa.setHeader(header);
    sa.setValueType(valueType);

    while (!reader.atEnd()) {
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case ListedValue: {
                readNext1(&reader);
                auto lv = buildListedValue();
                sa.addListedValue(lv);
            } break;
            default: // Обработка завершена
                return sa;
            }
        } else {
            readNext1(&reader);
        }
    }
    printErrorIfHapend();
    return sa;
}

FC_ComplexAttribute FeatureCatalogueXMLBuilder::buildComplexAttribute()
{
    FC_ComplexAttribute cmplxAttr;
    auto header = buildItem();
    cmplxAttr.setHeader(header);

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case SubAttributeBinding: {
                auto sab = buildAttributeBinding();
                cmplxAttr.addAttributeBinding(sab);
            } break;
            default: // Обработка завершена
                return cmplxAttr;
            }
        } else {
            readNext1(&reader);
        }
    }
    printErrorIfHapend();
    return cmplxAttr;
}

FC_FeatureType FeatureCatalogueXMLBuilder::buildFeatureType()
{
    FC_FeatureType featureType;

    auto header = buildItem();
    featureType.setHeader(header);

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case AttributeBinding: {
                auto sab = buildAttributeBinding();
                featureType.addAttributeBinding(sab);
            } break;
            case FeatureBinding: {
                auto fb = buildFeatureBinding();
                featureType.addFeatureBinding(fb);
            } break;
            case InformationBinding: {
                auto ib = buildInformationBinding();
                featureType.addInformationBinding(ib);
            }break;
            case FeatureUseType: {
                std::string element = reader.readElementText().toStdString();
                featureType.setFeatureUseType(element);
            } break;
            case PermittedPrimitives : {
                std::string element = reader.readElementText().toStdString();
                featureType.addPermittedPrimitives(element);
            } break;

            default: // Обработка завершена
                checkUnsetEnummType(featureType.featureUseType());
                return featureType;
            }
        } else {
            readNext1(&reader);
        }
    }
    printErrorIfHapend();
    checkUnsetEnummType(featureType.featureUseType());
    return featureType;
}

FC_Role FeatureCatalogueXMLBuilder::buildRole()
{
    auto header = buildItem();
    return FC_Role(header);
}

FC_InformationType FeatureCatalogueXMLBuilder::buildInformationType()
{
    FC_InformationType infType;

    auto header = buildItem();
    infType.setHeader(header);

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case AttributeBinding: {
                auto sab = buildAttributeBinding();
                infType.addAttributeBinding(sab);
            } break;
            default: // Обработка завершена
                return infType;
            }
        } else {
            readNext1(&reader);
        }
    }
    printErrorIfHapend();
    return infType;

}

FC_FeatureAssociation FeatureCatalogueXMLBuilder::buildFeatureAssociation()
{
    FC_FeatureAssociation fAss;

    auto header = buildItem();
    fAss.setHeader(header);

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case Role: {
                auto roleCode = readAttrValue("ref");
                FC_Role role = fc_controller.rolesCtrl().type(roleCode);
                fAss.addRoleRef(role);
                readNext1(&reader);
            } break;
            default: // Обработка завершена
                return fAss;
            }
        } else {
            readNext1(&reader);
        }
    }
    printErrorIfHapend();
    return fAss;
}

FC_InformationAssociation FeatureCatalogueXMLBuilder::buildInformationAssociation()
{
    FC_InformationAssociation infAss;

    auto header = buildItem();
    infAss.setHeader(header);

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case Role: {
                auto roleCode = readAttrValue("ref");
                FC_Role role = fc_controller.rolesCtrl().type(roleCode);
                infAss.addRoleRef(role);
                readNext1(&reader);
            } break;
            default: // Обработка завершена
                return infAss;
            }
        } else {
            readNext1(&reader);
        }
    }
    printErrorIfHapend();
    return infAss;
}

FC_Item FeatureCatalogueXMLBuilder::buildItem()
{
    FC_Item item;
    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case Name: {
                std::string element = reader.readElementText().toStdString();
                item.setName(element);
            } break;
            case Definition: {
                std::string element = reader.readElementText().toStdString();
                item.setDefenition(element);
            } break;
            case Code : {
                std::string element = reader.readElementText().toStdString();
                item.setCode(element);
            } break;
            case Remarks : {
                std::string element = reader.readElementText().toStdString();
                item.setRemarks(element);
            } break;
            case Alias : {
                std::string element = reader.readElementText().toStdString();
                item.addAlias(element);
            } break;
            default : // Тег не подходит
                return item;
            }
        }
        readNext1(&reader);
    }
    printErrorIfHapend();
    return item;
}

CD_AttributeValueType FeatureCatalogueXMLBuilder::buildAttributeValueType()
{
    CD_AttributeValueType type;
    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case ValueType: {
                std::string element = reader.readElementText().toStdString();
                type = CD_AttributeValueType(element);
            } break;
            default : // Тег не подходит
                checkUnsetEnummType(type);
                return type;
            }
        }
        readNext1(&reader);
    }
    printErrorIfHapend();
    checkUnsetEnummType(type);
    return type;
}

FC_ListedValue FeatureCatalogueXMLBuilder::buildListedValue()
{
    FC_ListedValue value;
    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case Label: {
                std::string element = reader.readElementText().toStdString();
                value.setLabel(element);
            } break;
            case Definition: {
                std::string element = reader.readElementText().toStdString();
                value.setDefenition(element);
            } break;
            case Code : {
                std::string element = reader.readElementText().toStdString();
                value.setCode(std::stoi(element));
            } break;
            case Remarks: {
                std::string element = reader.readElementText().toStdString();
                value.addRemarks(element);
            } break;
            case Alias : {
                std::string element = reader.readElementText().toStdString();
                value.addAlias(element);
            } break;
            default : // Тег не подходит
                return value;
            }
        }
        readNext1(&reader);
    }
    printErrorIfHapend();
    return value;
}

FC_AttributeBinding FeatureCatalogueXMLBuilder::buildAttributeBinding()
{
    FC_AttributeBinding attrBind;

    auto isSequential = readAttrValue("sequential") == "true" ;
    //attrBind.setSequentional(toBoolean(isSequential));
    attrBind.setSequentional(isSequential);

    readNext1(&reader);
    auto multiplisity = buildMultiplicity();
    attrBind.setMultiplicity(multiplisity);

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case Value : {
                auto element = reader.readElementText();
                attrBind.addPermittedValues(element.toInt());
            } break;
            case Attribute: {
                auto atrCode = readAttrValue("ref");
                attrBind.setAttributeCode(atrCode);
            } break;
            default : // Тег не подходит
                return attrBind;
            }
        }
        readNext1(&reader);
    }
    printErrorIfHapend();
    return attrBind;
}

FC_FeatureBinding FeatureCatalogueXMLBuilder::buildFeatureBinding()
{
    FC_FeatureBinding featureBind;

    auto roleType = readAttrValue("roleType");//attrBind.setSequentional(toBoolean(isSequential));
    featureBind.setRoleType(roleType);
    checkUnsetEnummType(featureBind.roleType());
    readNext1(&reader);

    auto multiplisity = buildMultiplicity();
    featureBind.setMultiplicity(multiplisity);

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case Association : {
                auto associationCode = readAttrValue("ref");
                FC_FeatureAssociation fAss = fc_controller.featureAssociationCtrl().type(associationCode);
                featureBind.setAssociationRef(fAss);
            } break;
            case Role: {
                auto roleCode = readAttrValue("ref");
                FC_Role role = fc_controller.rolesCtrl().type(roleCode);
                featureBind.setRoleRef(role);
            } break;
            case FeatureType: {
                auto featureTypeCode = readAttrValue("ref");
                featureBind.setFeatureType(featureTypeCode);
            } break;
            default : // Тег не подходит
                return featureBind;
            }
        }
        readNext1(&reader);
    }
    printErrorIfHapend();
    return featureBind;
}

FC_InformationBinding FeatureCatalogueXMLBuilder::buildInformationBinding()
{
    FC_InformationBinding featureBind;

    auto roleType = readAttrValue("roleType");//attrBind.setSequentional(toBoolean(isSequential));
    featureBind.setRoleType(roleType);
    checkUnsetEnummType(featureBind.roleType());
    readNext1(&reader);

    auto multiplisity = buildMultiplicity();
    featureBind.setMultiplicity(multiplisity);

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case Association : {
                auto associationCode = readAttrValue("ref");
                FC_InformationAssociation infAss = fc_controller.informationAssociationCtrl().type(associationCode);
                featureBind.setAssociationRef(infAss);
            } break;
            case Role: {
                auto roleCode = readAttrValue("ref");
                FC_Role roleRef = fc_controller.rolesCtrl().type(roleCode);
                featureBind.setRoleRef(roleRef);
            } break;
            case InformationType: {
                auto informTypeCode = readAttrValue("ref");
                featureBind.setInformationType(informTypeCode);
            } break;
            default : // Тег не подходит
                return featureBind;
            }
        }
        readNext1(&reader);
    }
    printErrorIfHapend();
    return featureBind;
}


Multiplicity FeatureCatalogueXMLBuilder::buildMultiplicity()
{
    Multiplicity mult;

    while (!reader.atEnd()){
        std::string tag = reader.name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTypeToBuildType[tag]) {
            case Lower: {
                auto element = reader.readElementText();
                mult.lower = element.toUInt();
            } break;
            case Upper: {
                UnlimitedInteger ui;
                auto isInfinite = readAttrValue("infinite") == "true";
                //ui.infinite = toBoolean(isInfinite);
                ui.infinite = isInfinite;
                if (!ui.infinite) {
                    auto element = reader.readElementText();
                    ui.value = element.toInt();
                }
                mult.upper = ui;
            } break;
            default : // Тег не подходит
                return mult;
            }
        }
        readNext1(&reader);
    }
    printErrorIfHapend();
    return mult;
}

