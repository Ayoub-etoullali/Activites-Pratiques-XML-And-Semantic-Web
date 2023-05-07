<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head><title>XSL YEST></title></head>
            <body>
                <h1>Bonjour ENSET</h1>
                
                <xsl:value-of select="//name"/>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>