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
                    <tr>
                        <th>Match</th>
                        <th>Equipe1</th>
                        <th>Points</th>
                        <th>Equipe1</th>
                        <th>Points</th>
                    </tr>
                    <xsl:for-each select="/tournoi/match">
                        <tr>
                            <td><xsl:value-of select="position()"/> </td>
                            <td> <xsl:value-of select="equipe[1]/@nom"/></td>
                            <td>
                                <xsl:if test="equipe[1]/@score &gt; equipe[2]/@score"> 2 </xsl:if>
                                <xsl:if test="equipe[1]/@score &lt; equipe[2]/@score"> 0 </xsl:if>
                                <xsl:if test="equipe[1]/@score = equipe[2]/@score"> 1 </xsl:if>
                            </td>
                            <td> <xsl:value-of select="equipe[2]/@nom"/>  </td>
                            <td>
                                <xsl:if test="equipe[1]/@score &gt; equipe[2]/@score"> 0 </xsl:if>
                                <xsl:if test="equipe[1]/@score &lt; equipe[2]/@score"> 2 </xsl:if>
                                <xsl:if test="equipe[1]/@score = equipe[2]/@score"> 1 </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>