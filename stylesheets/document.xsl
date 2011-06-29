<?xml version='1.0'?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:t="http://nwalsh.com/docbook/xsl/template/1.0"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
version="1.0">

<xsl:import href="common.xsl"/>

<xsl:import href="titlepage.xsl"/>

<xsl:param name="generate.toc">
book      toc,title
</xsl:param>

<xsl:param name="toc.section.depth">1</xsl:param>

</xsl:stylesheet>
