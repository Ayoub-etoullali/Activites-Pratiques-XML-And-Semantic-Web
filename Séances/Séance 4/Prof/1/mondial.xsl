<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
   <xsl:output method="html" indent="yes"/>
    <xsl:decimal-format name="monformat" grouping-separator=" " decimal-separator=","/>
    <xsl:param name="popOrder" select="'ascending'"></xsl:param>
    <xsl:param name="continent" select="'africa'"></xsl:param>
    <xsl:param name="continentOrder" select="'africa'"></xsl:param>
   <xsl:template match="/">
     
        
     
             <table border="1" width="100%">
                 <tr>
                     <th>Pays</th>
                     <th id="pop">Population</th>
                     <th>Continent</th>
                 </tr>
                 <xsl:for-each select="mondial/country">
                     <xsl:sort select="population[last()]" order="{$popOrder}" data-type="number"></xsl:sort>
                     <xsl:variable name="continentCls" select="encompassed/@continent"/>
                     <xsl:variable name="bigCls">
                         <xsl:choose>
                             <xsl:when test="population[last()]>100000000">big</xsl:when>
                             <xsl:otherwise>small</xsl:otherwise>
                         </xsl:choose>
                     </xsl:variable>
                     <tr class="{$continentCls} {$bigCls}">
                         <td><xsl:value-of select="name[1]"/></td>
                         <td><xsl:value-of select="format-number(population[last()], '# ##0','monformat')"/></td>
                         <td><xsl:value-of select="encompassed/@continent"/></td>
                     </tr>
                 </xsl:for-each>
             </table>
        
  
   </xsl:template>
</xsl:stylesheet>