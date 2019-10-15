<?xml version="1.0"?>
<!--
    OpenOffice.org XML to main frame HTML
	(Outputs main frame content file and TOC builder file)
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

<xsl:template match="/">
	<xsl:apply-templates />
</xsl:template>

<xsl:output method="text"/>
<xsl:strip-space elements="*"/>

<xsl:variable name="new_line" select="'&#xA;'"/>
<xsl:variable name="bulletchar" select="'&#x2A;'"/>
<xsl:variable name="doublebulletchar" select="'&#x2A;&#x2A;'"/>
<xsl:variable name="tabchar" select="'&#x09;'"/>
<xsl:variable name="spacechar" select="'&#x20;'"/>
<xsl:variable name="listnum" select="'&#x23;'"/>
<xsl:variable name="literalBlockStart" select="'&#x3A;&#x3A;'"/>
<xsl:variable name="literalQuote" select="'&#x60;'"/>
<xsl:variable name="literalDoubleQuote" select="'&#x60;&#x60;'"/>
<xsl:variable name="hyperlinkBegin" select="'&#x20;&#x3C;'"/>
<xsl:variable name="hyperlinkEnd" select="'&#x3E;&#x60;&#x5F;'"/>
 
<!-- Headers -->
	<!-- Note: By convention, there can only be one "header1" level per file, and it is the 1st line of the file -->
	<xsl:template match="//text:h[@text:style-name='header1']">
		<xsl:call-template name="hdrlvl1"/>
	</xsl:template>
	
	<xsl:template match="//text:p[@text:style-name='header1']">
		<xsl:call-template name="hdrlvl1"/>
	</xsl:template>
	
	<xsl:template match="//text:h[@text:style-name='header2']">
                <xsl:if test="string-length(node()) > 0"> 
                        <xsl:call-template name="hdrlvl2"/>
                </xsl:if>
	</xsl:template>
	
	<xsl:template match="//text:p[@text:style-name='header2']">
                <xsl:if test="string-length(node()) > 0"> 
                        <xsl:call-template name="hdrlvl2"/>
                </xsl:if>
	</xsl:template>
	
	<xsl:template match="//text:h[@text:style-name='header3']">
                <xsl:if test="string-length(node()) > 0"> 
                        <xsl:call-template name="hdrlvl3"/>
                </xsl:if>
	</xsl:template>

	<xsl:template match="//text:p[@text:style-name='header3']">
                <xsl:if test="string-length(node()) > 0"> 
                        <xsl:call-template name="hdrlvl3"/>
                </xsl:if>
	</xsl:template>

<!-- Paragraphs -->
	<xsl:template match="//text:p[@text:style-name='paragraph']">
                <xsl:call-template name="contentblock"/>
	</xsl:template>
	
	<xsl:template match="//text:p[@text:style-name='literalBlockFirst']">
		<xsl:value-of select="$new_line"/>
		<xsl:value-of select="$literalBlockStart"/>
		<xsl:value-of select="$new_line"/><xsl:value-of select="$new_line"/><xsl:value-of select="$tabchar"/>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:p[@text:style-name='literalBlock']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$tabchar"/>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:p[@text:style-name='literalBlockLast']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$tabchar"/>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:tab">
		<xsl:value-of select="$tabchar"/>
	</xsl:template>

<!-- Enumerated Lists -->
	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='enumFirst']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$new_line"/>
		<xsl:value-of select="$listnum" />.<xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='enum']">
		<xsl:value-of select="$new_line"/>
		<xsl:value-of select="$listnum" />.<xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='enumLast']">
		<xsl:value-of select="$new_line"/>
		<xsl:value-of select="$listnum" />.<xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
		<xsl:value-of select="$new_line"/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='enumIndent']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$tabchar"/>
		<xsl:value-of select="$listnum" />.<xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='enumIndentLast']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$tabchar"/>
		<xsl:value-of select="$listnum" />.<xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
		<xsl:value-of select="$new_line"/>
	</xsl:template>

<!-- Bulleted Lists -->
	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='bulletFirst']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$new_line"/>
		<xsl:value-of select="$bulletchar" /><xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='bullet']">
		<xsl:value-of select="$new_line"/>
		<xsl:value-of select="$bulletchar" /><xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='bulletLast']">
		<xsl:value-of select="$new_line"/>
		<xsl:value-of select="$bulletchar" /><xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
		<xsl:value-of select="$new_line"/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='bulletIndentFirst']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$new_line"/><xsl:value-of select="$tabchar"/>
		<xsl:value-of select="$bulletchar" /><xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='bulletIndent']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$tabchar"/>
		<xsl:value-of select="$bulletchar" /><xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:list/text:list-item/text:p[@text:style-name='bulletIndentLast']">
		<xsl:value-of select="$new_line"/><xsl:value-of select="$tabchar"/>
		<xsl:value-of select="$bulletchar" /><xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
		<xsl:value-of select="$new_line"/>
	</xsl:template>

<!-- Table -->
	<xsl:template match="//table:table">
	</xsl:template>
	
	<xsl:template match="//table:table-row">
	</xsl:template>
	
	<xsl:template match="//text:p[@text:style-name='Table_20_Heading']">
	</xsl:template>
	
	<xsl:template match="//text:p[@text:style-name='Table_20_Contents']">
	</xsl:template>

<!-- Image -->
	<xsl:template match="//draw:image">
		<xsl:apply-templates/>
	</xsl:template>

<!-- Caption -->
	<xsl:template match="//text:p[@text:style-name='Illustration']">
		<xsl:apply-templates/>
	</xsl:template>

<!-- Hyperlink (source/target) -->
	 <xsl:template match="//text:p/text:a">
		<xsl:value-of select="$literalQuote"/>
		<xsl:apply-templates/>
		<xsl:value-of select="$hyperlinkBegin"/>
		<xsl:value-of select="@xlink:href"/>
		<xsl:value-of select="$hyperlinkEnd"/>
	</xsl:template>

<!-- Note -->
	<xsl:template match="//text:p[@text:style-name='Note']">
		<xsl:apply-templates/>
	</xsl:template>

<!-- Formula -->
	<xsl:template match="//text:p[@text:style-name='Formula']">
		<xsl:apply-templates/>
	</xsl:template>
	
<!-- Example -->
	<xsl:template match="//text:p[@text:style-name='Text_20_body_20_Example']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="//text:p[@text:style-name='Text_20_body_20_Example_20_Indent']">
		<xsl:apply-templates/>
	</xsl:template>
	
<!-- Misc -->
	<xsl:template match="//office:meta">
	</xsl:template>

	<xsl:template match="//office:settings">
	</xsl:template>

<!-- Character Styles -->
	<xsl:template match="//text:span[@text:style-name='literal']">
		<xsl:value-of select="$literalDoubleQuote"/><xsl:apply-templates/><xsl:value-of select="$literalDoubleQuote"/>
	</xsl:template>
	
	<xsl:template match="//text:span[@text:style-name='hyperlink']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="//text:span[@text:style-name='rstItalic']">
		<xsl:value-of select="$bulletchar" /><xsl:apply-templates/><xsl:value-of select="$bulletchar" />
	</xsl:template>
	
	<xsl:template match="//text:span[@text:style-name='rstBold']">
		<xsl:value-of select="$doublebulletchar" /><xsl:apply-templates/><xsl:value-of select="$doublebulletchar" />
	</xsl:template>
<!--	
	 <xsl:template match="//text:a">
		<xsl:apply-templates/>
	</xsl:template>
-->
<!-- Special Characters -->
<!--
	<xsl:template match="//text:span[@text:style-name='ZZ']">
		&#937;
		<xsl:apply-templates/>F
	</xsl:template>
-->

<!-- subroutines -->
	<xsl:template name="hdrlvl1">
		<xsl:value-of select="$new_line" />
		<xsl:apply-templates/>
=========================================================================
	</xsl:template>
	
	<xsl:template name="hdrlvl2">
		<xsl:value-of select="$new_line" />
		<xsl:value-of select="$new_line" />
		<xsl:apply-templates/>
-------------------------------------------------------------------------
	</xsl:template>
	
	<xsl:template name="hdrlvl3">
		<xsl:value-of select="$new_line" />
		<xsl:value-of select="$new_line" />
		<xsl:apply-templates/>
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	</xsl:template>

	<xsl:template name="contentblock">
		<xsl:value-of select="$new_line" /><xsl:value-of select="$new_line" />
		<xsl:apply-templates/>
	</xsl:template>

<!-- oO text styles -->

<!-- exclusions -->
        
</xsl:stylesheet>
