<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:key name="index" match="*" use="@nom"></xsl:key>
    <xsl:template match="/">
        
        <html> 
            <body>
                
                <table border="1">
                    <tr >
                        <th style="text-align:center">Equipes</th>
                        
                    </tr>
                    <xsl:for-each select="//*[generate-id()=generate-id(key('index',@nom)[1])]">
                        <tr>
                            <td><xsl:value-of select="@nom" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>