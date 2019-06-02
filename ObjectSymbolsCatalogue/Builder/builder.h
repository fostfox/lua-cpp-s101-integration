#include "../Controller/portrayalcataloguecontroller.h"


class QFile;

class PortrayalCatalogueBuilder
{
public:
    PortrayalCatalogueBuilder() = default;
    PortrayalCatalogueController build(QFile *path);
private:
};
