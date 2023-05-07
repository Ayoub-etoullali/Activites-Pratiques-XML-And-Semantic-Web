<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:key name="index" match="*" use="@nom"></xsl:key>
    <xsl:template match="/">
        
        <html> 
            <body>
                
                <table border="1" style="text-align:center" width="100%">
                    <tr style="text-align:center">
                        <th >Equipes</th>
                        <th>Points</th>
                    </tr>
                    <xsl:for-each select="//*[generate-id()=generate-id(key('index',@nom)[1])]">
                        
                        
                        <tr style="text-align:center">
                            <td><xsl:value-of select="@nom"/></td>
                            <td><xsl:value-of select="sum(@score)" /></td>
                        </tr>
                        
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>