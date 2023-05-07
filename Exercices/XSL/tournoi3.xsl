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
                        <th>Equipe</th>
                        <th>Buts marqués</th>
                        <th>Buts encaissés</th>
                        <th>Points</th>
                    </tr>

                    <xsl:for-each select="/tournoi/match">
                       
                        <xsl:for-each select="equipe">
                            <xsl:sort select="@nom"/>
                            
                        <tr align="center">
                            <td> 
                                <xsl:value-of select="@nom"/>
                            </td>
                            <td>
                                <xsl:value-of select="../equipe[1]/@score"/>
                             
                            </td>
                            <td> 
                                <xsl:value-of select="../equipe[2]/@score"/>
                             
                            </td>
                            <td>
                                
                                    <xsl:if test="../equipe[1]/@score &gt; ../equipe[2]/@score"> 2 </xsl:if>
                                <xsl:if test="../equipe[1]/@score &lt; ../equipe[2]/@score"> 0 </xsl:if>
                                <xsl:if test="../equipe[1]/@score = ../equipe[2]/@score"> 1 </xsl:if>
                                 
                            </td>
                        </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>