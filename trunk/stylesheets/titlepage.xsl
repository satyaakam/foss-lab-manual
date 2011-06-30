<?xml version='1.0'?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format"
version="1.0">

<xsl:template name="book.titlepage.recto">
  <xsl:param name="rev" select="ancestor-or-self::book/bookinfo/revhistory/revision[1]/revnumber"/>

  <fo:block>
    <fo:table inline-progression-dimension="100%" table-layout="fixed">
      <fo:table-column column-width="100%"/>
      <fo:table-body>
	<fo:table-row>
	  <fo:table-cell>
	    <fo:block text-align="left" padding-top="1in">

	    </fo:block>
	  </fo:table-cell>
	</fo:table-row>
        <fo:table-row >
          <fo:table-cell>
            <fo:block text-align="left" font-weight="bold" font-size="26pt" 
		      font-family="Helvetica" padding-top="1in"
		      padding-bottom="0.05in" border-bottom-width="0.5pt"
		      border-bottom-color="red" border-bottom-style="solid">
                  <xsl:apply-templates mode="custom" select="bookinfo/title"/>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
	<xsl:if test="$rev != ''">
        <fo:table-row>
          <fo:table-cell>
            <fo:block text-align="left" font-weight="bold" font-size="20pt" font-family="Helvetica" padding="0.2in">
              <xsl:apply-templates mode="custom" select="//revhistory/revision[1]/revnumber"/>
	      <xsl:text>, </xsl:text>
	      <xsl:apply-templates mode="custom" select="//revhistory/revision[1]/date"/>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>  
        </xsl:if>
        <fo:table-row>
          <fo:table-cell>
	    <fo:block text-align="right">
              <fo:external-graphic src="{$style.dir}/logo.png" width="3in" height="auto" content-width="scale-to-fit" content-height="scale-to-fit"/>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>  
      </fo:table-body> 
    </fo:table>
  </fo:block>
</xsl:template>

<xsl:template name="book.titlepage.verso">
<fo:block padding-top="9in">
This work is licensed under the Creative Commons Attribution-Share
Alike 2.5 India License. To view a copy of this license, visit
http://creativecommons.org/licenses/by-sa/2.5/in/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
</fo:block>
</xsl:template>

</xsl:stylesheet>
