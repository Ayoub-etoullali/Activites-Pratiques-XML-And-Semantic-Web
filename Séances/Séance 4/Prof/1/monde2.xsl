<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <table>
                    <tr>
                        <th>Pays</th>
                        <th>Villes</th>
                    </tr>
                    <xsl:apply-templates select="mondial/country"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="country">
        <tr>
            <td><xsl:value-of select="name[1]"/></td>
            <td><ul><xsl:apply-templates select=".//city"/></ul></td>
        </tr>
    </xsl:template>
    <xsl:template match="city">
        <li>
            <xsl:value-of select="name[1]"/>
            
        </li>
    </xsl:template>
</xsl:stylesheet>