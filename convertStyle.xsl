<?xml version="1.0"?>
<!--
    OpenOffice.org XML to OpenOffice.org XML
	(Identity transform, restoring parent style name attributes)
-->
<xsl:stylesheet version="2.0"
    xmlns:math="http://www.w3.org/1998/Math/MathML"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dom="http://www.w3.org/2001/xml-events"
    xmlns:xforms="http://www.w3.org/2002/xforms"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0"
    xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0"
    xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0"
    xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
    xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
    xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0"
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
    xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
    xmlns:oooc="http://openoffice.org/2004/calc"
    xmlns:ooo="http://openoffice.org/2004/office"
    xmlns:ooow="http://openoffice.org/2004/writer"
    >

<xsl:output method="xml"/>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<!-- Restore renames styles -->

<xsl:template match="text:p[@text:style-name='P1']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P1']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P2']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P2']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P3']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P3']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P4']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P4']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P5']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P5']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P6']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P6']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P7']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P7']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P8']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P8']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P9']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P9']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P10']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P10']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P11']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P11']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P12']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P12']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P13']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P13']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P14']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P14']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P15']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P15']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P16']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P16']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P17']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P17']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P18']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P18']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P19']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P19']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<xsl:template match="text:p[@text:style-name='P20']">
  <text:p text:style-name="{//office:automatic-styles/style:style[@style:name='P20']/@style:parent-style-name}">
    <xsl:apply-templates/>
  </text:p>
</xsl:template>

<!-- Remove non-meaningful styles -->
<xsl:template match="//text:soft-page-break"/>

</xsl:stylesheet>
