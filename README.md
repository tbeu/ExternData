# ExternData
Free Modelica library for data I/O of CSV, INI, JSON, MATLAB MAT, SSV, TIR, Excel XLS/XLSX and XML files.

## Build status
[![Build Status](https://travis-ci.org/modelica-3rdparty/ExternData.svg?branch=master)](https://travis-ci.org/modelica-3rdparty/ExternData)
[![CI checks](https://github.com/modelica-3rdparty/ExternData/workflows/CI/badge.svg)](https://github.com/modelica-3rdparty/ExternData/actions)

## Library description
ExternData is a utility library to access data stored in CSV, INI, JSON, MATLAB MAT, SSV, TIR, Excel XLS/XLSX or XML files.
The aim of this library is to provide access from Modelica simulation tools to data sets for convenient model initialization and parametrization.

### Main features
* Read support of file formats
  * [CSV](https://en.wikipedia.org/wiki/Comma-separated_values)
  * [INI](https://en.wikipedia.org/wiki/INI_file)
  * [JSON](https://en.wikipedia.org/wiki/JSON)
  * [MATLAB](https://en.wikipedia.org/wiki/MATLAB) MAT of version v4, v6, v7 and v7.3
  * [SSV](https://ssp-standard.org/) (System Structure Parameter Values v1.0)
  * TIR (Tire properties)
  * [Excel](https://en.wikipedia.org/wiki/Microsoft_Excel) [XLS](https://en.wikipedia.org/wiki/Microsoft_Excel#Binary) and [XLSX](https://en.wikipedia.org/wiki/Microsoft_Excel#XML_Spreadsheet)
  * [XML](https://en.wikipedia.org/wiki/XML)
* C (and not C++) code for external functions and objects
* Cross-platform (Windows and Linux)
* Dependency on the [Modelica Standard Library](https://github.com/modelica/ModelicaStandardLibrary) v4.0.0
* Tested in [Dymola](http://www.dynasim.se), [OpenModelica](https://openmodelica.org/) (Linux only) and [SimulationX](https://www.simulationx.com/)

All data I/O access is implemented using external Modelica functions.

## License
ExternData is released under the terms of the Simplified BSD License.

## Acknowledgement
ExternData is based on the following third-party C projects
* [bsxml-json](https://github.com/bsapundzhiev/bsxml-json) -
Borislav Sapundzhiev's fairly simple XML DOM and JSON implementation
* [expat](https://github.com/libexpat/libexpat) -
James Clark's Expat XML parser library
* [hdf5](https://support.hdfgroup.org/HDF5) -
The HDF Group's data model, library and file format for storing and managing data
* [inih](https://github.com/benhoyt/inih) -
Ben Hoyt's simple INI file parser in C
* [libxls](https://github.com/libxls/libxls) -
David Hoerl's C library for parsing Excel files
* [libxml2](https://gitlab.gnome.org/GNOME/libxml2) -
Daniel Veillard's XML C parser and toolkit of Gnome
* [matio](https://sourceforge.net/projects/matio/) -
Christopher Hulbert's C library for reading and writing MATLAB MAT-files
* [minizip](http://www.winimage.com/zLibDll/minizip.html) -
Gilles Vollant's Zip and UnZip library
* [parson](https://github.com/kgabis/parson) -
Krzysztof Gabis' lightweight JSON library written in C
* [uthash](https://github.com/troydhanson/uthash) -
Troy D. Hanson's C macros for hash tables and more
* [zlib](https://github.com/madler/zlib) -
Jean-loup Gailly's and Mark Adler's massively spiffy yet delicately unobtrusive compression library
* [zstring](https://github.com/fnoyanisi/zString) -
Fehmi Noyan ISI's string processing library for C

## Development and contribution
You may report any issues with using the [Issues](../../issues) button.

Contributions in shape of [Pull Requests](../../pulls) are always welcome.
