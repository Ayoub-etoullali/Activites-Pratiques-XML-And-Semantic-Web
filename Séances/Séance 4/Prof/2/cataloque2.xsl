<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" indent="yes"/>
    <!-- Ce code marche ???!!!!  -->
    <xsl:template match="/catalogue">
        
        <html>
            <head></head>
            <body>
                <table border="1" celppading="3" width="100%">
                    <tr>
                        <th> REF </th>
                        <th > PRIX </th>
                        <th > QTE </th>
                        <th > STT </th>
                    </tr>
                    <xsl:apply-templates select="commandes/commande[1]/entree" />
                    
                    
                    
                    <tr>
                        <td align="right"  colspan="4">
                            
                            <xsl:call-template name="facture">
                                <xsl:with-param name="entrees" select="commandes/commande[1]/entree"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template  match="entree" >
        
        <tr>
            <td> <xsl:value-of select="@ref"/></td>
            <td align="right"> <xsl:value-of select="@prix"/></td>
            <td align="right"> <xsl:value-of select="@quantite"/></td>
            <td align="right"> <xsl:value-of select="@prix * @quantite"></xsl:value-of></td>
        </tr>
    </xsl:template>
    <xsl:template name="facture">
        <xsl:param name="entrees" />
        <xsl:param name="value" select="0" />
        <xsl:variable name="first_entree" select="$entrees[ 1 ]"/>
        <xsl:variable name="next_entrees" select="$entrees[position() != 1]"/>
        <xsl:choose>
            <xsl:when test="count($first_entree) != 0">
                <xsl:call-template name="facture">
                    <xsl:with-param name="entrees" select="$next_entrees"/>
                    <xsl:with-param name="value" select="$value + $first_entree/@prix * $first_entree/@quantite"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise> <xsl:value-of select="$value"/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>