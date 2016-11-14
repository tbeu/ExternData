// CP: 65001
/* package.mo - Modelica library for data I/O of INI, JSON, MATLAB MAT, Excel XLS/XLSX or XML files
 *
 * Copyright (C) 2015-2016, tbeu
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

within;
package ExternData "Library for data I/O of INI, JSON, MATLAB MAT, Excel XLS/XLSX or XML files"
  extends Modelica.Icons.Package;
  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;
    class References "References"
      extends Modelica.Icons.References;
      annotation(Documentation(info="<html><p>The ExternData Modelica library is based on the following third-party C projects</p><ul><li><a href=\"https://github.com/bsapundzhiev/bsxml-json\">bsxml-json</a>&nbsp;-&nbsp;Borislav Sapundzhiev&#039;s fairly simple XML DOM and JSON implementation</li><li><a href=\"http://sourceforge.net/projects/expat\">expat</a>&nbsp;-&nbsp;James Clark&#039;s Expat XML parser library</li><li><a href=\"https://support.hdfgroup.org/HDF5\">hdf5</a>&nbsp;-&nbsp;The HDF Group&#039;s data model, library and file format for storing and managing data</li><li><a href=\"http://sourceforge.net/projects/libxls\">libxls</a>&nbsp;-&nbsp;David Hoerl&#039;s C library for parsing Excel files</li><li><a href=\"http://sourceforge.net/projects/matio\">matio</a>&nbsp;-&nbsp;Christopher Hulbert&#039;s C library for reading and writing MATLAB MAT-files</li><li><a href=\"https://github.com/compuphase/minIni\">minIni</a>&nbsp;-&nbsp;Thiadmer Riemersma&#039;s small and portable INI file library with read/write support</li><li><a href=\"http://www.winimage.com/zLibDll/minizip.html\">minizip</a>&nbsp;-&nbsp;Gilles Vollant&#039;s Zip and UnZip library</li><li><a href=\"https://github.com/troydhanson/uthash\">uthash</a>&nbsp;-&nbsp;Troy D. Hanson&#039;s C macros for hash tables and more</li><li><a href=\"https://github.com/madler/zlib\">zlib</a>&nbsp;-&nbsp;Jean-loup Gailly&#039;s and Mark Adler&#039;s massively spiffy yet delicately unobtrusive compression library</li></ul></html>"));
    end References;
    class License "Simplified BSD License"
      extends Modelica.Icons.Information;
      annotation(Documentation(info="<html><p>Copyright (C) 2015-2016, tbeu<br>All rights reserved.</p><p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:</p><p>1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.</p><p>2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.</p><p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p></html>"));
    end License;
    class Contact "Contact"
      extends Modelica.Icons.Contact;
      annotation(Documentation(info="<html><p>The ExternData Modelica library is developed by <a href=\"https://github.com/tbeu\">tbeu</a> at <a href=\"https://github.com/tbeu/ExternData\">GitHub</a>.</p></html>"));
    end Contact;
    annotation(DocumentationClass=true,
      Documentation(info="<html><p>Library <strong>ExternData</strong> is a <a href=\"https://en.wikipedia.org/wiki/Modelica\">Modelica</a> utility library to access data stored in <a href=\"https://en.wikipedia.org/wiki/INI_file\">INI</a>, <a href=\"https://en.wikipedia.org/wiki/JSON\">JSON</a>, <a href=\"https://en.wikipedia.org/wiki/MATLAB\">MATLAB</a> MAT, <a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel\">Excel</a> <a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel#Binary\">XLS</a>/<a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel#XML_Spreadsheet\">XLSX</a> and <a href=\"https://en.wikipedia.org/wiki/XML\">XML</a> files.</p></html>"));
  end UsersGuide;

  package Examples "Test examples"
    extends Modelica.Icons.ExamplesPackage;
    model INITest "INI file read test"
      extends Modelica.Icons.Example;
      INIFile inifile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.ini")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Math.Gain gain1(k=inifile.getReal("gain.k", "set1")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
      Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(inifile.getString("gain.k", "set2"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
      Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
      equation
        connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
        connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
      annotation(experiment(StopTime=1),
        Documentation(info="<html><p>This example model reads the gain parameters from different sections of the INI file <a href=\"modelica://ExternData/Resources/Examples/test.ini\">test.ini</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.INIFile.getReal\">ExternData.INIFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.INIFile.getString\">ExternData.INIFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
    end INITest;

    model JSONTest "JSON file read test"
      extends Modelica.Icons.Example;
      JSONFile jsonfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.json")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Math.Gain gain1(k=jsonfile.getReal("set1.gain.k")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
      Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(jsonfile.getString("set2.gain.k"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
      Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
      equation
        connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
        connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
      annotation(experiment(StopTime=1),
        Documentation(info="<html><p>This example model reads the gain parameters from different nodes of the JSON file <a href=\"modelica://ExternData/Resources/Examples/test.json\">test.json</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.JSONFile.getReal\">ExternData.JSONFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.JSONFile.getString\">ExternData.JSONFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
    end JSONTest;

    model MATTest "MAT-file read test"
      extends Modelica.Icons.Example;
      MATFile matfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test_v7.3.mat")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Sources.TimeTable timeTable1(table=matfile.getRealArray2D("table1", 3, 2)) annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
      annotation(experiment(StopTime=1),
        Documentation(info="<html><p>This example model reads the table parameter from variable table1 of the HDF5-based MAT-file <a href=\"modelica://ExternData/Resources/Examples/test_v7.3.mat\">test_v7.3.mat</a>. The table parameter is read as Real array of dimension 3x2 by function <a href=\"modelica://ExternData.MATFile.getRealArray2D\">ExternData.MATFile.getRealArray2D</a>. The read parameter is assigned by a parameter binding to the appropriate model parameter.</p></html>"));
    end MATTest;

    model XLSTest "Excel XLS file read test"
      extends Modelica.Icons.Example;
      XLSFile xlsfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.xls")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Math.Gain gain1(k=xlsfile.getReal("B2", "set1")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
      Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(xlsfile.getString("B2", "set2"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
      Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
      equation
        connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
        connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
      annotation(experiment(StopTime=1),
        Documentation(info="<html><p>This example model reads the gain parameters from different cells and sheets of the Excel XLS file <a href=\"modelica://ExternData/Resources/Examples/test.xls\">test.xls</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.XLSFile.getReal\">ExternData.XLSFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.XLSFile.getString\">ExternData.XLSFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
    end XLSTest;

    model XLSXTest "Excel XLSX file read test"
      extends Modelica.Icons.Example;
      XLSXFile xlsxfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.xlsx")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Math.Gain gain1(k=xlsxfile.getReal("B2", "set1")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
      Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(xlsxfile.getString("B2", "set2"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
      Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
      equation
        connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
        connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
      annotation(experiment(StopTime=1),
        Documentation(info="<html><p>This example model reads the gain parameters from different cells and sheets of the Excel XLSX file <a href=\"modelica://ExternData/Resources/Examples/test.xlsx\">test.xlsx</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.XLSXFile.getReal\">ExternData.XLSXFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.XLSXFile.getString\">ExternData.XLSXFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
    end XLSXTest;

    model XMLTest "XML file read test"
      extends Modelica.Icons.Example;
      XMLFile xmlfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.xml")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Math.Gain gain1(k=xmlfile.getReal("set1.gain.k")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
      Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(xmlfile.getString("set2.gain.k"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
      Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
      Modelica.Blocks.Sources.TimeTable timeTable1(table=xmlfile.getRealArray2D("table1", 3, 2)) annotation(Placement(transformation(extent={{-50,30},{-30,50}})));
      equation
        connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
        connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
      annotation(experiment(StopTime=1),
        Documentation(info="<html><p>This example model reads the gain and table parameters from different nodes of the XML file <a href=\"modelica://ExternData/Resources/Examples/test.xml\">test.xml</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.XMLFile.getReal\">ExternData.XMLFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.XMLFile.getString\">ExternData.XMLFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). For timeTable1 the table parameter is read as Real array of dimension 3x2 by function <a href=\"modelica://ExternData.XMLFile.getRealArray2D\">ExternData.XMLFile.getRealArray2D</a>. The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
    end XMLTest;
  end Examples;

  model INIFile "Read data values from INI file"
    parameter String fileName="" "File where external data is stored"
      annotation(Dialog(
        loadSelector(filter="INI files (*.ini);;Configuration files (*.cfg;*.conf;config.txt);;Text files (*.txt)",
        caption="Open file")));
    parameter Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
    final parameter Types.ExternINIFile ini=Types.ExternINIFile(fileName, verboseRead) "External INI file object";
    final function getReal = Functions.INI.getReal(final ini=ini) "Get scalar Real value from INI file" annotation(Documentation(info="<html></html>"));
    final function getInteger = Functions.INI.getInteger(final ini=ini) "Get scalar Integer value from INI file" annotation(Documentation(info="<html></html>"));
    final function getBoolean = Functions.INI.getBooleanfinal (ini=ini) "Get scalar Boolean value from INI file" annotation(Documentation(info="<html></html>"));
    final function getString = Functions.INI.getString(final ini=ini) "Get scalar String value from INI file" annotation(Documentation(info="<html></html>"));
    annotation(
      Documentation(info="<html><p>Model that wraps the external object <a href=\"modelica://ExternData.Types.ExternINIFile\">ExternINIFile</a> and the <a href=\"modelica://ExternData.Functions.INI\">INI</a> read functions for data access of <a href=\"https://en.wikipedia.org/wiki/INI_file\">INI</a> files.</p><p>See <a href=\"modelica://ExternData.Examples.INITest\">Examples.INITest</a> for an example.</p></html>"),
      defaultComponentName="inifile",
      Icon(graphics={
        Line(points={{-40,90},{-90,40},{-90,-90},{90,-90},{90,90},{-40,90}}),
        Polygon(points={{-40,90},{-40,40},{-90,40},{-40,90}},fillPattern=FillPattern.Solid),
        Text(lineColor={0,0,255},extent={{-85,-10},{85,-55}},textString="[ini]"),
        Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
  end INIFile;

  model JSONFile "Read data values from JSON file"
    parameter String fileName="" "File where external data is stored"
      annotation(Dialog(
        loadSelector(filter="JSON files (*.json)",
        caption="Open file")));
    parameter Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
    final parameter Types.ExternJSONFile json=Types.ExternJSONFile(fileName, verboseRead) "External JSON file object";
    final function getReal = Functions.JSON.getReal(final json=json) "Get scalar Real value from JSON file" annotation(Documentation(info="<html></html>"));
    final function getInteger = Functions.JSON.getInteger(final json=json) "Get scalar Integer value from JSON file" annotation(Documentation(info="<html></html>"));
    final function getBoolean = Functions.JSON.getBoolean(final json=json) "Get scalar Boolean value from JSON file" annotation(Documentation(info="<html></html>"));
    final function getString = Functions.JSON.getString(final json=json) "Get scalar String value from JSON file" annotation(Documentation(info="<html></html>"));
    annotation(
      Documentation(info="<html><p>Model that wraps the external object <a href=\"modelica://ExternData.Types.ExternJSONFile\">ExternJSONFile</a> and the <a href=\"modelica://ExternData.Functions.JSON\">JSON</a> read functions for data access of <a href=\"https://en.wikipedia.org/wiki/JSON\">JSON</a> files.</p><p>See <a href=\"modelica://ExternData.Examples.JSONTest\">Examples.JSONTest</a> for an example.</p></html>"),
      defaultComponentName="jsonfile",
      Icon(graphics={
        Line(points={{-40,90},{-90,40},{-90,-90},{90,-90},{90,90},{-40,90}}),
        Polygon(points={{-40,90},{-40,40},{-90,40},{-40,90}},fillPattern=FillPattern.Solid),
        Text(lineColor={0,0,255},extent={{-85,-10},{85,-55}},textString="{\"json\"}"),
        Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
  end JSONFile;

  model MATFile "Read data values from MATLAB MAT-file"
    parameter String fileName="" "File where external data is stored"
      annotation(Dialog(
        loadSelector(filter="MATLAB MAT-files (*.mat)",
        caption="Open file")));
    parameter Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
    final parameter Types.ExternMATFile mat=Types.ExternMATFile(fileName, verboseRead) "External MAT file object";
    final function getRealArray2D = Functions.MAT.getRealArray2D(final mat=mat) "Get 2D Real values from MAT-file" annotation(Documentation(info="<html></html>"));
    annotation(
      Documentation(info="<html><p>Model that wraps the external object <a href=\"modelica://ExternData.Types.ExternMATFile\">ExternMATFile</a> and the <a href=\"modelica://ExternData.Functions.MAT\">MAT</a> read functions for data access of <a href=\"https://en.wikipedia.org/wiki/MATLAB\">MATLAB</a> MAT-files.</p><p>See <a href=\"modelica://ExternData.Examples.MATTest\">Examples.MATTest</a> for an example.</p></html>"),
      defaultComponentName="matfile",
      Icon(graphics={
        Line(points={{-40,90},{-90,40},{-90,-90},{90,-90},{90,90},{-40,90}}),
        Polygon(points={{-40,90},{-40,40},{-90,40},{-40,90}},fillColor={241,219,48},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-80,20},{80,-80}},lineColor={248,236,140},fillColor={241,219,48},fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(extent={{-80,20},{80,-80}}),
        Line(points={{-40,20},{-40,-80}}),
        Line(points={{0,20},{0,-80}}),
        Line(points={{40,20},{40,-80}}),
        Line(points={{-80,-30},{80,-30}}),
        Text(extent={{5,85},{65,40}},textString="mat"),
        Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
  end MATFile;

  model XLSFile "Read data values from Excel XLS file"
    parameter String fileName="" "File where external data is stored"
      annotation(Dialog(
        loadSelector(filter="Excel files (*.xls)",
        caption="Open file")));
    parameter String encoding="UTF-8" "Encoding";
    parameter Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
    final parameter Types.ExternXLSFile xls=Types.ExternXLSFile(fileName, encoding, verboseRead) "External Excel XLS file object";
    final function getReal = Functions.XLS.getReal(final xls=xls) "Get scalar Real value from Excel XLS file" annotation(Documentation(info="<html></html>"));
    final function getInteger = Functions.XLS.getInteger(final xls=xls) "Get scalar Integer value from Excel XLS file" annotation(Documentation(info="<html></html>"));
    final function getBoolean = Functions.XLS.getBoolean(final xls=xls) "Get scalar Boolean value from Excel XLS file" annotation(Documentation(info="<html></html>"));
    final function getString = Functions.XLS.getString(final xls=xls) "Get scalar String value from Excel XLS file" annotation(Documentation(info="<html></html>"));
    annotation(
      Documentation(info="<html><p>Model that wraps the external object <a href=\"modelica://ExternData.Types.ExternXLSFile\">ExternXLSFile</a> and the <a href=\"modelica://ExternData.Functions.XLS\">XLS</a> read functions for data access of <a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel\">Excel</a> <a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel#Binary\">XLS</a> files.</p><p>See <a href=\"modelica://ExternData.Examples.XLSTest\">Examples.XLSTest</a> for an example.</p></html>"),
      defaultComponentName="xlsfile",
      Icon(graphics={
        Line(points={{-40,90},{-90,40},{-90,-90},{90,-90},{90,90},{-40,90}}),
        Rectangle(extent={{80,70},{40,50}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{20,70},{-20,50}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-40,40},{-80,20}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-40,10},{-80,-10}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-40,-20},{-80,-40}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-40,-50},{-80,-70}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{40,40},{80,20}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{40,10},{80,-10}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{40,-20},{80,-40}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{40,-50},{80,-70}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-20,40},{20,20}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-20,10},{20,-10}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-20,-20},{20,-40}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-20,-50},{20,-70}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Polygon(points={{-40,90},{-40,40},{-90,40},{-40,90}},fillColor={0,127,0},fillPattern=FillPattern.Solid),
        Text(lineColor={0,127,0},extent={{-85,-10},{85,-55}},textString="xls"),
        Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
  end XLSFile;

  model XLSXFile "Read data values from Excel XLSX file"
    parameter String fileName="" "File where external data is stored"
      annotation(Dialog(
        loadSelector(filter="Excel files (*.xlsx)",
        caption="Open file")));
    parameter Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
    final parameter Types.ExternXLSXFile xlsx=Types.ExternXLSXFile(fileName, verboseRead)  "External Excel XLSX file object";
    final function getReal = Functions.XLSX.getReal(final xlsx=xlsx) "Get scalar Real value from Excel XLSX file" annotation(Documentation(info="<html></html>"));
    final function getInteger = Functions.XLSX.getInteger(final xlsx=xlsx) "Get scalar Integer value from Excel XLSX file" annotation(Documentation(info="<html></html>"));
    final function getBoolean = Functions.XLSX.getBoolean(final xlsx=xlsx) "Get scalar Boolean value from Excel XLSX file" annotation(Documentation(info="<html></html>"));
    final function getString = Functions.XLSX.getString(final xlsx=xlsx) "Get scalar String value from Excel XLSX file" annotation(Documentation(info="<html></html>"));
    annotation(
      Documentation(info="<html><p>Model that wraps the external object <a href=\"modelica://ExternData.Types.ExternXLSXFile\">ExternXLSXFile</a> and the <a href=\"modelica://ExternData.Functions.XLSX\">XLSX</a> read functions for data access of <a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel\">Excel</a> <a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel#XML_Spreadsheet\">XLSX</a> files.</p><p>See <a href=\"modelica://ExternData.Examples.XLSXTest\">Examples.XLSXTest</a> for an example.</p></html>"),
      defaultComponentName="xlsxfile",
      Icon(graphics={
        Line(points={{-40,90},{-90,40},{-90,-90},{90,-90},{90,90},{-40,90}}),
        Rectangle(extent={{80,70},{40,50}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{20,70},{-20,50}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-40,40},{-80,20}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-40,10},{-80,-10}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-40,-20},{-80,-40}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-40,-50},{-80,-70}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
        Rectangle(extent={{40,40},{80,20}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{40,10},{80,-10}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{40,-20},{80,-40}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{40,-50},{80,-70}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-20,40},{20,20}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-20,10},{20,-10}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-20,-20},{20,-40}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Rectangle(extent={{-20,-50},{20,-70}},lineColor={148,215,187},fillColor={148,215,187},fillPattern=FillPattern.Solid),
        Polygon(points={{-40,90},{-40,40},{-90,40},{-40,90}},fillColor={160,255,255},fillPattern=FillPattern.Solid),
        Text(lineColor={0,127,255},extent={{-85,-10},{85,-55}},textString="xlsx"),
        Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
  end XLSXFile;

  model XMLFile "Read data values from XML file"
    parameter String fileName="" "File where external data is stored"
      annotation(Dialog(
        loadSelector(filter="XML files (*.xml)",
        caption="Open file")));
    parameter Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
    final parameter Types.ExternXMLFile xml=Types.ExternXMLFile(fileName, verboseRead) "External XML file object";
    final function getReal = Functions.XML.getReal(final xml=xml) "Get scalar Real value from XML file" annotation(Documentation(info="<html></html>"));
    final function getRealArray1D = Functions.XML.getRealArray1D(final xml=xml) "Get 1D Real values from XML file" annotation(Documentation(info="<html></html>"));
    final function getRealArray2D = Functions.XML.getRealArray2D(final xml=xml) "Get 2D Real values from XML file" annotation(Documentation(info="<html></html>"));
    final function getInteger = Functions.XML.getInteger(final xml=xml) "Get scalar Integer value from XML file" annotation(Documentation(info="<html></html>"));
    final function getBoolean = Functions.XML.getBoolean(final xml=xml) "Get scalar Boolean value from XML file" annotation(Documentation(info="<html></html>"));
    final function getString = Functions.XML.getString(final xml=xml) "Get scalar String value from XML file" annotation(Documentation(info="<html></html>"));
    annotation(
      Documentation(info="<html><p>Model that wraps the external object <a href=\"modelica://ExternData.Types.ExternXMLFile\">ExternXMLFile</a> and the <a href=\"modelica://ExternData.Functions.XML\">XML</a> read functions for data access of <a href=\"https://en.wikipedia.org/wiki/XML\">XML</a> files.</p><p>See <a href=\"modelica://ExternData.Examples.XMLTest\">Examples.XMLTest</a> for an example.</p></html>"),
      defaultComponentName="xmlfile",
      Icon(graphics={
        Line(points={{-40,90},{-90,40},{-90,-90},{90,-90},{90,90},{-40,90}}),
        Polygon(points={{-40,90},{-40,40},{-90,40},{-40,90}},fillColor={255,128,0},fillPattern=FillPattern.Solid),
        Text(lineColor={255,128,0},extent={{-85,-10},{85,-55}},textString="<?xml?>"),
        Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
  end XMLFile;

  package Functions "Functions"
    extends Modelica.Icons.Package;

    package INI "INI file functions"
      extends Modelica.Icons.Package;
      function getReal "Get scalar Real value from INI file"
        extends Interfaces.partialGetReal;
        input String section="" "Section";
        input Types.ExternINIFile ini "External INI file object";
        external "C" y=ED_getDoubleFromINI(ini, varName, section) annotation(
          __iti_dll = "ITI_ED_INIFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_INIFile.h\"",
          Library = {"ED_INIFile", "bsxml-json"});
      end getReal;

      function getInteger "Get scalar Integer value from INI file"
        extends Interfaces.partialGetInteger;
        input String section="" "Section";
        input Types.ExternINIFile ini "External INI file object";
        external "C" y=ED_getIntFromINI(ini, varName, section) annotation(
          __iti_dll = "ITI_ED_INIFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_INIFile.h\"",
          Library = {"ED_INIFile", "bsxml-json"});
      end getInteger;

      function getBoolean "Get scalar Boolean value from INI file"
        extends Interfaces.partialGetBoolean;
        input String section="" "Section";
        input Types.ExternINIFile ini "External INI file object";
        algorithm
          y := getReal(ini=ini, varName=varName, section=section) <> 0;
        annotation(Inline=true);
      end getBoolean;

      function getString "Get scalar String value from INI file"
        extends Interfaces.partialGetString;
        input String section="" "Section";
        input Types.ExternINIFile ini "External INI file object";
        external "C" str=ED_getStringFromINI(ini, varName, section) annotation(
          __iti_dll = "ITI_ED_INIFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_INIFile.h\"",
          Library = {"ED_INIFile", "bsxml-json"});
      end getString;
    end INI;

    package JSON "JSON file functions"
      extends Modelica.Icons.Package;
      function getReal "Get scalar Real value from JSON file"
        extends Interfaces.partialGetReal;
        input Types.ExternJSONFile json "External JSON file object";
        external "C" y=ED_getDoubleFromJSON(json, varName) annotation(
          __iti_dll = "ITI_ED_JSONFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_JSONFile.h\"",
          Library = {"ED_JSONFile", "bsxml-json"});
      end getReal;

      function getInteger "Get scalar Integer value from JSON file"
        extends Interfaces.partialGetInteger;
        input Types.ExternJSONFile json "External JSON file object";
        external "C" y=ED_getIntFromJSON(json, varName) annotation(
          __iti_dll = "ITI_ED_JSONFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_JSONFile.h\"",
          Library = {"ED_JSONFile", "bsxml-json"});
      end getInteger;

      function getBoolean "Get scalar Boolean value from JSON file"
        extends Interfaces.partialGetBoolean;
        input Types.ExternJSONFile json "External JSON file object";
        algorithm
          y := getReal(json=json, varName=varName) <> 0;
        annotation(Inline=true);
      end getBoolean;

      function getString "Get scalar String value from JSON file"
        extends Interfaces.partialGetString;
        input Types.ExternJSONFile json "External JSON file object";
        external "C" str=ED_getStringFromJSON(json, varName) annotation(
          __iti_dll = "ITI_ED_JSONFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_JSONFile.h\"",
          Library = {"ED_JSONFile", "bsxml-json"});
      end getString;
    end JSON;

    package MAT "MAT-file functions"
      extends Modelica.Icons.Package;
      function getRealArray2D "Get 2D Real values from MAT-file"
        extends Modelica.Icons.Function;
        input String varName "Variable name";
        input Integer m=1 "Number of rows";
        input Integer n=1 "Number of columns";
        input Types.ExternMATFile mat "External MATLAB MAT-file object";
        output Real y[m,n] "2D Real values";
        external "C" ED_getDoubleArray2DFromMAT(mat, varName, y, size(y, 1), size(y, 2)) annotation(
          __iti_dll = "ITI_ED_MATFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_MATFile.h\"",
          Library = {"ED_MATFile", "hdf5", "zlib"});
      end getRealArray2D;
    end MAT;

    package XLS "Excel XLS file functions"
      extends Modelica.Icons.Package;
      function getReal "Get scalar Real value from Excel XLS file"
        extends Modelica.Icons.Function;
        input String cellAddress="A1" "Cell address";
        input String sheetName="" "Sheet name";
        input Types.ExternXLSFile xls "External Excel XLS file object";
        output Real y "Real value";
        external "C" y=ED_getDoubleFromXLS(xls, cellAddress, sheetName) annotation(
          __iti_dll = "ITI_ED_XLSFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSFile.h\"",
          Library = "ED_XLSFile");
      end getReal;

      function getInteger "Get scalar Integer value from Excel XLS file"
        extends Modelica.Icons.Function;
        input String cellAddress="A1" "Cell address";
        input String sheetName="" "Sheet name";
        input Types.ExternXLSFile xls "External Excel XLS file object";
        output Integer y "Integer value";
        external "C" y=ED_getIntFromXLS(xls, cellAddress, sheetName) annotation(
          __iti_dll = "ITI_ED_XLSFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSFile.h\"",
          Library = "ED_XLSFile");
      end getInteger;

      function getBoolean "Get scalar Boolean value from Excel XLS file"
        extends Modelica.Icons.Function;
        input String cellAddress="A1" "Cell address";
        input String sheetName="" "Sheet name";
        input Types.ExternXLSFile xls "External Excel XLS file object";
        output Boolean y "Boolean value";
        algorithm
          y := getReal(xls=xls, cellAddress=cellAddress, sheetName=sheetName) <> 0;
        annotation(Inline=true);
      end getBoolean;

      function getString "Get scalar String value from Excel XLS file"
        extends Modelica.Icons.Function;
        input String cellAddress="A1" "Cell address";
        input String sheetName="" "Sheet name";
        input Types.ExternXLSFile xls "External Excel XLS file object";
        output String str "String value";
        external "C" str=ED_getStringFromXLS(xls, cellAddress, sheetName) annotation(
          __iti_dll = "ITI_ED_XLSFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSFile.h\"",
          Library = "ED_XLSFile");
      end getString;
    end XLS;

    package XLSX "Excel XLSX file functions"
      extends Modelica.Icons.Package;
      function getReal "Get scalar Real value from Excel XLSX file"
        extends Modelica.Icons.Function;
        input String cellAddress="A1" "Cell address";
        input String sheetName="" "Sheet name";
        input Types.ExternXLSXFile xlsx "External Excel XLSX file object";
        output Real y "Real value";
        external "C" y=ED_getDoubleFromXLSX(xlsx, cellAddress, sheetName) annotation(
          __iti_dll = "ITI_ED_XLSXFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSXFile.h\"",
          Library = {"ED_XLSXFile", "bsxml-json", "expat", "zlib"});
      end getReal;

      function getInteger "Get scalar Integer value from Excel XLSX file"
        extends Modelica.Icons.Function;
        input String cellAddress="A1" "Cell address";
        input String sheetName="" "Sheet name";
        input Types.ExternXLSXFile xlsx "External Excel XLSX file object";
        output Integer y "Integer value";
        external "C" y=ED_getIntFromXLSX(xlsx, cellAddress, sheetName) annotation(
          __iti_dll = "ITI_ED_XLSXFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSXFile.h\"",
          Library = {"ED_XLSXFile", "bsxml-json", "expat", "zlib"});
      end getInteger;

      function getBoolean "Get scalar Boolean value from Excel XLSX file"
        extends Modelica.Icons.Function;
        input String cellAddress="A1" "Cell address";
        input String sheetName="" "Sheet name";
        input Types.ExternXLSXFile xlsx "External Excel XLSX file object";
        output Boolean y "Boolean value";
        algorithm
          y := getReal(xlsx=xlsx, cellAddress=cellAddress, sheetName=sheetName) <> 0;
        annotation(Inline=true);
      end getBoolean;

      function getString "Get scalar String value from Excel XLSX file"
        extends Modelica.Icons.Function;
        input String cellAddress="A1" "Cell address";
        input String sheetName="" "Sheet name";
        input Types.ExternXLSXFile xlsx "External Excel XLSX file object";
        output String str "String value";
        external "C" str=ED_getStringFromXLSX(xlsx, cellAddress, sheetName) annotation(
          __iti_dll = "ITI_ED_XLSXFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSXFile.h\"",
          Library = {"ED_XLSXFile", "bsxml-json", "expat", "zlib"});
      end getString;
    end XLSX;

    package XML "XML file functions"
      extends Modelica.Icons.Package;
      function getReal "Get scalar Real value from XML file"
        extends Interfaces.partialGetReal;
        input Types.ExternXMLFile xml "External XML file object";
        external "C" y=ED_getDoubleFromXML(xml, varName) annotation(
          __iti_dll = "ITI_ED_XMLFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XMLFile.h\"",
          Library = {"ED_XMLFile", "bsxml-json", "expat"});
      end getReal;

      function getRealArray1D "Get 1D Real values from XML file"
        extends Modelica.Icons.Function;
        input String varName "Key";
        input Integer n=1 "Number of values";
        input Types.ExternXMLFile xml "External XML file object";
        output Real y[n] "1D Real values";
        external "C" ED_getDoubleArray1DFromXML(xml, varName, y, size(y, 1)) annotation(
          __iti_dll = "ITI_ED_XMLFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XMLFile.h\"",
          Library = {"ED_XMLFile", "bsxml-json", "expat"});
      end getRealArray1D;

      function getRealArray2D "Get 2D Real values from XML file"
        extends Modelica.Icons.Function;
        input String varName "Key";
        input Integer m=1 "Number of rows";
        input Integer n=1 "Number of columns";
        input Types.ExternXMLFile xml "External XML file object";
        output Real y[m,n] "2D Real values";
        external "C" ED_getDoubleArray2DFromXML(xml, varName, y, size(y, 1), size(y, 2)) annotation(
          __iti_dll = "ITI_ED_XMLFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XMLFile.h\"",
          Library = {"ED_XMLFile", "bsxml-json", "expat"});
      end getRealArray2D;

      function getInteger "Get scalar Integer value from XML file"
        extends Interfaces.partialGetInteger;
        input Types.ExternXMLFile xml "External XML file object";
        external "C" y=ED_getIntFromXML(xml, varName) annotation(
          __iti_dll = "ITI_ED_XMLFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XMLFile.h\"",
          Library = {"ED_XMLFile", "bsxml-json", "expat"});
      end getInteger;

      function getBoolean "Get scalar Boolean value from XML file"
        extends Interfaces.partialGetBoolean;
        input Types.ExternXMLFile xml "External XML file object";
        algorithm
          y := getReal(xml=xml, varName=varName) <> 0;
        annotation(Inline=true);
      end getBoolean;

      function getString "Get scalar String value from XML file"
        extends Interfaces.partialGetString;
        input Types.ExternXMLFile xml "External XML file object";
        external "C" str=ED_getStringFromXML(xml, varName) annotation(
          __iti_dll = "ITI_ED_XMLFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XMLFile.h\"",
          Library = {"ED_XMLFile", "bsxml-json", "expat"});
      end getString;
    end XML;
  end Functions;

  package Interfaces "Interfaces"
    extends Modelica.Icons.InterfacesPackage;
    partial function partialGetReal
      extends Modelica.Icons.Function;
      input String varName "Key";
      output Real y "Real value";
    end partialGetReal;

    partial function partialGetInteger
      extends Modelica.Icons.Function;
      input String varName "Key";
      output Integer y "Integer value";
    end partialGetInteger;

    partial function partialGetBoolean
      extends Modelica.Icons.Function;
      input String varName "Key";
      output Boolean y "Boolean value";
    end partialGetBoolean;

    partial function partialGetString
      extends Modelica.Icons.Function;
      input String varName "Key";
      output String str "String value";
    end partialGetString;
  end Interfaces;

  package Types "Types"
    extends Modelica.Icons.TypesPackage;
    class ExternINIFile "External INI file object"
      extends ExternalObject;
      function constructor "Parse INI file"
        extends Modelica.Icons.Function;
        input String fileName "File name";
        input Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
        output ExternINIFile ini "External INI file object";
        external "C" ini=ED_createINI(fileName, verboseRead) annotation(
          __iti_dll = "ITI_ED_INIFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_INIFile.h\"",
          Library = {"ED_INIFile", "bsxml-json"});
      end constructor;

      function destructor "Clean up"
        extends Modelica.Icons.Function;
        input ExternINIFile ini "External INI file object";
        external "C" ED_destroyINI(ini) annotation(
          __iti_dll = "ITI_ED_INIFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_INIFile.h\"",
          Library = {"ED_INIFile", "bsxml-json"});
      end destructor;
    end ExternINIFile;

    class ExternJSONFile "External JSON file object"
      extends ExternalObject;
      function constructor "Parse JSON file"
        extends Modelica.Icons.Function;
        input String fileName "File name";
        input Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
        output ExternJSONFile json "External JSON file object";
        external "C" json=ED_createJSON(fileName, verboseRead) annotation(
          __iti_dll = "ITI_ED_JSONFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_JSONFile.h\"",
          Library = {"ED_JSONFile", "bsxml-json"});
      end constructor;

      function destructor "Clean up"
        extends Modelica.Icons.Function;
        input ExternJSONFile json "External JSON file object";
        external "C" ED_destroyJSON(json) annotation(
          __iti_dll = "ITI_ED_JSONFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_JSONFile.h\"",
          Library = {"ED_JSONFile", "bsxml-json"});
      end destructor;
    end ExternJSONFile;

    class ExternMATFile "External MAT-file object"
      extends ExternalObject;
      function constructor "Only copy MAT-file name (File not yet opened)"
        extends Modelica.Icons.Function;
        input String fileName "File name";
        input Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
        output ExternMATFile mat "External MATLAB MAT-file object";
        external "C" mat=ED_createMAT(fileName, verboseRead) annotation(
          __iti_dll = "ITI_ED_MATFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_MATFile.h\"",
          Library = {"ED_MATFile", "hdf5", "zlib"});
      end constructor;

      function destructor "Clean up"
        extends Modelica.Icons.Function;
        input ExternMATFile mat "External MATLAB MAT-file object";
        external "C" ED_destroyMAT(mat) annotation(
          __iti_dll = "ITI_ED_MATFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_MATFile.h\"",
          Library = {"ED_MATFile", "hdf5", "zlib"});
      end destructor;
    end ExternMATFile;

    class ExternXLSFile "External XLS file object"
      extends ExternalObject;
      function constructor "Open Excel XLS file"
        extends Modelica.Icons.Function;
        input String fileName "File name";
        input String encoding="UTF-8" "Encoding";
        input Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
        output ExternXLSFile xls "External Excel XLS file object";
        external "C" xls=ED_createXLS(fileName, encoding, verboseRead) annotation(
          __iti_dll = "ITI_ED_XLSFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSFile.h\"",
          Library = "ED_XLSFile");
      end constructor;

      function destructor "Clean up"
        extends Modelica.Icons.Function;
        input ExternXLSFile xls "External Excel XLS file object";
        external "C" ED_destroyXLS(xls) annotation(
          __iti_dll = "ITI_ED_XLSFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSFile.h\"",
          Library = "ED_XLSFile");
      end destructor;
    end ExternXLSFile;

    class ExternXLSXFile "External XLSX file object"
      extends ExternalObject;
      function constructor "Parse Excel XLSX file"
        extends Modelica.Icons.Function;
        input String fileName "File name";
        input Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
        output ExternXLSXFile xlsx "External Excel XLSX file object";
        external "C" xlsx=ED_createXLSX(fileName, verboseRead) annotation(
          __iti_dll = "ITI_ED_XLSXFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSXFile.h\"",
          Library = {"ED_XLSXFile", "bsxml-json", "expat", "zlib"});
      end constructor;

      function destructor "Clean up"
        extends Modelica.Icons.Function;
        input ExternXLSXFile xlsx "External Excel XLSX file object";
        external "C" ED_destroyXLSX(xlsx) annotation(
          __iti_dll = "ITI_ED_XLSXFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XLSXFile.h\"",
          Library = {"ED_XLSXFile", "bsxml-json", "expat", "zlib"});
      end destructor;
    end ExternXLSXFile;

    class ExternXMLFile "External XML file object"
      extends ExternalObject;
      function constructor "Parse XML file"
        extends Modelica.Icons.Function;
        input String fileName "File name";
        input Boolean verboseRead=true "= true, if info message that file is loading is to be printed";
        output ExternXMLFile xml "External XML file object";
        external "C" xml=ED_createXML(fileName, verboseRead) annotation(
          __iti_dll = "ITI_ED_XMLFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XMLFile.h\"",
          Library = {"ED_XMLFile", "bsxml-json", "expat"});
      end constructor;

      function destructor "Clean up"
        extends Modelica.Icons.Function;
        input ExternXMLFile xml "External XML file object";
        external "C" ED_destroyXML(xml) annotation(
          __iti_dll = "ITI_ED_XMLFile.dll",
          __iti_dllNoExport = true,
          Include = "#include \"ED_XMLFile.h\"",
          Library = {"ED_XMLFile", "bsxml-json", "expat"});
      end destructor;
    end ExternXMLFile;
  end Types;

  annotation(uses(Modelica(version="3.2.1")), version="2.0.0",
    Documentation(info="<html><p>Library <strong>ExternData</strong> is a Modelica utility library for data access of <a href=\"https://en.wikipedia.org/wiki/INI_file\">INI</a>, <a href=\"https://en.wikipedia.org/wiki/JSON\">JSON</a>, <a href=\"https://en.wikipedia.org/wiki/MATLAB\">MATLAB</a> MAT, <a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel\">Excel</a> <a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel#Binary\">XLS</a>/<a href=\"https://en.wikipedia.org/wiki/Microsoft_Excel#XML_Spreadsheet\">XLSX</a> and <a href=\"https://en.wikipedia.org/wiki/XML\">XML</a> files.</p></html>"));
end ExternData;
