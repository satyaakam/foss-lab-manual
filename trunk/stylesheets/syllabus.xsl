<?xml version='1.0'?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:t="http://nwalsh.com/docbook/xsl/template/1.0"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
version="1.0">

<xsl:import href="common.xsl"/>
<xsl:param name="column.count.body" select="2"/>

<xsl:attribute-set name="list.item.spacing">
  <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
