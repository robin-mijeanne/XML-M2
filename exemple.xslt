<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output 
        method="html"
        encoding="UTF-8"
        doctype-public="-//W3C//DTD HTML 4.01//EN"
        doctype-system="http://www.w3.org/TR/html4/strict.dtd"
        indent="yes" />
    
    <xsl:template match="/">
        <html>
                <head>
                    <title>Festival de cannes 2016</title>
                    <link type="text/css" rel="stylesheet" href="style.css"/>
                </head>

                <body>
                    <xsl:for-each select="//film">
                        <xsl:call-template name="film">
                            <xsl:with-param name="film" select="$film" />
                        </xsl:call-template>
                    </xsl:for-each>

                </body>
        </html>
    </xsl:template>

    <xsl:template name="film">
        <xsl:param name="film"/>
        <h2><xsl:value-of select="$film/titre" /></h2>
    </xsl:template>
</xsl:stylesheet>
