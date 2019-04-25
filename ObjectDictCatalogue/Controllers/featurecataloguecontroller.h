#pragma once

#include "../Entities/fc_complexattribute.h"
#include "../Entities/fc_featureassociation.h"
#include "../Entities/fc_featuretype.h"
#include "../Entities/fc_informationassociation.h"
#include "../Entities/fc_informationtype.h"
#include "../Entities/fc_role.h"
#include "../Entities/fc_simpleattribute.h"

#include "entitycontroller.h"

template <typename FC_T>
class EntityController;


class FeatureCatalogueController
{
  public:
    FeatureCatalogueController();

    void addSimpleAttr(const FC_SimpleAttribute &sa);
    void addComplexAttr(const FC_ComplexAttribute &ca);
    void addFeatureType(const FC_FeatureType &ft);
    void addInformationType(const FC_InformationType &it);
    void addFeatureAssociation(const FC_FeatureAssociation &fa);
    void addInformationAssociation(const FC_InformationAssociation &ia);
    void addRole(const FC_Role &r);

    const EntityController<FC_SimpleAttribute> &simpleAttributeCtrl() const;
    const EntityController<FC_ComplexAttribute> &complexAttributeCtrl() const;
    const EntityController<FC_Role> &rolesCtrl() const;
    const EntityController<FC_InformationAssociation> &informationAssociationCtrl() const;
    const EntityController<FC_FeatureAssociation> &featureAssociationCtrl() const;
    const EntityController<FC_InformationType> &informationTypeCrtl() const;
    const EntityController<FC_FeatureType> &featureTypeCtrl() const;

private:
    EntityController<FC_SimpleAttribute> m_simpleAttributeCtrl;
    EntityController<FC_ComplexAttribute> m_complexAttributeCtrl;
    EntityController<FC_Role> m_rolesCtrl;
    EntityController<FC_InformationAssociation> m_informationAssociationCtrl;
    EntityController<FC_FeatureAssociation> m_featureAssociationCtrl;
    EntityController<FC_InformationType> m_informationTypeCrtl;
    EntityController<FC_FeatureType> m_featureTypeCtrl;
};
