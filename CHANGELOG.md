# Change Log
All notable changes to this project will be documented in this file.
Adheres to [Semantic Versioning](http://semver.org/).

---

## 2.0.0 (TBD)

* [PROJ](https://github.com/ngageoint/PROJ) (a [PROJ](https://github.com/OSGeo/PROJ) C and C++ build) has replaced the [proj4-ios](https://github.com/bosborn/proj.4/tree/4.9.3) (a [PROJ.4](https://proj.org/en/9.2/faq.html#what-happened-to-proj-4) C build) dependency
* PROJ version 9.2.1.4
* sqlite3 and c++ dependencies for PROJ
* WARNING: Transformations (PROJProjectionTransform) should now be destroyed for memory when no longer maintained
* Projection factory creation type support by direct WKT definitions (vs parameter conversions) and projection names
* Projection factory single projection creation support by specified preferred factory types

## [1.0.5](https://github.com/ngageoint/projections-ios/releases/tag/1.0.5) (06-02-2023)

* proj4-ios version 4.9.3.1

## [1.0.4](https://github.com/ngageoint/projections-ios/releases/tag/1.0.4) (01-09-2023)

* crs-ios version 1.0.4
* Imports cleanup and simplification

## [1.0.3](https://github.com/ngageoint/projections-ios/releases/tag/1.0.3) (05-04-2022)

* crs-ios version 1.0.3
* Non projected ETRS89 GeoDatum fix (EPSG:4258)

## [1.0.2](https://github.com/ngageoint/projections-ios/releases/tag/1.0.2) (02-09-2022)

* crs-ios version 1.0.2

## [1.0.1](https://github.com/ngageoint/projections-ios/releases/tag/1.0.1) (11-01-2021)

* crs-ios version 1.0.1

## [1.0.0](https://github.com/ngageoint/projections-ios/releases/tag/1.0.0) (09-16-2021)

* Initial Release
