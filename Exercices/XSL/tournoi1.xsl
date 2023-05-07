<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <table border="1" width="100%">
                    <tr >
                        <th>Match</th>
                        <th>Date</th>
                        <th>Score</th>
                    </tr>
                    
                    <xsl:for-each select="/tournoi/match">
                        <tr align="center">
                            <td><xsl:value-of select="concat(equipe[1]/@nom,' ',equipe[2]/@nom)"/></td>
                            <td><xsl:value-of select="concat(@date,' ',@heure)"/></td>
                            <td><xsl:value-of select="concat(equipe[1]/@score,' - ',equipe[2]/@score)"/></td>
                       </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>