<?xml version='1.0'?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:t="http://nwalsh.com/docbook/xsl/template/1.0"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
version="1.0">

<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl"/>

<!-- Media A4 -->

<xsl:param name="page.width">8.27in</xsl:param>
<xsl:param name="page.height">11.69in</xsl:param>

<xsl:param name="generate.toc"></xsl:param>

<!-- Headers and Footers -->
<xsl:param name="header.column.widths">2 1 1</xsl:param>

<xsl:template name="header.content">  
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
  <xsl:param name="rev" select="ancestor-or-self::book/bookinfo/revhistory/revision[1]/revnumber"/>

  <fo:block>
    <xsl:choose>
      <xsl:when test="$sequence = 'blank'">
        <!-- nothing -->
      </xsl:when>

      <xsl:when test="$position='left'">
	<xsl:value-of 
               select="ancestor-or-self::article/articleinfo/title"/>
	<xsl:value-of 
               select="ancestor-or-self::book/bookinfo/title"/>
	<xsl:text> </xsl:text>
	<xsl:value-of
               select="ancestor-or-self::book/bookinfo/subtitle"/>
	<xsl:text> </xsl:text>
        <!-- Same for odd, even, empty, and blank sequences -->
        <xsl:call-template name="draft.text"/>
      </xsl:when>

      <xsl:when test="$position='right'">
	<xsl:if test="$rev != ''">
	<xsl:text>Rev. </xsl:text>
	<xsl:value-of select="$rev"/>
	</xsl:if>
      </xsl:when>

      <xsl:when test="($sequence='odd' or $sequence='even') and $position='center'">
        <xsl:if test="$pageclass != 'titlepage'">
          <xsl:choose>
            <xsl:when test="ancestor::book and ($double.sided != 0)">
              <fo:retrieve-marker retrieve-class-name="section.head.marker"
                                  retrieve-position="first-including-carryover"
                                  retrieve-boundary="page-sequence"/>
            </xsl:when>
          </xsl:choose>
        </xsl:if>
      </xsl:when>

    </xsl:choose>
  </fo:block>

</xsl:template>

<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

  <fo:block>
    <!-- pageclass can be front, body, back -->
    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$pageclass = 'titlepage'">
        <!-- nop; no footer on title pages -->
      </xsl:when>

      <xsl:when test="$position='center'">
        <xsl:text>Zilogic Systems</xsl:text>
      </xsl:when>

      <xsl:when test="$double.sided != 0 and $sequence = 'even'
                      and $position='left'">
        <xsl:text>Page </xsl:text><fo:page-number/>
      </xsl:when>

      <xsl:when test="$double.sided != 0 and ($sequence = 'odd' or $sequence = 'first')
                      and $position='right'">
	<xsl:text>Page </xsl:text><fo:page-number/>
      </xsl:when>

      <xsl:when test="$double.sided = 0 and $position='right'">
        <xsl:text>Page </xsl:text><fo:page-number/>
      </xsl:when>

      <xsl:when test="$sequence='blank'">
        <xsl:choose>
          <xsl:when test="$double.sided != 0 and $position = 'left'">
            <xsl:text>Page </xsl:text><fo:page-number/>
          </xsl:when>
          <xsl:when test="$double.sided = 0 and $position = 'right'">
            <xsl:text>Page </xsl:text><fo:page-number/>
          </xsl:when>
          <xsl:otherwise>
            <!-- nop -->
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>


      <xsl:otherwise>
        <!-- nop -->
      </xsl:otherwise>
    </xsl:choose>
  </fo:block>
</xsl:template>

<xsl:template name="head.sep.rule">
  <xsl:param name="pageclass"/>
  <xsl:param name="sequence"/>
  <xsl:param name="gentext-key"/>

  <xsl:if test="$header.rule != 0">
    <xsl:attribute name="border-bottom-width">2pt</xsl:attribute>
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-color">red</xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:template name="foot.sep.rule">
  <xsl:param name="pageclass"/>
  <xsl:param name="sequence"/>
  <xsl:param name="gentext-key"/>

  <xsl:if test="$footer.rule != 0">
    <xsl:attribute name="border-top-width">2pt</xsl:attribute>
    <xsl:attribute name="border-top-style">solid</xsl:attribute>
    <xsl:attribute name="border-top-color">red</xsl:attribute>
    <xsl:attribute name="padding-top">4pt</xsl:attribute>
  </xsl:if>
</xsl:template>


<!-- Layout -->

<!-- 

We do not center the formal objects, because the tables cannot be
centered with in FOP. So we stick with left aligned formal object. For
left aligned formal objects the caption is best put before the object.

-->

<xsl:param name="body.start.indent">0pt</xsl:param>

<xsl:param name="formal.title.placement">
figure before
example before
equation before
table before
procedure before
</xsl:param>

<xsl:attribute-set name="figure.properties" 
     use-attribute-sets="formal.object.properties"/>

<xsl:attribute-set name="formal.object.properties">
  <xsl:attribute name="keep-together.within-column">always</xsl:attribute> 
</xsl:attribute-set>

<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="margin-left">2em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="list.item.spacing">
  <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
</xsl:attribute-set>

<xsl:template name="itemizedlist.label.markup">
  <xsl:param name="itemsymbol" select="'disc'"/>
  <xsl:choose>
    <xsl:when test="$itemsymbol='none'"></xsl:when>
    <xsl:when test="$itemsymbol='disc'">&#x2022;</xsl:when>
    <xsl:when test="$itemsymbol='bullet'">&#x2022;</xsl:when>
    <xsl:when test="$itemsymbol='endash'">&#x2013;</xsl:when>
    <xsl:when test="$itemsymbol='emdash'">&#x2014;</xsl:when>
    <xsl:otherwise>&#x2022;</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="next.itemsymbol">
  <xsl:param name="itemsymbol" select="'default'"/>
  <xsl:choose>
    <!-- Change this list if you want to change the order of symbols -->
    <xsl:when test="$itemsymbol = 'bullet'">endash</xsl:when>
    <xsl:when test="$itemsymbol = 'endash'">disc</xsl:when>
    <xsl:otherwise>bullet</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Typography -->

<xsl:param name="section.autolabel">1</xsl:param>

<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="font-size">14pt</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level2.properties">
  <xsl:attribute name="font-size">13pt</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level3.properties">
  <xsl:attribute name="font-size">12pt</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level4.properties">
  <xsl:attribute name="font-size">11pt</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="body.font.master">10</xsl:param>
<xsl:param name="body.font.family">Helvetica</xsl:param>

<xsl:param name="draft.watermark.image">file:///usr/share/xml/docbook/stylesheet/nwalsh/images/draft.png</xsl:param>

<!-- We would like to call our examples as listings -->

<xsl:param name="local.l10n.xml" select="document('')"/> 
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
  <l:l10n language="en"> 
    <l:gentext key="Example" text="Listing"/>
    <l:gentext key="example" text="Listing"/>
    <l:gentext key="ListofExamples" text="List of Listings"/>
    <l:gentext key="listofexamples" text="List of Listings"/>
    <l:context name="title">
      <l:template name="example" text="Listing&#160;%n.&#160;%t"/>
    </l:context>
    <l:context name="xref">
      <l:template name="example" text="%t"/>
    </l:context>
    <l:context name="xref-number">
      <l:template name="example" text="Listing&#160;%n"/>
    </l:context>
    <l:context name="xref-number-and-title">
      <l:template name="example" text="Listing&#160;%n, &#8220;%t&#8221;"/>
    </l:context>
  </l:l10n>
</l:i18n>

<!-- A grey background for our listings, gives a better indication of
where the code starts and where it ends. -->

<xsl:param name="shade.verbatim" select="1"></xsl:param>
<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="border-left">0.5pt solid black</xsl:attribute>
  <xsl:attribute name="background-color">#DDDDDD</xsl:attribute>
  <xsl:attribute name="padding">3pt</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="callout.graphics" select="0"></xsl:param>
<xsl:param name="callout.unicode" select="1"></xsl:param>

<xsl:attribute-set name="sidebar.properties" 
        use-attribute-sets="formal.object.properties">
  <xsl:attribute name="text-align">left</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="sidebar.properties" 
        use-attribute-sets="formal.object.properties">
  <xsl:attribute name="border-style">solid</xsl:attribute>
  <xsl:attribute name="border-width">1pt</xsl:attribute>
  <xsl:attribute name="border-color">black</xsl:attribute>
  <xsl:attribute name="background-color">#DDDDDD</xsl:attribute>
  <xsl:attribute name="padding-left">5pt</xsl:attribute>
  <xsl:attribute name="padding-right">5pt</xsl:attribute>
  <xsl:attribute name="padding-top">0pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
  <xsl:attribute name="margin-left">0pt</xsl:attribute>
  <xsl:attribute name="margin-right">0pt</xsl:attribute> 
  <!--
  <xsl:attribute name="margin-top">6pt</xsl:attribute>
  <xsl:attribute name="margin-bottom">6pt</xsl:attribute> 
  -->
</xsl:attribute-set>

<xsl:attribute-set name="sidebar.title.properties">
  <xsl:attribute name="background-color">#000000</xsl:attribute>
  <xsl:attribute name="color">#FFFFFF</xsl:attribute>
  <xsl:attribute name="padding-left">5pt</xsl:attribute>
  <xsl:attribute name="padding-right">5pt</xsl:attribute>
  <xsl:attribute name="padding-top">3pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

<!-- Admonition -->

<xsl:param name="admon.graphics" select="1"></xsl:param>
<xsl:param name="admon.graphics.path"><xsl:value-of select="$style.dir"/>/images/</xsl:param>

<xsl:attribute-set name="admonition.title.properties">
  <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
  <xsl:attribute name="margin-bottom">0pt</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="admonition.properties">
  <xsl:attribute name="padding-top">0pt</xsl:attribute>
  <xsl:attribute name="margin-top">0pt</xsl:attribute>
  <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0pt</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0pt</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="graphical.admonition.properties">
  <xsl:attribute name="border-style">solid</xsl:attribute>
  <xsl:attribute name="border-width">0.5pt</xsl:attribute>
  <xsl:attribute name="border-color">black</xsl:attribute>
  <xsl:attribute name="padding-left">5pt</xsl:attribute>
  <xsl:attribute name="padding-right">5pt</xsl:attribute>
  <xsl:attribute name="padding-top">5pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
  <xsl:attribute name="margin-left">20pt</xsl:attribute>
  <xsl:attribute name="margin-right">20pt</xsl:attribute> 
</xsl:attribute-set>

<!-- API Reference Related -->
<xsl:param name="refentry.generate.title" select="1"></xsl:param>
<xsl:param name="refentry.generate.name" select="0"></xsl:param>
<xsl:param name="refentry.pagebreak" select="0"></xsl:param>

<xsl:attribute-set name="refentry.title.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"></xsl:value-of>
  </xsl:attribute>
  <xsl:attribute name="font-size">20pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="space-after">1em</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.6em</xsl:attribute>
  <xsl:attribute name="border-bottom">0.5pt solid red</xsl:attribute>
  <xsl:attribute name="start-indent"><xsl:value-of select="$title.margin.left"></xsl:value-of></xsl:attribute>
</xsl:attribute-set>

<xsl:template match="funcsynopsisinfo">
  <fo:block font-family="{$monospace.font.family}"
            space-after.minimum="0.8em"
            space-after.optimum="1em"
            space-after.maximum="1.2em">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

</xsl:stylesheet>
