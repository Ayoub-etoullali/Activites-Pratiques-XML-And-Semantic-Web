<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" indent="yes"/>
   
    
    <xsl:template match="//commandes">
        <html>
            <head></head>
            <body>
                <table border="1" cellpadding="2" width="100%">
                    <tr>
                        <th>REF</th>
                        <th>Prix</th>
                        <th>Qte</th>
                        <th>STT</th>
                    </tr>
                    <xsl:variable name="total" select="0"/>
                    <xsl:for-each select="commande[1]/entree">
                        <tr>
                            <td><xsl:value-of select="@ref"/></td>
                            <td align="right"><xsl:value-of select="@prix"/></td>
                            <td align="right"><xsl:value-of select="@quantite"/></td>
                            <td align="right"><xsl:value-of select="@prix * @quantite"></xsl:value-of></td>
                           
                        </tr>
                    </xsl:for-each>
                    <tr><td colspan="4" align="right"> 
                        <xsl:call-template name="totalTpl">
                            <xsl:with-param name="entrees" select="commande[1]/entree"/>
                        </xsl:call-template>
                    </td></tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="totalTpl">
        <xsl:param name="entrees" />
        <xsl:param name="sous_total" select="0"/>
        <xsl:variable name="first_entree" select="$entrees[1]"/>
        <xsl:variable name="next_entrees" select="$entrees[position() != 1]"/>
        <xsl:choose>
            <xsl:when test="count($first_entree) = 0">
                <xsl:value-of select="$sous_total + $first_entree/@prix * $first_entree/@quantite"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="totalTpl">
                    <xsl:with-param name="entrees" select="$next_entrees"/>
                    <xsl:with-param name="sous_total" select="$sous_total + $first_entree/@prix * $first_entree/@quantite"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
   
   
    
</xsl:stylesheet>