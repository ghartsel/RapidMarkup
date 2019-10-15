<?xml version="1.0"?>
<!--
    OpenOffice.org XML (.fodt) to Markdown (.md)

	https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
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
<xsl:variable name="bangchar" select="'&#x21;'"/>
<xsl:variable name="colborder" select="'&#x7C;'"/>
<xsl:variable name="rowborder" select="'&#x7C;&#x2D;&#x2D;&#x2D;'"/>
<xsl:variable name="listnum" select="'&#x31;'"/>
<xsl:variable name="literalBlockBound" select="'&#x60;&#x60;&#x60;'"/>
<xsl:variable name="literalQuote" select="'&#x60;'"/>
<xsl:variable name="literalDoubleQuote" select="'&#x60;&#x60;'"/>
<xsl:variable name="hyperlinkBegin" select="'&#x20;&#x3C;'"/>
<xsl:variable name="hyperlinkEnd" select="'&#x3E;&#x60;&#x5F;'"/>
<xsl:variable name="bracketOpen" select="'&#x5B;'"/>
<xsl:variable name="bracketClose" select="'&#x5D;'"/>
<xsl:variable name="parenOpen" select="'&#x28;'"/>
<xsl:variable name="parenClose" select="'&#x29;'"/>
 
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
		<xsl:value-of select="$new_line"/><xsl:value-of select="$new_line"/>
		<xsl:value-of select="$literalBlockBound"/>
		<xsl:value-of select="$new_line"/>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:p[@text:style-name='literalBlock']">
		<xsl:value-of select="$new_line"/>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//text:p[@text:style-name='literalBlockLast']">
		<xsl:value-of select="$new_line"/>
		<xsl:apply-templates/>
		<xsl:value-of select="$new_line"/>
		<xsl:value-of select="$literalBlockBound"/>
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
<!--
	| Col1 Heading | Col2 Heading | Col3 Heading |
	| <3 rowlborder> | <3 rowlborder> | <3 rowlborder>
	| Cell 1a | Cell 2a | Cell 3a 
	| Cell 1b | Cell 2b | Cell 3b 
-->	
	<xsl:template match="//table:table">
		<xsl:value-of select="$new_line" />
		<xsl:for-each select="table:table-row">
			<xsl:value-of select="$new_line" />
			<xsl:for-each select="table:table-cell">
				<xsl:value-of select="$colborder"/><xsl:value-of select="$spacechar" />
				<xsl:apply-templates/>
				<xsl:value-of select="$spacechar" />
				<xsl:if test="position()=last()">
					<xsl:if test=".//@text:style-name = 'Table_20_Heading'">
						<xsl:value-of select="$new_line"/><xsl:value-of select="$rowborder"/>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

<!--
	<xsl:template match="//text:p[@text:style-name='Table_20_Heading']">
		<xsl:value-of select="$colborder"/><xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
		<xsl:value-of select="$spacechar" />
	</xsl:template>
	
	<xsl:template match="//text:p[@text:style-name='Table_20_Contents']">
		<xsl:value-of select="$colborder"/><xsl:value-of select="$spacechar" />
		<xsl:apply-templates/>
		<xsl:value-of select="$spacechar" />
	</xsl:template>
-->	

<!-- Image -->
	<xsl:template match="//draw:image">
		<xsl:value-of select="$bangchar"/><xsl:value-of select="$bracketOpen"/>[Image]<xsl:value-of select="$bracketClose"/>
		<xsl:value-of select="$parenOpen"/>
		<xsl:value-of select="@xlink:href"/>
		<xsl:value-of select="$parenClose"/>
	</xsl:template>

<!-- Caption -->
	<xsl:template match="//text:p[@text:style-name='Illustration']">
		<xsl:apply-templates/>
	</xsl:template>

<!-- Hyperlink (source/target) -->
	 <xsl:template match="//text:p/text:a">
		<xsl:value-of select="$bracketOpen"/>
		<xsl:apply-templates/>
		<xsl:value-of select="$bracketClose"/>
		<xsl:value-of select="$parenOpen"/>
		<xsl:value-of select="@xlink:href"/>
		<xsl:value-of select="$parenClose"/>
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
		<xsl:value-of select="$literalQuote"/><xsl:apply-templates/><xsl:value-of select="$literalQuote"/>
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
#<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template name="hdrlvl2">
		<xsl:value-of select="$new_line" />
		<xsl:value-of select="$new_line" />
##<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template name="hdrlvl3">
		<xsl:value-of select="$new_line" />
		<xsl:value-of select="$new_line" />
###<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name="contentblock">
		<xsl:value-of select="$new_line" /><xsl:value-of select="$new_line" />
		<xsl:apply-templates/>
	</xsl:template>

<!-- oO text styles -->

<!-- exclusions -->
        
</xsl:stylesheet>
