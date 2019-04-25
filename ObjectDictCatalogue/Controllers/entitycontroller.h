#pragma once

#include <QMap>
#include <QVector>
#include <QString>

template <typename FC_T>
class EntityController
{
  public:
    EntityController();

    void addType(const FC_T& ft);
    FC_T type(std::string featureCode) const;
    QVector<FC_T> types() const;
    std::vector<std::string> codes() const;

private:
    QVector<FC_T> m_types;
    QMap<std::string, FC_T*> m_codeToPTypeMap;
    std::vector<std::string> m_codes;
};

//-----------------------------------------------------------------------------

//class FC_ComplexAttributesController : public EntityController<FC_ComplexAttribute>{
//  public: FC_ComplexAttributesController();
//};
//class FC_FeatureAssociationsController : public EntityController<FC_FeatureAssociation>{
//  public: FC_FeatureAssociationsController();
//};
//class FC_FeatureTypesController : public EntityController<FC_FeatureType> {
//  public: FC_FeatureTypesController();
//};
//class FC_InformationAssociationsController : public EntityController<FC_InformationAssociation> {
//  public: FC_InformationAssociationsController();
//};
//class FC_InformationTypesController : public EntityController<FC_InformationType> {
//  public: FC_InformationTypesController();
//};
//class FC_RolesController : public EntityController<FC_Role> {
//  public: FC_RolesController();
//};
//class FC_SimpleAttributesController : public EntityController<FC_SimpleAttribute> {
//  public: FC_SimpleAttributesController();
//};


//-----------------------------------------------------------------------------

template<typename FC_T>
EntityController<FC_T>::EntityController()
{

}

template<typename FC_T>
void EntityController<FC_T>::addType(const FC_T &ft)
{
    std::string code = ft.header().code();
    m_types.push_back(ft);
    m_codes.push_back(code);
    m_codeToPTypeMap[code] = &m_types.back();
}

template<typename FC_T>
FC_T EntityController<FC_T>::type(std::string featureCode) const
{
    return *m_codeToPTypeMap[featureCode];
}

template<typename FC_T>
QVector<FC_T> EntityController<FC_T>::types() const
{
    return m_types;
}

template<typename FC_T>
std::vector<std::string> EntityController<FC_T>::codes() const
{
    return m_codes;
}
